//
//  NSNumber+Boost.h
//  iBoost
//
//  Created by John Blanco on 8/31/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSNumber (Boost)

- (NSString *)formattedCurrency;
- (NSString *)formattedCurrencyWithMinusSign;
- (NSString *)formattedDecimal;
- (NSString *)formattedFlatDecimal;
- (NSString *)formattedSpellOut;
	
@end
