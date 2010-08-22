//
//  IBHTMLLabel.h
//  iBoost
//
//  Created by John Blanco on 8/21/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IBHTMLLabel : UIWebView {
	NSString *_text;
	UITextAlignment _textAlignment;
	UIColor *_textColor;
	UIColor *_linkColor;
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) UITextAlignment textAlignment;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *linkColor;

@end
