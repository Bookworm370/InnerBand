//
//  CoreDataCoreDataStore.m
//  iBoost
//
//  iBoost - The iOS Booster!
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

// static CoreData components
static NSManagedObjectModel *gManagedObjectModel = nil;
static NSManagedObjectContext *gManagedObjectContext = nil;	    
static NSPersistentStoreCoordinator *gPersistentStoreCoordinator = nil;

@implementation CoreDataStore

+ (void)initialize {
}

+ (void)dealloc {
    [gManagedObjectContext release];
    [gManagedObjectModel release];
    [gPersistentStoreCoordinator release];
    
	[super dealloc];
}

#pragma mark -

+ (void)clearAllData {
	NSError *error = nil;
	
	// clear existing stack
	RELEASE_AND_NIL(gManagedObjectContext);
	RELEASE_AND_NIL(gManagedObjectModel);
	RELEASE_AND_NIL(gPersistentStoreCoordinator);
	
	// remove persistence file
	NSString *storeLocation = [[CoreDataStore applicationDocumentsDirectory] stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
	NSURL *storeURL = [NSURL fileURLWithPath:storeLocation];
	
	// remove
	@try {
		[[NSFileManager defaultManager] removeItemAtPath:storeURL.path error:&error];
	} @catch (NSException *exception) {
		// ignore, totally normal
	}
	
	// init some fields
	(void)(self.managedObjectContext);
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
+ (NSManagedObjectContext *)managedObjectContext {
    if (gManagedObjectContext != nil) {
        return gManagedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [CoreDataStore persistentStoreCoordinator];
	
    if (coordinator != nil) {
        gManagedObjectContext = [[NSManagedObjectContext alloc] init];
        [gManagedObjectContext setPersistentStoreCoordinator:coordinator];
    }
	
    return gManagedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
+ (NSManagedObjectModel *)managedObjectModel {
    if (gManagedObjectModel != nil) {
        return gManagedObjectModel;
    }
	
    gManagedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
	
    return gManagedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	NSError *error = nil;

    if (gPersistentStoreCoordinator != nil) {
        return gPersistentStoreCoordinator;
    }
	
    gPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];

	NSString *storeLocation = [[CoreDataStore applicationDocumentsDirectory] stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
	NSURL *storeURL = [NSURL fileURLWithPath:storeLocation];

	if (![gPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		NSLog(@"Error creating persistantStoreCoordinator: %@, %@", error, [error userInfo]);
		abort();
    }    
	
    return gPersistentStoreCoordinator;
}

/**
 Save the context.
 */
+ (void)save { 
	NSError *error = nil;
	NSManagedObjectContext *context = [CoreDataStore managedObjectContext];
	
	if (context != nil) {
		if ([context hasChanges] && ![context save:&error]) {
			NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
			
			if(detailedErrors != nil && [detailedErrors count] > 0) {
				for(NSError* detailedError in detailedErrors) {
					NSLog(@"  DetailedError: %@", [detailedError userInfo]);
				}
			}
			else {
				NSLog(@"  %@", [error userInfo]);
			}
			
			abort();
		} 
	}
}

#pragma mark -

+ (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error {
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	
	// entity
	[request setEntity:[self entityDescriptionForEntity:entityName]];
	
	// execute
	NSArray *ret = [gManagedObjectContext executeFetchRequest:request error:error];

	return ret;
}

+ (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error {
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	
	// entity
	[request setEntity:[self entityDescriptionForEntity:entityName]];
	[request setPredicate:predicate];
	
	// execute
	return [gManagedObjectContext executeFetchRequest:request error:error];
}

+ (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:key ascending:ascending] autorelease];
	
	// entity
	[request setEntity:[self entityDescriptionForEntity:entityName]];
	[request setPredicate:predicate];
	[request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	
	// execute
	return [gManagedObjectContext executeFetchRequest:request error:error];
}

+ (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:key ascending:ascending] autorelease];
	
	// entity
	[request setEntity:[self entityDescriptionForEntity:entityName]];
	[request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	 
	// execute
	return [gManagedObjectContext executeFetchRequest:request error:error];
}

+ (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error {
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	
	// entity
	[request setEntity:[self entityDescriptionForEntity:entityName]];
	
	// execute
	NSArray *values = [gManagedObjectContext executeFetchRequest:request error:error];
	
	if (values.count > 0) {
		// this method is designed for accessing a single object, but if there's more just give the first
		return (NSManagedObject *)[values objectAtIndex:0];
	}
	
	return nil;
}

+ (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSObject *)value error:(NSError **)error {
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	
	[request setPredicate:predicate];
	 
	// entity
	[request setEntity:[self entityDescriptionForEntity:entityName]];
	
	// execute
	NSArray *values = [gManagedObjectContext executeFetchRequest:request error:error];
	
	if (values.count > 0) {
		// this method is designed for accessing a single object, but if there's more just give the first
		return (NSManagedObject *)[values objectAtIndex:0];
	}
	
	return nil;
}

+ (NSManagedObject *)entityByURI:(NSURL *)uri {
	NSManagedObjectID *objectID = [gPersistentStoreCoordinator managedObjectIDForURIRepresentation:uri]; 

	if (objectID) {
		return [gManagedObjectContext objectWithID:objectID];
	}

	return nil;
}

+ (NSManagedObject *)createNewEntityByName:(NSString *)entityName {
	return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:gManagedObjectContext]; 
}

+ (void)removeEntity:(NSManagedObject *)entity {
	@try {
		[gManagedObjectContext deleteObject:entity];
	} @catch(id exception) {}
}

/* Remove all objects of an entity. */
+ (void)removeAllEntitiesByName:(NSString *)entityName {
	NSError *error = nil;
	
	// get all objects for entity
	// TODO: we can fetch these in a more minimalistic way, would be faster, so do it if we have time
	NSArray *objects = [CoreDataStore allForEntity:entityName error:&error];
	
	for (NSManagedObject *iObject in objects) {
		[gManagedObjectContext deleteObject:iObject];
	}
}

+ (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName {
	NSManagedObjectContext *context = [CoreDataStore managedObjectContext];
	
	return [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
}

+ (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
