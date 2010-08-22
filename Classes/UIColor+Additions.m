//
//  UIColor+Additions.m
//  iBoost
//
//  Created by John Blanco on 8/22/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "UIColor+Additions.h"


@implementation UIColor (Additions)

- (NSString *)toHexString {
	const CGFloat *components = CGColorGetComponents(self.CGColor);
	
	NSInteger red = (int)(components[0] * 255.0);
	NSInteger green = (int)(components[1] * 255.0);
	NSInteger blue = (int)(components[2] * 255.0);
	NSInteger alpha = (int)(components[3] * 255.0);
	
	if (alpha < 255) {
		return [NSString stringWithFormat:@"#%02x%02x%02x%02x", red, green, blue, alpha];
	}
	
	return [NSString stringWithFormat:@"#%02x%02x%02x", red, green, blue];
}

@end
