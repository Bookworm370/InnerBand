//
//  NSNumber+Boost.m
//  iBoost
//
//  Created by John Blanco on 8/31/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "NSNumber+Boost.h"


@implementation NSNumber (Boost)

- (NSString *)formattedCurrency {
	NSNumberFormatter *format = [[[NSNumberFormatter alloc] init] autorelease];
	[format setNumberStyle:NSNumberFormatterCurrencyStyle];
	
	return [format stringFromNumber:self];
}

- (NSString *)formattedCurrencyWithMinusSign {
	NSNumberFormatter *format = [[[NSNumberFormatter alloc] init] autorelease];
	[format setNumberStyle:NSNumberFormatterCurrencyStyle];
	[format setNegativeFormat:@"-$#,##0.00"];

	return [format stringFromNumber:self];
}

- (NSString *)formattedDecimal {
	NSNumberFormatter *format = [[[NSNumberFormatter alloc] init] autorelease];
	[format setNumberStyle:NSNumberFormatterDecimalStyle];
	
	return [format stringFromNumber:self];
}

- (NSString *)formattedFlatDecimal {
	NSNumberFormatter *format = [[[NSNumberFormatter alloc] init] autorelease];
	[format setNumberStyle:NSNumberFormatterDecimalStyle];
	[format setGroupingSeparator:@""];
	
	return [format stringFromNumber:self];
}

- (NSString *)formattedSpellOut {
	NSNumberFormatter *format = [[[NSNumberFormatter alloc] init] autorelease];
	[format setNumberStyle:NSNumberFormatterSpellOutStyle];
	
	return [format stringFromNumber:self];
}

@end
