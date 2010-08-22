//
//  TypesTest.m
//  ROIDS
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"

@interface TypesTest : GHTestCase
@end

@implementation TypesTest

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

- (void)testBoxing {
	GHAssertEquals(NO, UNBOX_BOOL(BOX_BOOL(NO)), nil);
	GHAssertEquals(0, UNBOX_INT(BOX_INT(0)), nil);
	GHAssertEquals(0L, UNBOX_LONG(BOX_LONG(0L)), nil);
	GHAssertEquals(0U, UNBOX_UINT(BOX_UINT(0U)), nil);
	GHAssertEqualsWithAccuracy(0.0F, UNBOX_FLOAT(BOX_FLOAT(0.0F)), 0.000001, nil);
	GHAssertEqualsWithAccuracy(0.0, UNBOX_DOUBLE(BOX_DOUBLE(0.0)), 0.000001, nil);

	GHAssertEquals(YES, UNBOX_BOOL(BOX_BOOL(YES)), nil);
	GHAssertEquals(1, UNBOX_INT(BOX_INT(1)), nil);
	GHAssertEquals(1L, UNBOX_LONG(BOX_LONG(1L)), nil);
	GHAssertEquals(1U, UNBOX_UINT(BOX_UINT(1U)), nil);
	GHAssertEqualsWithAccuracy(1.0F, UNBOX_FLOAT(BOX_FLOAT(1.0F)), 0.000001, nil);
	GHAssertEqualsWithAccuracy(1.0, UNBOX_DOUBLE(BOX_DOUBLE(1.0)), 0.000001, nil);
}

@end
