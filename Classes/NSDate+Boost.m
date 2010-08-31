//
//  NSDate+Boost.m
//  iBoost
//
//  Created by John Blanco on 8/29/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "NSDate+Boost.h"
#import <time.h>

@implementation NSDate (Boost)

- (NSInteger)utcYear {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = gmtime(&rawTime);
	return time->tm_year + 1900;
}

- (NSInteger)utcMonth {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = gmtime(&rawTime);
	return time->tm_mon + 1;
}

- (NSInteger)utcDay {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = gmtime(&rawTime);
	return time->tm_mday;
}

- (NSInteger)utcHour {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = gmtime(&rawTime);
	return time->tm_hour;
}

- (NSInteger)utcMinute {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = gmtime(&rawTime);
	return time->tm_min;
}

- (NSInteger)utcSecond {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = gmtime(&rawTime);
	return time->tm_sec;
}

- (NSInteger)year {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = localtime(&rawTime);
	return time->tm_year + 1900;
}

- (NSInteger)month {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = localtime(&rawTime);
	return time->tm_mon + 1;
}

- (NSInteger)day {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = localtime(&rawTime);
	return time->tm_mday;
}

- (NSInteger)hour {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = localtime(&rawTime);
	return time->tm_hour;
}

- (NSInteger)minute {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = localtime(&rawTime);
	return time->tm_min;
}

- (NSInteger)second {
	time_t rawTime = [self timeIntervalSince1970];
	struct tm *time = localtime(&rawTime);
	return time->tm_sec;
}

- (NSString *)formattedUTCDateStyle:(NSDateFormatterStyle)dateStyle {
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateStyle:dateStyle];
	[format setTimeStyle:NSDateFormatterNoStyle];
	[format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	
	return [format stringFromDate:self];
}

- (NSString *)formattedUTCTimeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateStyle:NSDateFormatterNoStyle];
	[format setTimeStyle:timeStyle];
	[format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	
	return [format stringFromDate:self];
}

- (NSString *)formattedUTCDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateStyle:dateStyle];
	[format setTimeStyle:timeStyle];
	[format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	
	return [format stringFromDate:self];
}

- (NSString *)formattedUTCDatePattern:(NSString *)datePattern {
	//
	// format document: http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns
	//
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateFormat:datePattern];
	[format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	
	return [format stringFromDate:self];
}

- (NSString *)formattedDateStyle:(NSDateFormatterStyle)dateStyle {
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateStyle:dateStyle];
	[format setTimeStyle:NSDateFormatterNoStyle];
	
	return [format stringFromDate:self];
}

- (NSString *)formattedTimeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateStyle:NSDateFormatterNoStyle];
	[format setTimeStyle:timeStyle];

	return [format stringFromDate:self];
}

- (NSString *)formattedDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateStyle:dateStyle];
	[format setTimeStyle:timeStyle];
	
	return [format stringFromDate:self];
}

- (NSString *)formattedDatePattern:(NSString *)datePattern {
	//
	// format document: http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns
	//
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateFormat:datePattern];
	
	return [format stringFromDate:self];
}

@end

