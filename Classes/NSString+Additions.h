//
//  NSString+Additions.h
//  ROIDS
//
//  Created by John Blanco on 8/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Additions)

- (NSComparisonResult)diacriticInsensitiveCaseInsensitiveSort:(NSString *)rhs;
- (NSComparisonResult)diacriticInsensitiveSort:(NSString *)rhs;
- (NSComparisonResult)caseInsensitiveSort:(NSString *)rhs;

- (NSString *)asBundlePath;
- (NSString *)asDocumentsPath;
	
@end
