//
//  NSManagedObject+Boost.m
//  iBoost
//
//  Created by John Blanco on 8/13/11.
//  Copyright 2011 Double Encore. All rights reserved.
//

#import "NSManagedObject+Boost.h"
#import <objc/runtime.h>

@implementation NSManagedObject (Boost)

+ (id)create {
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store createNewEntityByName:NSStringFromClass(self.class)];
}

+ (NSArray *)all {
    NSError *error = nil;
    
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store allForEntity:NSStringFromClass(self.class) error:&error];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate {
    NSError *error = nil;
    
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store allForEntity:NSStringFromClass(self.class) predicate:predicate error:&error];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending {
    NSError *error = nil;
    
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store allForEntity:NSStringFromClass(self.class) predicate:predicate orderBy:key ascending:ascending error:&error];
}

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending {
    NSError *error = nil;
    
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store allForEntity:NSStringFromClass(self.class) orderBy:key ascending:ascending error:&error];
}

+ (id)first {
    NSError *error = nil;
    
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store entityByName:NSStringFromClass(self.class) error:&error];
}

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value {
    NSError *error = nil;
    
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store entityByName:NSStringFromClass(self.class) key:key value:value error:&error];
}

- (void)destroy {
    CoreDataStore *store = [CoreDataStore mainStore];
    [store removeEntity:self];
}

+ (void)destroyAll {
    CoreDataStore *store = [CoreDataStore mainStore];
    return [store removeAllEntitiesByName:NSStringFromClass(self.class)];
}

@end
