//
//  StringTest.m
//  iBoost
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"

@interface StringTest : GHTestCase
@end

@implementation StringTest

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

- (void)testEmptyStrings {
	BOOL isEmpty;
	
	isEmpty = IS_EMPTY_STRING((NSString *)nil);
	GHAssertTrue(isEmpty, nil);

	isEmpty = IS_EMPTY_STRING(@"");
	GHAssertTrue(isEmpty, nil);

	isEmpty = IS_EMPTY_STRING(@"X");
	GHAssertFalse(isEmpty, nil);

	isEmpty = IS_EMPTY_STRING([NSDictionary dictionary]);
	GHAssertTrue(isEmpty, nil);
}

- (void)testPopulatedStrings {
	BOOL isPopulated;
	
	isPopulated = IS_POPULATED_STRING((NSString *)nil);
	GHAssertFalse(isPopulated, nil);
	
	isPopulated = IS_POPULATED_STRING(@"");
	GHAssertFalse(isPopulated, nil);
	
	isPopulated = IS_POPULATED_STRING(@"X");
	GHAssertTrue(isPopulated, nil);
	
	isPopulated = IS_POPULATED_STRING([NSDictionary dictionary]);
	GHAssertFalse(isPopulated, nil);
}

@end
