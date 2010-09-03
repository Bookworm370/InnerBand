    //
//  IBImageViewDemoVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 8/21/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "IBImageViewDemoVC.h"

@implementation IBImageViewDemoVC

- (void)loadView {
	[super loadView];
	
	IBImageView *imageView = [[[IBImageView alloc] init] autorelease];
	[self.view addSubview:imageView];
	imageView.urlPath = @"http://i.imgur.com/f85jd.jpg";	
}

- (void)dealloc {
    [super dealloc];
}


@end
