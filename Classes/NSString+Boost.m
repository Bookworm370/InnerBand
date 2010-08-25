//
//  NSString+Boost.m
//  iBoost
//
//  Created by John Blanco on 8/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "NSString+Boost.h"


@implementation NSString (Additions)

- (NSComparisonResult)diacriticInsensitiveCaseInsensitiveSort:(NSString *)rhs {
	return [self compare:rhs options:NSDiacriticInsensitiveSearch | NSCaseInsensitiveSearch];	
}

- (NSComparisonResult)diacriticInsensitiveSort:(NSString *)rhs {
	return [self compare:rhs options:NSDiacriticInsensitiveSearch];	
}

- (NSComparisonResult)caseInsensitiveSort:(NSString *)rhs {
	return [self compare:rhs options:NSCaseInsensitiveSearch];	
}

- (NSString *)asBundlePath {
	NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
	return [resourcePath stringByAppendingPathComponent:self];
}

- (NSString *)asDocumentsPath {
	static NSString* documentsPath = nil;

	if (!documentsPath) {
		NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		documentsPath = [[dirs objectAtIndex:0] retain];
	}
	
	return [documentsPath stringByAppendingPathComponent:self];
}

@end
