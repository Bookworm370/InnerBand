//
//  CoreDataTest.m
//  iBoost
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"
#import "NSMutableArray+Boost.h"
#import "CoreDataStore.h"

@interface CoreDataTest : GHTestCase

- (NSManagedObject *)makeWidgetWithInteger:(NSInteger)value;
- (NSManagedObject *)makeWidgetWithBool:(BOOL)value;
- (NSManagedObject *)makeWidgetWithFloat:(float)value;

@end

@implementation CoreDataTest

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
	[CoreDataStore clearAllData];
}

- (void)tearDown {
    // Run after each test method
}   

- (void)testInitialization {
	NSArray *widgets;
	NSError *error = nil;

	widgets = [CoreDataStore allForEntity:@"Widget" error:&error];
	GHAssertEquals(0U, widgets.count, nil);
}

- (void)testCreation {
	NSArray *widgets;
	NSError *error = nil;

	// add 1
	[self makeWidgetWithInteger:0];

	widgets = [CoreDataStore allForEntity:@"Widget" error:&error];
	GHAssertEquals(1U, widgets.count, nil);

	// add 2
	[self makeWidgetWithInteger:0];
	
	widgets = [CoreDataStore allForEntity:@"Widget" error:&error];
	GHAssertEquals(2U, widgets.count, nil);
}

- (void)testRemove {
	NSArray *widgets;
	NSError *error = nil;
	
	// add 3
	widgets = [NSArray arrayWithObjects:[self makeWidgetWithInteger:0], [self makeWidgetWithInteger:0], [self makeWidgetWithInteger:0], nil];
	
	// remove each
	do {
		// how many left?
		NSUInteger count = [CoreDataStore allForEntity:@"Widget" error:&error].count;
		
		// remove one
		[CoreDataStore removeEntity:[widgets lastObject]];
		
		// verify what's left
		widgets = [CoreDataStore allForEntity:@"Widget" error:&error];
		GHAssertEquals(count - 1, widgets.count, nil);
	} while (widgets.count > 0);
}

- (void)testRemoveAll {
	NSArray *widgets;
	NSError *error = nil;
	
	// add some
	[self makeWidgetWithInteger:0];
	[self makeWidgetWithInteger:0];
	[self makeWidgetWithInteger:0];
	
	widgets = [CoreDataStore allForEntity:@"Widget" error:&error];
	GHAssertEquals(3U, widgets.count, nil);
	
	// remove them all
	[CoreDataStore removeAllEntitiesByName:@"Widget"];

	widgets = [CoreDataStore allForEntity:@"Widget" error:&error];
	GHAssertEquals(0U, widgets.count, nil);
}

- (void)testSearchByKey {
	NSError *error = nil;
	
	// add some
	[self makeWidgetWithInteger:0];
	[self makeWidgetWithInteger:1];
	[self makeWidgetWithInteger:2];
	
	// search
	NSManagedObject *obj = [CoreDataStore entityByName:@"Widget" key:@"i" value:BOX_INT(1) error:&error];
	
	GHAssertNotEquals(BOX_INT(0), [obj valueForKey:@"i"], nil);
	GHAssertEquals(BOX_INT(1), [obj valueForKey:@"i"], nil);
	GHAssertNotEquals(BOX_INT(2), [obj valueForKey:@"i"], nil);
}

- (NSManagedObject *)makeWidgetWithInteger:(NSInteger)value {
	NSManagedObject *widget = [CoreDataStore createNewEntityByName:@"Widget"];
	[widget setValue:BOX_INT(value) forKey:@"i"];
	
	return widget;
}

- (NSManagedObject *)makeWidgetWithBool:(BOOL)value {
	NSManagedObject *widget = [CoreDataStore createNewEntityByName:@"Widget"];
	[widget setValue:BOX_BOOL(value) forKey:@"b"];
	
	return widget;
}

- (NSManagedObject *)makeWidgetWithFloat:(float)value {
	NSManagedObject *widget = [CoreDataStore createNewEntityByName:@"Widget"];
	[widget setValue:BOX_FLOAT(value) forKey:@"f"];
	
	return widget;
}
@end
