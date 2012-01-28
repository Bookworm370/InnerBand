//
//  CoreDataCoreDataStore.m
//  InnerBand
//
//  InnerBand - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "CoreDataStore.h"
#import "Macros.h"
#import "Functions.h"

// global Core Data objects
#if __has_feature(objc_arc)
    __strong static NSManagedObjectModel *gManagedObjectModel;
    __strong static NSPersistentStoreCoordinator *gPersistentStoreCoordinator;
#else
    static NSManagedObjectModel *gManagedObjectModel;
    static NSPersistentStoreCoordinator *gPersistentStoreCoordinator;
#endif

// main thread singleton
static CoreDataStore *gMainStoreInstance;

@interface CoreDataStore ()

- (void)createManagedObjectContext;

@end

@implementation CoreDataStore

+ (CoreDataStore *)mainStore {
	@synchronized (self) {
		if (!gMainStoreInstance) {
			gMainStoreInstance = [[CoreDataStore alloc] init];
		}
	}
	
	return gMainStoreInstance;
}

+ (CoreDataStore *)createStore {
    #if __has_feature(objc_arc)
        return [[CoreDataStore alloc] init];
    #else
        return [[[CoreDataStore alloc] init] autorelease];
    #endif    
}

+ (void)initialize {
	NSError *error = nil;

	// create the global managed object model
    #if __has_feature(objc_arc)
        gManagedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];    
    #else
        gManagedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    #endif

	// create the global persistent store
    gPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:gManagedObjectModel];
	
	NSString *storeLocation = [DOCUMENTS_DIR() stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
	NSURL *storeURL = [NSURL fileURLWithPath:storeLocation];
	
	if (![gPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
		NSLog(@"Error creating persistantStoreCoordinator: %@, %@", error, [error userInfo]);
		abort();
    }    
}

- (id)init {
	if ((self = [super init])) {
		[self createManagedObjectContext];
	}
	
	return self;
}
				 
#if !__has_feature(objc_arc)
    - (void)dealloc {
        [_managedObjectContext release];    
        [super dealloc];
    }
#endif

#pragma mark -

- (NSManagedObjectContext *)context {
	return _managedObjectContext;
}

- (void)clearAllData {
	NSError *error = nil;
	
	// clear existing stack
	SAFE_RELEASE(gManagedObjectModel);
	SAFE_RELEASE(gPersistentStoreCoordinator);
	SAFE_RELEASE(_managedObjectContext);
	
	// remove persistence file
	NSString *storeLocation = [DOCUMENTS_DIR() stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
	NSURL *storeURL = [NSURL fileURLWithPath:storeLocation];
	
	// remove
	@try {
		[[NSFileManager defaultManager] removeItemAtPath:storeURL.path error:&error];
	} @catch (NSException *exception) {
		// ignore, totally normal
	}
	
	// init again
	[CoreDataStore initialize];
	[self createManagedObjectContext];
}

/**
 Save the context.
 */
- (void)save { 
	NSError *error = nil;
	
	if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
		NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
		
		if(detailedErrors != nil && [detailedErrors count] > 0) {
			for(NSError* detailedError in detailedErrors) {
				NSLog(@"  DetailedError: %@", [detailedError userInfo]);
			}
		}
		else {
			NSLog(@"  %@", [error userInfo]);
		}
	} 
}

#pragma mark - Deprecated Accessors (Use NSManagedObject+InnerBand)

- (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error {
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
	
	// execute
	NSArray *ret = [_managedObjectContext executeFetchRequest:request error:error];

	return ret;
}

- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error {
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
	
	// predicate
	[request setPredicate:predicate];
	
	// execute
	return [_managedObjectContext executeFetchRequest:request error:error];
}

- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
	
	// predicate
	[request setPredicate:predicate];
	[request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	
	// execute
	return [_managedObjectContext executeFetchRequest:request error:error];
}

- (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
	
	// predicate
	[request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	 
	// execute
	return [_managedObjectContext executeFetchRequest:request error:error];
}

- (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error {
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
	
	// execute
	NSArray *values = [_managedObjectContext executeFetchRequest:request error:error];
	
	if (values.count > 0) {
		// this method is designed for accessing a single object, but if there's more just give the first
		return (NSManagedObject *)[values objectAtIndex:0];
	}
	
	return nil;
}

- (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSObject *)value error:(NSError **)error {
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];

	// predicate
	[request setPredicate:predicate];
	 
	// execute
	NSArray *values = [_managedObjectContext executeFetchRequest:request error:error];
	
	if (values.count > 0) {
		// this method is designed for accessing a single object, but if there's more just give the first
		return (NSManagedObject *)[values objectAtIndex:0];
	}
	
	return nil;
}

- (NSManagedObject *)entityByURI:(NSURL *)uri {
	NSManagedObjectID *oid = [gPersistentStoreCoordinator managedObjectIDForURIRepresentation:uri]; 

    return [self entityByObjectID:oid];
}

- (NSManagedObject *)entityByObjectID:(NSManagedObjectID *)oid {
	if (oid) {
		return [_managedObjectContext objectWithID:oid];
	}
    
	return nil;    
}

- (NSManagedObject *)createNewEntityByName:(NSString *)entityName {
	return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_managedObjectContext]; 
}

- (void)removeEntity:(NSManagedObject *)entity {
	@try {
		[_managedObjectContext deleteObject:entity];
	} @catch(id exception) {}
}

/* Remove all objects of an entity. */
- (void)removeAllEntitiesByName:(NSString *)entityName {
	NSError *error = nil;
	
	// get all objects for entity
	// TODO: we can fetch these in a more minimalistic way, would be faster, so do it if we have time
	NSArray *objects = [self allForEntity:entityName error:&error];
	
	for (NSManagedObject *iObject in objects) {
		[_managedObjectContext deleteObject:iObject];
	}
}

- (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName {
	return [NSEntityDescription entityForName:entityName inManagedObjectContext:_managedObjectContext];
}

#pragma mark -

- (void)createManagedObjectContext {
	_managedObjectContext = [[NSManagedObjectContext alloc] init];
	[_managedObjectContext setPersistentStoreCoordinator:gPersistentStoreCoordinator];
}

@end
