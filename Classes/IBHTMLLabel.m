//
//  IBHTMLLabel.m
//  iBoost
//
//  Created by John Blanco on 8/21/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "IBHTMLLabel.h"
#import "UIColor+Boost.h"

@interface IBHTMLLabel (PRIVATE)

- (void)calculateHTML;

@end

@implementation IBHTMLLabel

@synthesize text = _text;
@synthesize textAlignment = _textAlignment;
@synthesize textColor = _textColor;
@synthesize linkColor = _linkColor;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor clearColor];
		self.opaque = NO;
		self.textColor = [UIColor blackColor];
		self.linkColor = [UIColor blueColor];
		self.textAlignment = UITextAlignmentLeft;
    }

    return self;
}

- (void)dealloc {
	[_text release];
	[_textColor release];
	[_linkColor release];
    [super dealloc];
}

#pragma mark -

- (void)setText:(NSString *)value {
	[_text autorelease];
	_text = [value copy];
	[self calculateHTML];
}

- (void)setTextAlignment:(UITextAlignment)value {
	_textAlignment = value;
	[self calculateHTML];
}

- (void)setTextColor:(UIColor *)value {
	[value retain];
	[_textColor release];
	_textColor = value;
	[self calculateHTML];
}

- (void)setLinkColor:(UIColor *)value {
	[value retain];
	[_linkColor release];
	_linkColor = value;
	[self calculateHTML];
}

- (void)calculateHTML {
	NSString *htmlText = (_text) ? _text : @"";
	NSString *htmlAlignmentValue = nil;
	
	switch (_textAlignment) {
		case UITextAlignmentRight:
			htmlAlignmentValue = @"right";
			break;
		case UITextAlignmentCenter:
			htmlAlignmentValue = @"center";
			break;
		default:
			htmlAlignmentValue = @"left";
			break;
	}
	
	if (_textColor) {
		htmlText = [NSString stringWithFormat:@"<span style=\"color:%@;\">%@</span>", [_textColor hexString], htmlText];
	}

	if (htmlAlignmentValue) {
		htmlText = [NSString stringWithFormat:@"<div align=\"%@\">%@</div>", htmlAlignmentValue, htmlText];
	}

	if (_linkColor) {
		htmlText = [NSString stringWithFormat:@"<style type=\"text/css\">a { color: %@; }</style>%@", [_linkColor hexString], htmlText];
	}
		
	[self loadHTMLString:htmlText baseURL:nil];
}

@end
