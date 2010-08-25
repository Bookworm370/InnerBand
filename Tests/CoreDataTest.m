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
@end

@implementation CoreDataTest

- (void)setUpClass {
    // Run at start of all tests in the class
	[CoreDataStore clearAllData];
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
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

@end
