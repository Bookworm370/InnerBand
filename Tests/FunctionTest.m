//
//  FunctionTest.m
//  InnerBand
//
//  InnerBand - The iOS Booster!
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

#import "GHUnit.h"
#import "Functions.h"

@interface FunctionTest : GHTestCase
@end

@implementation FunctionTest

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
	
	rect = RECT_INSET_BY_LEFT_TOP_RIGHT_BOTTOM(RECT_50_X_100_SIZED_200_BY_400, 10, 20, 30, 40);
	GHAssertEquals(CGRectMake(60, 120, 160, 340), rect, nil);
    
	rect = RECT_INSET_BY_TOP_BOTTOM(RECT_50_X_100_SIZED_200_BY_400, 30, 60);
	GHAssertEquals(CGRectMake(50, 130, 200, 310), rect, nil);
    
	rect = RECT_INSET_BY_LEFT_RIGHT(RECT_50_X_100_SIZED_200_BY_400, 30, 60);
	GHAssertEquals(CGRectMake(80, 100, 110, 400), rect, nil);

    rect = RECT_WITH_X(RECT_50_X_100_SIZED_200_BY_400, 10);
	GHAssertEquals(CGRectMake(10, 100, 60, 80), rect, nil);
    
	rect = RECT_WITH_Y(RECT_50_X_100_SIZED_200_BY_400, 10);
	GHAssertEquals(CGRectMake(50, 10, 120, 400), rect, nil);
    
	rect = RECT_WITH_X_Y(RECT_50_X_100_SIZED_200_BY_400, 10, 20);
	GHAssertEquals(CGRectMake(10, 20, 200, 150), rect, nil);

	rect = RECT_WITH_WIDTH_HEIGHT(RECT_50_X_100_SIZED_200_BY_400, 60, 80);
	GHAssertEquals(CGRectMake(50, 100, 60, 80), rect, nil);
    
	rect = RECT_WITH_WIDTH(RECT_50_X_100_SIZED_200_BY_400, 120);
	GHAssertEquals(CGRectMake(50, 100, 120, 400), rect, nil);
    
	rect = RECT_WITH_HEIGHT(RECT_50_X_100_SIZED_200_BY_400, 150);
	GHAssertEquals(CGRectMake(50, 100, 200, 150), rect, nil);
    
	rect = RECT_STACKED_OFFSET_BY_X(RECT_50_X_100_SIZED_200_BY_400, 10);
	GHAssertEquals(CGRectMake(260, 100, 200, 400), rect, nil);
    
	rect = RECT_STACKED_OFFSET_BY_Y(RECT_50_X_100_SIZED_200_BY_400, 10);
	GHAssertEquals(CGRectMake(50, 510, 200, 400), rect, nil);
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

- (void)testStringify {
	GHAssertEqualObjects(@"0", STRINGIFY_INT(0), nil);
	GHAssertEqualObjects(@"1", STRINGIFY_INT(1), nil);
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

- (void)testNumericIntegerConstraints {
    GHAssertEquals(0, CONSTRAINTED_INT_VALUE(-1, 0, 100), nil);    
    GHAssertEquals(0, CONSTRAINTED_INT_VALUE(0, 0, 100), nil);    
    GHAssertEquals(1, CONSTRAINTED_INT_VALUE(1, 0, 100), nil);    
    GHAssertEquals(99, CONSTRAINTED_INT_VALUE(99, 0, 100), nil);    
    GHAssertEquals(100, CONSTRAINTED_INT_VALUE(100, 0, 100), nil);    
    GHAssertEquals(100, CONSTRAINTED_INT_VALUE(101, 0, 100), nil);    
}

- (void)testNumericFloatDoubleConstraints {
    GHAssertEqualsWithAccuracy(0.5f, CONSTRAINTED_FLOAT_VALUE(0.0f, 0.5f, 99.5f), 0.01f, nil);    
    GHAssertEqualsWithAccuracy(0.5f, CONSTRAINTED_FLOAT_VALUE(0.5f, 0.5f, 99.5f), 0.01f, nil);    
    GHAssertEqualsWithAccuracy(1.0f, CONSTRAINTED_FLOAT_VALUE(1.0f, 0.5f, 99.5f), 0.01f, nil);    
    GHAssertEqualsWithAccuracy(99.0f, CONSTRAINTED_FLOAT_VALUE(99.0f, 0.5f, 99.5f), 0.01f, nil);    
    GHAssertEqualsWithAccuracy(99.5f, CONSTRAINTED_FLOAT_VALUE(99.5f, 0.5f, 99.5f), 0.01f, nil);    
    GHAssertEqualsWithAccuracy(99.5f, CONSTRAINTED_FLOAT_VALUE(100.0f, 0.5f, 99.5f), 0.01f, nil);    

    GHAssertEqualsWithAccuracy(0.5, CONSTRAINTED_DOUBLE_VALUE(0.0, 0.5, 99.5), 0.01, nil);    
    GHAssertEqualsWithAccuracy(0.5, CONSTRAINTED_DOUBLE_VALUE(0.5, 0.5, 99.5), 0.01, nil);    
    GHAssertEqualsWithAccuracy(1.0, CONSTRAINTED_DOUBLE_VALUE(1.0, 0.5, 99.5), 0.01, nil);    
    GHAssertEqualsWithAccuracy(99.0, CONSTRAINTED_DOUBLE_VALUE(99.0, 0.5, 99.5), 0.01, nil);    
    GHAssertEqualsWithAccuracy(99.5, CONSTRAINTED_DOUBLE_VALUE(99.5, 0.5, 99.5), 0.01, nil);    
    GHAssertEqualsWithAccuracy(99.5, CONSTRAINTED_DOUBLE_VALUE(100.0, 0.5, 99.5), 0.01, nil);    
}

@end
