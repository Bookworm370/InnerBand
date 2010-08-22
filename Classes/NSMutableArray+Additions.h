//
//  NSMutableArray+Additions.h
//  ROIDS
//
//  Created by John Blanco on 8/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (Additions)

+ (NSMutableArray *)arrayUnretaining;

- (void)sortDiacriticInsensitiveCaseInsensitive;
- (void)sortDiacriticInsensitive;
- (void)sortCaseInsensitive;

@end
