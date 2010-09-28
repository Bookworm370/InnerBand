//
//  OrientationDetectionDemoVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 9/28/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "OrientationDetectionDemoVC.h"
#import "Macros.h"

@interface OrientationDetectionDemoVC (PRIVATE)

- (void)updateOrientationString;

@end

@implementation OrientationDetectionDemoVC

- (void)loadView {
	[super loadView];
	
	_label = [[UILabel alloc] initWithFrame:self.view.bounds];
	_label.textColor = [UIColor blackColor];
	_label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_label.textAlignment = UITextAlignmentCenter;
	_label.numberOfLines = 2;
	[self.view addSubview:_label];	

	[self updateOrientationString];	
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:SEL(updateOrientationString) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

	[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
	[_label release];
    [super dealloc];
}

#pragma mark -

- (void)updateOrientationString {
	NSString *orientationStr = nil;
	NSString *screenSizeStr = [NSString stringWithFormat:@"W=%0.2f, H=%0.2f", HARDWARE_SCREEN_WIDTH(), HARDWARE_SCREEN_HEIGHT()];
	
	if (IS_DEVICE_ORIENTATION_PORTRAIT()) {
		orientationStr = @"Device orientation is Portrait.";
	} else if (IS_DEVICE_ORIENTATION_LANDSCAPE_LEFT()) {
		orientationStr = @"Device orientation is Landscape (Left).";
	} else if (IS_DEVICE_ORIENTATION_LANDSCAPE_RIGHT()) {
		orientationStr = @"Device orientation is Landscape (Right).";
	} else if (IS_DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN()) {
		orientationStr = @"Device orientation is Portrait (UD).";		
	} else {
		orientationStr = @"Device orientation is known.";
	}
	
	_label.text = [NSString stringWithFormat:@"%@\n%@", orientationStr, screenSizeStr];
}

@end
