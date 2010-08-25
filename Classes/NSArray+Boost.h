//
//  NSArray+Boost.h
//  iBoost
//
//  Created by John Blanco on 8/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)

- (NSArray *)sortedArrayAsDiacriticInsensitiveCaseInsensitive;
- (NSArray *)sortedArrayAsDiacriticInsensitive;
- (NSArray *)sortedArrayAsCaseInsensitive;
- (NSArray *)sortedArray;

@end
