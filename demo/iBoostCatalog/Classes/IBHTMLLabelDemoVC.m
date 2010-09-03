    //
//  IBHTMLLabelDemoVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 9/3/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "IBHTMLLabelDemoVC.h"
#import "IBHTMLLabel.h"

@implementation IBHTMLLabelDemoVC

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];

	IBHTMLLabel *htmlLabel = [[[IBHTMLLabel alloc] initWithFrame:self.view.bounds] autorelease];
	htmlLabel.text = @"This is <b>bold</b> and this is <i>italics</i> and this is <a href='http://raptureinvenice.com'>a link</a>.";
	htmlLabel.textAlignment = UITextAlignmentCenter;
	htmlLabel.textColor = [UIColor purpleColor];
	htmlLabel.linkColor = [UIColor greenColor];
	
	[self.view addSubview:htmlLabel];	
}

- (void)dealloc {
    [super dealloc];
}


@end
