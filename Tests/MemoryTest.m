//
//  MemoryTest.m
//  iBoost
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"

@interface MemoryTest : GHTestCase
@end

@implementation MemoryTest

- (void)setUpClass {
    // Run at start of all tests in the class
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

- (void)testMemoryRelease {
	NSObject *oldPtr;
	NSObject *ptr;
	
	oldPtr = ptr = [[[NSDate alloc] init] retain];
	GHAssertTrue([oldPtr retainCount] == 2, nil);
	ptr = RELEASE_AND_NIL(ptr);
	GHAssertNil(ptr, nil);
	GHAssertTrue([oldPtr retainCount] == 1, nil);

	ptr = nil;
	ptr = RELEASE_AND_NIL(ptr);
	GHAssertNil(ptr, nil);
}

- (void)testMemoryReleaseAndAssign {
	NSObject *oldPtr;
	NSObject *newPtr;
	NSObject *ptr;
	
	oldPtr = ptr = [[[NSDate alloc] init] retain];
	newPtr = [NSDate date];
	GHAssertTrue([oldPtr retainCount] == 2, nil);
	ptr = RELEASE_AND_ASSIGN_TO(ptr, newPtr);
	GHAssertEquals(ptr, newPtr, nil);
	GHAssertTrue([oldPtr retainCount] == 1, nil);

	oldPtr = ptr = [[[NSDate alloc] init] retain];
	newPtr = nil;
	GHAssertTrue([oldPtr retainCount] == 2, nil);
	ptr = RELEASE_AND_ASSIGN_TO(ptr, newPtr);
	GHAssertNil(ptr, nil);
	GHAssertTrue([oldPtr retainCount] == 1, nil);
}

@end
