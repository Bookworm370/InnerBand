//
//  ArrayTest.m
//  ROIDS
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"
#import "NSMutableArray+Additions.h"

@interface ArrayTest : GHTestCase
@end

@implementation ArrayTest

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

- (void)testUnretainingArray {
	NSMutableArray *array = [NSMutableArray arrayUnretaining];
	
	[array addObject:BOX_INT(5)];
}

@end
