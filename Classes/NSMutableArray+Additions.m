//
//  NSMutableArray+Additions.m
//  ROIDS
//
//  Created by John Blanco on 8/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "NSMutableArray+Additions.h"
#import "NSString+Additions.h"

// no-ops
static const void* IBRetainNoOp(CFAllocatorRef allocator, const void *value) { return value; }
static void IBReleaseNoOp(CFAllocatorRef allocator, const void *value) { }

@implementation NSMutableArray (Additions)

+ (NSMutableArray *)arrayUnretaining {
	CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
	callbacks.retain = IBRetainNoOp;
	callbacks.release = IBReleaseNoOp;
	return (NSMutableArray*)CFArrayCreateMutable(nil, 0, &callbacks);
}

- (void)sortDiacriticInsensitiveCaseInsensitive {
	[self sortUsingSelector:@selector(diacriticInsensitiveCaseInsensitiveSort:)];
}

- (void)sortDiacriticInsensitive {
	[self sortUsingSelector:@selector(diacriticInsensitiveSort:)];
}

- (void)sortCaseInsensitive {
	[self sortUsingSelector:@selector(caseInsensitiveSort:)];
}

@end
