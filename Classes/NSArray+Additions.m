//
//  NSArray+Additions.m
//  ROIDS
//
//  Created by John Blanco on 8/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "NSArray+Additions.h"
#import "NSString+Additions.h"

@implementation NSArray (Additions)

- (NSArray *)sortedArrayAsDiacriticInsensitiveCaseInsensitive {
	return [self sortedArrayUsingSelector:@selector(diacriticInsensitiveCaseInsensitiveSort:)];
}

- (NSArray *)sortedArrayAsDiacriticInsensitive {
	return [self sortedArrayUsingSelector:@selector(diacriticInsensitiveSort:)];
}

- (NSArray *)sortedArrayAsCaseInsensitive {
	return [self sortedArrayUsingSelector:@selector(caseInsensitiveSort:)];
}

- (NSArray *)sortedArray {
	return [self sortedArrayUsingSelector:@selector(compare:)];
}

@end
