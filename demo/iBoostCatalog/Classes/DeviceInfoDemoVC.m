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
	label.numberOfLines = 12;
	[self.view addSubview:label];	
	
	// info
	NSMutableString *infoText = [NSMutableString string];
	
	[infoText appendString:[NSString stringWithFormat:@"UDID: %@\n", DEVICE_UDID]];
	[infoText appendString:(IS_MULTITASKING_IN_SDK ? @"Multitasking supported.\n" : @"Multitasking not supported.\n")];
	[infoText appendString:(IS_CAMERA_IN_SDK ? @"Camera supported.\n" : @"Camera not supported.\n")];
	[infoText appendString:(IS_VIDEO_IN_SDK ? @"Video supported.\n" : @"Video not supported.\n")];
	[infoText appendString:(IS_GYROSCOPE_IN_SDK ? @"Gyroscope supported.\n" : @"Gyroscope not supported.\n")];
	[infoText appendString:(IS_RETINAL_DISPLAY ? @"Retina display!\n" : @"Classic display.\n")];
	[infoText appendString:(IS_RUNNING_OS_4_0 ? @"iOS 4.0? Yes.\n" : @"iOS 4.0? No.\n")];
	[infoText appendString:(IS_RUNNING_OS_4_1 ? @"iOS 4.1? Yes.\n" : @"iOS 4.1? No.\n")];
	[infoText appendString:(IS_RUNNING_AT_LEAST_OS_4_0 ? @"iOS 4.0 capable? Yes.\n" : @"iOS 4.0 capable? No.\n")];
	[infoText appendString:(IS_RUNNING_AT_LEAST_OS_4_1 ? @"iOS 4.1 capable? Yes.\n" : @"iOS 4.1 capable? No.\n")];
	[infoText appendString:(IS_IPAD ? @"This is an iPad.\n" : @"This is not an iPad.\n")];
		
	label.text = infoText;
}

- (void)dealloc {
    [super dealloc];
}


@end
