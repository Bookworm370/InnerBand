//
//  DateTest.m
//  iBoost
//
//  iBoost - The iOS Booster!
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
#import "Macros.h"
#import "NSDate+Boost.h"

@interface DateTest : GHTestCase

- (void)checkMidnightOfDate:(NSDate *)date;

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

- (void)testUTCComparison {
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

- (void)testUTCFormatting {
	NSDate *epoch = [NSDate dateWithTimeIntervalSince1970:0];
	
	GHAssertEqualStrings(@"January 1, 1970 12:00:00 AM GMT+00:00", [epoch formattedUTCDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle], nil);
	GHAssertEqualStrings(@"Jan 1, 1970 12:00:00 AM", [epoch formattedUTCDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle], nil);
	GHAssertEqualStrings(@"1/1/70 12:00 AM", [epoch formattedUTCDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle], nil);
	GHAssertEqualStrings(@"", [epoch formattedUTCDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterNoStyle], nil);
	
	GHAssertEqualStrings(@"January 1, 1970", [epoch formattedUTCDateStyle:NSDateFormatterLongStyle], nil);
	GHAssertEqualStrings(@"Jan 1, 1970", [epoch formattedUTCDateStyle:NSDateFormatterMediumStyle], nil);
	GHAssertEqualStrings(@"1/1/70", [epoch formattedUTCDateStyle:NSDateFormatterShortStyle], nil);
	GHAssertEqualStrings(@"", [epoch formattedUTCDateStyle:NSDateFormatterNoStyle], nil);
	
	GHAssertEqualStrings(@"12:00:00 AM GMT+00:00", [epoch formattedUTCTimeStyle:NSDateFormatterLongStyle], nil);
	GHAssertEqualStrings(@"12:00:00 AM", [epoch formattedUTCTimeStyle:NSDateFormatterMediumStyle], nil);
	GHAssertEqualStrings(@"12:00 AM", [epoch formattedUTCTimeStyle:NSDateFormatterShortStyle], nil);
	GHAssertEqualStrings(@"", [epoch formattedUTCTimeStyle:NSDateFormatterNoStyle], nil);
}

- (void)testDateAsMidnight {
	[self checkMidnightOfDate:[NSDate distantPast]];
	[self checkMidnightOfDate:[NSDate dateWithTimeIntervalSince1970:0]];
	[self checkMidnightOfDate:[NSDate dateWithTimeIntervalSinceReferenceDate:0]];
	[self checkMidnightOfDate:[NSDate date]];
	[self checkMidnightOfDate:[NSDate distantFuture]];
}

- (void)checkMidnightOfDate:(NSDate *)date {
	NSDate *dateAsMidnight = [date dateAsMidnight];
	
	GHAssertEquals(dateAsMidnight.utcYear, date.utcYear, nil);
	GHAssertEquals(dateAsMidnight.utcMonth, date.utcMonth, nil);
	GHAssertEquals(dateAsMidnight.utcDay, date.utcDay, nil);
	GHAssertEquals(0, dateAsMidnight.utcHour, nil);
	GHAssertEquals(0, dateAsMidnight.utcMinute, nil);
	GHAssertEquals(0, dateAsMidnight.utcSecond, nil);	
}

@end
