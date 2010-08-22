//
//  BoundsTest.m
//  ROIDS
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"

@interface BoundsTest : GHTestCase
@end

@implementation BoundsTest

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
	
@end
