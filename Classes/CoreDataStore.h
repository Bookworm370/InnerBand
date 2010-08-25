//
//  CoreDataStore.h
//  SportsAuthority
//
//  Created by John Blanco on 3/18/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStore : NSObject {
}

+ (NSManagedObjectContext *)managedObjectContext;
+ (NSManagedObjectModel *)managedObjectModel;
+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

// clears all data from peristent store and re-initializes (great for unit testing!)
+ (void)clearAllData;

+ (void)save;

/* Returns ALL objects for an entity. */
+ (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error;

/* Returns ALL objects for an entity given a predicate. */
+ (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error;

/* Returns ALL objects for an entity given a predicate and sorting. */
+ (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error;

/* Returns ALL objects for an entity ordered by a field. */
+ (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error;

/* Returns a single entity by name. */
+ (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error;

/* Returns a single entity with the specified key/value. */
+ (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSString *)value error:(NSError **)error;

/* Create a new entity by name. */
+ (NSManagedObject *)createNewEntityByName:(NSString *)entityName;

/* Remove entity. */
+ (void)removeEntity:(NSManagedObject *)entity;

/* Remove all objects of an entity. */
+ (void)removeAllEntitiesByName:(NSString *)entityName;

/* Returns an entity description by name. */
+ (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName;

/* Returns documents directory path. */
+ (NSString *)applicationDocumentsDirectory;

@end
