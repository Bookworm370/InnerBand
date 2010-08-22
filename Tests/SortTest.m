//
//  SortTest.m
//  ROIDS
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "NSArray+Additions.h"
#import "Macros.h"

@interface SortTest : GHTestCase
@end

@implementation SortTest

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

- (void)testNSArraySorts {
	NSArray *unsortedStrings = [NSArray arrayWithObjects:@"Alpha", @"Beta", @"Uno", @"Dos", @"Ebony", @"Ivory", nil];
	NSArray *sortedStrings = [NSArray arrayWithObjects:@"Alpha", @"Beta", @"Dos", @"Ebony", @"Ivory", @"Uno", nil];

	NSArray *unsortedCasedStrings = [NSArray arrayWithObjects:@"Alpha", @"beta", @"uno", @"Dos", @"ebony", @"Ivory", nil];
	NSArray *sortedCasedStrings = [NSArray arrayWithObjects:@"Alpha", @"Dos", @"Ivory", @"beta", @"ebony", @"uno", nil];
	NSArray *sortedUncasedStrings = [NSArray arrayWithObjects:@"Alpha", @"beta", @"Dos", @"ebony", @"Ivory", @"uno", nil];

	NSArray *unsortedAccentedStrings = [NSArray arrayWithObjects:@"\u1E07illy", @"Alpha", @"\u00c1lejandro", @"Ålexa", @"James", @"Bartimaeus", @"Zach", nil];
	NSArray *sortedAccentedStrings = [NSArray arrayWithObjects:@"Alpha", @"\u00c1lejandro", @"Ålexa", @"Bartimaeus", @"James", @"Zach", @"\u1E07illy", nil];
	NSArray *sortedAccentedUncasedStrings = [NSArray arrayWithObjects:@"Alpha", @"\u00c1lejandro", @"Ålexa", @"Bartimaeus", @"\u1E07illy", @"James", @"Zach", nil];
	NSArray *sortedAccentedUndiacriticStrings = [NSArray arrayWithObjects:@"\u00c1lejandro", @"Ålexa", @"Alpha", @"Bartimaeus", @"James", @"Zach", @"\u1E07illy", nil];
	NSArray *sortedAccentedUndiacriticUncasedStrings = [NSArray arrayWithObjects:@"\u00c1lejandro", @"Ålexa", @"Alpha", @"Bartimaeus", @"\u1E07illy", @"James", @"Zach", nil];

	NSArray *unsortedNumbers = [NSArray arrayWithObjects:BOX_INT(5), BOX_INT(20), BOX_INT(2), BOX_INT(1), BOX_INT(17), nil];
	NSArray *sortedNumbers = [NSArray arrayWithObjects:BOX_INT(1), BOX_INT(2), BOX_INT(5), BOX_INT(17), BOX_INT(20), nil];

	GHAssertEqualObjects(sortedStrings, [unsortedStrings sortedArray], nil);
	GHAssertEqualObjects(sortedStrings, [unsortedStrings sortedArrayAsCaseInsensitive], nil);
	GHAssertEqualObjects(sortedStrings, [unsortedStrings sortedArrayAsDiacriticInsensitive], nil);
	GHAssertEqualObjects(sortedStrings, [unsortedStrings sortedArrayAsDiacriticInsensitiveCaseInsensitive], nil);
	
	GHAssertEqualObjects(sortedCasedStrings, [unsortedCasedStrings sortedArray], nil);
	GHAssertEqualObjects(sortedCasedStrings, [unsortedCasedStrings sortedArrayAsDiacriticInsensitive], nil);
	GHAssertEqualObjects(sortedUncasedStrings, [unsortedCasedStrings sortedArrayAsCaseInsensitive], nil);
	GHAssertEqualObjects(sortedUncasedStrings, [unsortedCasedStrings sortedArrayAsDiacriticInsensitiveCaseInsensitive], nil);	

	GHAssertEqualObjects(sortedAccentedStrings, [unsortedAccentedStrings sortedArray], nil);	
	GHAssertEqualObjects(sortedAccentedUncasedStrings, [unsortedAccentedStrings sortedArrayAsCaseInsensitive], nil);	
	GHAssertEqualObjects(sortedAccentedUndiacriticStrings, [unsortedAccentedStrings sortedArrayAsDiacriticInsensitive], nil);	
	GHAssertEqualObjects(sortedAccentedUndiacriticUncasedStrings, [unsortedAccentedStrings sortedArrayAsDiacriticInsensitiveCaseInsensitive], nil);	

	GHAssertEqualObjects(sortedNumbers, [unsortedNumbers sortedArray], nil);	
}

- (void)testNSMutableArraySorts {
}

@end
