//
//  DeviceInfoDemoVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 9/28/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "DeviceInfoDemoVC.h"
#import "Macros.h"

@implementation DeviceInfoDemoVC

- (void)loadView {
	[super loadView];
	
	UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.textColor = [UIColor blackColor];
	label.numberOfLines = 8;
	[self.view addSubview:label];	
	
	// info
	NSMutableString *infoText = [NSMutableString string];
	
	[infoText appendString:[NSString stringWithFormat:@"UDID: %@\n", DEVICE_UDID]];
	[infoText appendString:(IS_MULTITASKING_IN_SDK ? @"Multitasking supported.\n" : @"Multitasking not supported.\n")];
	[infoText appendString:(IS_CAMERA_IN_SDK ? @"Camera supported.\n" : @"Camera not supported.\n")];
	[infoText appendString:(IS_VIDEO_IN_SDK ? @"Video supported.\n" : @"Video not supported.\n")];
	[infoText appendString:(IS_GYROSCOPE_IN_SDK ? @"Gyroscope supported.\n" : @"Gyroscope not supported.\n")];
		
	label.text = infoText;
}


- (void)dealloc {
    [super dealloc];
}


@end
