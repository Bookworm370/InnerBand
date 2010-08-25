//
//  UIImage+Boost.h
//  iBoost
//
//  Created by John Blanco on 8/21/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Additions)

- (void)drawInRect:(CGRect)rect contentMode:(UIViewContentMode)contentMode;
- (CGRect)convertRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode;

@end
