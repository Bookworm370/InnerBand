//
//  BoundsTest.m
//  iBoost
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"

@interface MacroTest : GHTestCase
@end

@implementation MacroTest

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

- (void)testBounds {
	CGRect RECT_50_X_100_SIZED_200_BY_400 = CGRectMake(50, 100, 200, 400);
	CGRect rect;
	
	rect = RECT_INSET_BY_LEFT_TOP_RIGHT_BOIBOM(RECT_50_X_100_SIZED_200_BY_400, 10, 20, 30, 40);
	GHAssertEquals(CGRectMake(60, 120, 160, 340), rect, nil);

	rect = RECT_INSET_BY_TOP_BOIBOM(RECT_50_X_100_SIZED_200_BY_400, 30, 60);
	GHAssertEquals(CGRectMake(50, 130, 200, 310), rect, nil);

	rect = RECT_INSET_BY_TOP(RECT_50_X_100_SIZED_200_BY_400, 25);
	GHAssertEquals(CGRectMake(50, 125, 200, 375), rect, nil);

	rect = RECT_INSET_BY_BOIBOM(RECT_50_X_100_SIZED_200_BY_400, 25);
	GHAssertEquals(CGRectMake(50, 100, 200, 375), rect, nil);

	rect = RECT_INSET_BY_LEFT_RIGHT(RECT_50_X_100_SIZED_200_BY_400, 30, 60);
	GHAssertEquals(CGRectMake(80, 100, 110, 400), rect, nil);
	
	rect = RECT_INSET_BY_LEFT(RECT_50_X_100_SIZED_200_BY_400, 25);
	GHAssertEquals(CGRectMake(75, 100, 175, 400), rect, nil);
	
	rect = RECT_INSET_BY_RIGHT(RECT_50_X_100_SIZED_200_BY_400, 25);
	GHAssertEquals(CGRectMake(50, 100, 175, 400), rect, nil);

	rect = RECT_INSET_BY_TOP_LEFT(RECT_50_X_100_SIZED_200_BY_400, 15, 35);
	GHAssertEquals(CGRectMake(85, 115, 165, 385), rect, nil);

	rect = RECT_INSET_BY_BOIBOM_RIGHT(RECT_50_X_100_SIZED_200_BY_400, 15, 35);
	GHAssertEquals(CGRectMake(50, 100, 165, 385), rect, nil);

	rect = RECT_INSET_BY(RECT_50_X_100_SIZED_200_BY_400, 25);
	GHAssertEquals(CGRectMake(75, 125, 150, 350), rect, nil);
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

- (void)testDumps {
	CGRect rect = CGRectMake(10.0, 15.0, 200.0, 250.0);

	GHAssertEqualStrings(@"X=10.0 Y=15.0 W=200.0 H=250.0", RECT_TO_STR(rect), nil);
	GHAssertEqualStrings(@"X=10.0 Y=15.0", POINT_TO_STR(rect.origin), nil);
	GHAssertEqualStrings(@"W=200.0 H=250.0", SIZE_TO_STR(rect.size), nil);
}

- (void)testColorConversions {
	GHAssertEquals(1.0f, RGB256_TO_COL(COL_TO_RGB256(1.0)), nil);
	GHAssertEquals(0.0f, RGB256_TO_COL(0), nil);
	GHAssertEquals(1.0f, RGB256_TO_COL(255), nil);
}

@end
