//
//  NSManagedObject+Boost.h
//  iBoost
//
//  Created by John Blanco on 8/13/11.
//  Copyright 2011 Double Encore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CoreDataStore.h"

@interface NSManagedObject (Boost)

+ (id)create;

+ (NSArray *)all;
+ (NSArray *)allForPredicate:(NSPredicate *)predicate;
+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending;
+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending;

+ (id)first;
+ (id)firstWithKey:(NSString *)key value:(NSObject *)value;

+ (void)destroyAll;

- (void)destroy;

@end
