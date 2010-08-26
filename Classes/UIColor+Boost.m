//
//  UIColor+Boost.m
//  Common
//
//  Created by Sean Christmann on 3/17/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import "UIColor+Boost.h"

@implementation UIColor (Boost)


+ (UIColor *) colorWithRGBA:(uint) hex {
	return [UIColor colorWithRed:((hex>>24)&0xFF)/255.0 
						   green:((hex>>16)&0xFF)/255.0 
							blue:((hex>>8)&0xFF)/255.0 
						   alpha:((hex)&0xFF)/255.0];
}

+ (UIColor *) colorWithHex:(uint) hex {
	if (hex > 16777215) {
		return [UIColor colorWithRed:((hex>>16)&0xFF)/255.0 
							   green:((hex>>8)&0xFF)/255.0 
								blue:(hex&0xFF)/255.0 
							   alpha:((hex>>24)&0xFF)/255.0];
	}else{
		return [UIColor colorWithRed:((hex>>16)&0xFF)/255.0 
							   green:((hex>>8)&0xFF)/255.0 
								blue:(hex&0xFF)/255.0 
							   alpha:1.0];
	}
}

+ (UIColor *) colorWithWeb:(NSString*) webHex {
	uint hex;
	if([webHex characterAtIndex:0] == '#'){
		hex = strtoul([[webHex substringFromIndex:1] UTF8String],NULL,16);
	}else {
		hex = strtoul([webHex UTF8String],NULL,16);
	}
	return [UIColor colorWithHex:hex];
}

- (NSString *) hexString {
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

- (UIColor*) brighten:(float) percent {
	const CGFloat* rgba = CGColorGetComponents(self.CGColor);
	CGFloat r = rgba[0];
	CGFloat g = rgba[1];
	CGFloat b = rgba[2];
	CGFloat a = rgba[3];
	CGFloat newR = r+((1.0-r)*percent);
	CGFloat newG = g+((1.0-g)*percent);
	CGFloat newB = b+((1.0-b)*percent);
	return [UIColor colorWithRed:newR green:newG blue:newB alpha:a];
}

- (UIColor*) darken:(float) percent {
	const CGFloat* rgba = CGColorGetComponents(self.CGColor);
	CGFloat r = rgba[0];
	CGFloat g = rgba[1];
	CGFloat b = rgba[2];
	CGFloat a = rgba[3];
	CGFloat newR = r-(r*percent);
	CGFloat newG = g-(g*percent);
	CGFloat newB = b-(b*percent);
	return [UIColor colorWithRed:newR green:newG blue:newB alpha:a];
}

@end
