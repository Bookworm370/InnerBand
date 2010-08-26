//
//  IBButton.m
//  iBoost
//
//  Created by Sean Christmann on 8/12/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import "IBButton.h"
#import "CGContext+Boost.h"
#import "UIColor+Boost.h"

@implementation IBButton
@synthesize color = _color;
@synthesize shineColor = _shineColor;
@synthesize type = _type;
@synthesize cornerRadius = _cornerRadius;
@synthesize borderColor = _borderColor;
@synthesize borderSize = _borderSize;

+(IBButton*) glossButtonWithTitle:(NSString*)title color:(UIColor*)color {
	IBButton *button = [[[IBButton alloc] init] autorelease];
	[button setTitle:title forState:UIControlStateNormal];
	button.type = IBButtonTypeGlossy;
	button.color = color;
	button.shineColor = [color brighten:0.65];
	button.cornerRadius = 10;
	button.borderSize = 1;
	button.borderColor = [color darken:0.15];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
	button.titleLabel.shadowOffset = CGSizeMake (-1.0, -0.0);
	return button;
}
+(IBButton*) softButtonWithTitle:(NSString*)title color:(UIColor*)color {
	IBButton *button = [[[IBButton alloc] init] autorelease];
	[button setTitle:title forState:UIControlStateNormal];
	button.type = IBButtonTypeSoft;
	button.color = color;
	button.shineColor = [color brighten:0.5];
	button.cornerRadius = 10;
	button.borderSize = 1;
	button.borderColor = [color darken:0.15];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
	button.titleLabel.shadowOffset = CGSizeMake (-1.0, -0.0);
	return button;
}
+(IBButton*) flatButtonWithTitle:(NSString*)title color:(UIColor*)color {
	IBButton *button = [[[IBButton alloc] init] autorelease];
	[button setTitle:title forState:UIControlStateNormal];
	button.type = IBButtonTypeFlat;
	button.color = color;
	button.cornerRadius = 10;
	button.borderSize =	1;
	button.borderColor = [color darken:0.15];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
	button.titleLabel.shadowOffset = CGSizeMake (-1.0, -0.0);
	return button;
}

- (void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
	[self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled {
	[super setEnabled:enabled];
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
	
	UIColor *baseColor = self.color;
	UIColor *edgeColor = self.borderColor;
	UIColor *highColor = self.shineColor;

	if (self.highlighted && self.adjustsImageWhenHighlighted) {
		baseColor = [self.color darken:0.40];
		edgeColor = [self.borderColor darken:0.40];
		highColor = [self.shineColor darken:0.40];
	}
	if (!self.enabled && self.adjustsImageWhenDisabled) {
		baseColor = [UIColor colorWithHex:0x999999];
		edgeColor = [UIColor colorWithHex:0x777777];
		highColor = [UIColor colorWithHex:0xEEEEEE];
	}
	
	float half = (float)self.borderSize/2;
	CGRect inset = CGRectInset(rect, half, half);
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	if (self.type == IBButtonTypeFlat) {
		//draw flat fill
		CGContextSaveGState(context);
		CGContextAddRoundedRect(context, inset, self.cornerRadius);
		CGContextSetFillColorWithColor(context, baseColor.CGColor);
		CGContextFillPath(context);
		CGContextRestoreGState(context);
		
	}else if(self.type == IBButtonTypeSoft) {
		//draw gradient fill
		CGContextSaveGState(context);
		
		CGContextAddRoundedRect(context, inset, self.cornerRadius);
		CGContextClip(context);
		
		CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
		NSArray *colors = [NSArray arrayWithObjects:(id)highColor.CGColor, (id)baseColor.CGColor, nil];
		CGFloat locations[2] = { 0.0, 0.6 };
		
		CGGradientRef gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
		CGPoint start = CGPointMake(0, inset.origin.y);
		CGPoint end = CGPointMake(0, inset.origin.y+inset.size.height);
		CGContextDrawLinearGradient (context, gradient, start, end, 0);
		
		CGColorSpaceRelease(space);
		CGGradientRelease(gradient);
		CGContextRestoreGState(context);
		
	}else if(self.type == IBButtonTypeGlossy) {
		//draw flat fill
		CGContextAddRoundedRect(context, inset, self.cornerRadius);
		CGContextSetFillColorWithColor(context, baseColor.CGColor);
		CGContextFillPath(context);
		
		//draw glossy fill
		CGContextSaveGState(context);
		CGContextAddRoundedRect(context, inset, self.cornerRadius);
		CGContextClip(context);
		
		CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
		UIColor *shineMinor = [highColor colorWithAlphaComponent:0.3];
		NSArray *colors = [NSArray arrayWithObjects:(id)highColor.CGColor, (id)shineMinor.CGColor, nil];
		CGFloat locations[2] = { 0.0, 1.0 };
		
		CGGradientRef gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
		CGPoint start = CGPointMake(0, inset.origin.y);
		CGPoint end = CGPointMake(0, inset.origin.y+(inset.size.height/2));
		CGContextDrawLinearGradient (context, gradient, start, end, 0);
		
		CGColorSpaceRelease(space);
		CGGradientRelease(gradient);
		CGContextRestoreGState(context);
	}
	
	//draw border
	CGContextAddRoundedRect(context, inset, self.cornerRadius);
	CGContextSetStrokeColorWithColor(context, edgeColor.CGColor);
	CGContextSetLineWidth(context, self.borderSize);
	CGContextStrokePath(context);
}

- (void)dealloc {
	[_color release];
	[_shineColor release];
    [super dealloc];
}

@end
