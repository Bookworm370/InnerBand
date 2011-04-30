//
//  CoreDataStore.h
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStore : NSObject {
	NSManagedObjectContext *_managedObjectContext;	
}

@property (nonatomic, readonly) NSManagedObjectContext *context;

+ (CoreDataStore *)mainStore;
+ (CoreDataStore *)createStore;

/* Clears all data from peristent store and re-initializes (great for unit testing!) */
- (void)clearAllData;

/* Saves context. */
- (void)save;

/* Returns ALL objects for an entity. */
- (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error;

/* Returns ALL objects for an entity given a predicate. */
- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error;

/* Returns ALL objects for an entity given a predicate and sorting. */
- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error;

/* Returns ALL objects for an entity ordered by a field. */
- (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error;

/* Returns a single entity by name. */
- (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error;

/* Returns a single entity with the specified key/value. */
- (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSObject *)value error:(NSError **)error;

/* Returns object based on URI representation. */
- (NSManagedObject *)entityByURI:(NSURL *)uri;

/* Create a new entity by name. */
- (NSManagedObject *)createNewEntityByName:(NSString *)entityName;

/* Remove entity. */
- (void)removeEntity:(NSManagedObject *)entity;

/* Remove all objects of an entity. */
- (void)removeAllEntitiesByName:(NSString *)entityName;

/* Returns an entity description by name. */
- (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName;

@end
