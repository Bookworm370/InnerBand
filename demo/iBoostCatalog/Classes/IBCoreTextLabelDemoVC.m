//
//  IBCoreTextLabelDemoVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 8/21/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "IBCoreTextLabelDemoVC.h"
#import <UIKit/UIKit.h>
#import "IBCoreTextLabel.h"

@implementation IBCoreTextLabelDemoVC

- (void)loadView {
	[super loadView];

	IBCoreTextLabel *label = [[[IBCoreTextLabel alloc] initWithFrame:self.view.bounds] autorelease];
	label.text = @"When in the Course of <b>human events</b> it <u>becomes</u> <i>necessary</i> for one people to dissolve the <font Zapfino>political bands</font> which have connected them with another and to assume among the powers of the <font Marker Felt>earth</font>, the separate and equal station to which the Laws of Nature and of Nature's God entitle them, a decent respect to the opinions of mankind requires that they should declare the causes which impel them to the <b>separation</b>.";
    label.font = [UIFont systemFontOfSize:28.0];
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor blackColor];
	
	[self.view addSubview:label];	
	
}

- (void)dealloc {
    [super dealloc];
}


@end
