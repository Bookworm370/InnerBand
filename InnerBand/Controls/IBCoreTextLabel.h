//
//  IBCoreTextLabel.h
//  InnerBandCatalog
//
//  Created by John Blanco on 9/3/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

// supports <b>, <i>, <font face="XXX" size="XXX" color="">, and <br>

#import <Foundation/Foundation.h>
#import "ARCMacros.h"

@interface IBCoreTextLabel : UIControl {
	UIColor *_textColor;
	
	NSString *_text;
	NSMutableAttributedString *_attrStr;
	
	NSMutableArray *_boldRanges;
	NSMutableArray *_italicRanges;
	NSMutableArray *_fontRanges;
	NSMutableArray *_underlineRanges;
}

@property (nonatomic, SAFE_ARC_PROP_RETAIN) NSString *text;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIColor *textColor;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIFont *font;
@property (nonatomic, readonly) float measuredHeight;

@end
