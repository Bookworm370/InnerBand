//
//  DateTest.m
//  iBoost
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"
#import "NSDate+Boost.h"

@interface DateTest : GHTestCase
@end

@implementation DateTest

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

- (void)testUTC {
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];

	GHAssertEquals(1970, date.utcYear, nil);
	GHAssertEquals(1, date.utcMonth, nil);
	GHAssertEquals(1, date.utcDay, nil);
	GHAssertEquals(0, date.utcHour, nil);
	GHAssertEquals(0, date.utcMinute, nil);
	GHAssertEquals(0, date.utcSecond, nil);
}

- (void)testLocalTime {
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
	
	// unsure how to test hour with the Apple SDK (timezones with NSDate)
	GHAssertEquals(1969, date.year, nil);
	GHAssertEquals(12, date.month, nil);
	GHAssertEquals(31, date.day, nil);
	GHAssertEquals(0, date.utcMinute, nil);
	GHAssertEquals(0, date.utcSecond, nil);
}

@end
