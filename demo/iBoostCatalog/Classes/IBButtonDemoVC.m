    //
//  IBButtonDemoVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 9/3/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "IBButtonDemoVC.h"
#import "IBButton.h"
#import "Macros.h"
#import "Constants.h"

@implementation IBButtonDemoVC

- (void)loadView {
	[super loadView];

	IBButton *button1 = [IBButton flatButtonWithTitle:@"Flat Button" color:[UIColor redColor]];
	button1.frame = CGRectMake(10, 10, 300, HEIGHT_OF_BUTTON);
	[self.view addSubview:button1];

	IBButton *button2 = [IBButton softButtonWithTitle:@"Soft Button" color:[UIColor orangeColor]];
	button2.frame = RECT_STACKED_OFFSET_BY_Y(button1.frame, 10);
	[self.view addSubview:button2];

	IBButton *button3 = [IBButton glossButtonWithTitle:@"Gloss Button" color:[UIColor yellowColor]];
	button3.frame = RECT_STACKED_OFFSET_BY_Y(button2.frame, 10);
	[self.view addSubview:button3];

	IBButton *button4 = [IBButton glossButtonWithTitle:@"No Rounded Corners" color:[UIColor greenColor]];
	button4.frame = RECT_STACKED_OFFSET_BY_Y(button3.frame, 10);
	button4.cornerRadius = 0;
	[self.view addSubview:button4];

	IBButton *button5 = [IBButton softButtonWithTitle:@"White Shine" color:[UIColor blueColor]];
	button5.frame = RECT_STACKED_OFFSET_BY_Y(button4.frame, 10);
	button5.shineColor = [UIColor whiteColor];
	[self.view addSubview:button5];

	IBButton *button6 = [IBButton softButtonWithTitle:@"Red Border" color:[UIColor purpleColor]];
	button6.frame = RECT_STACKED_OFFSET_BY_Y(button5.frame, 10);
	button6.borderColor = [UIColor redColor];
	[self.view addSubview:button6];
}

- (void)dealloc {
    [super dealloc];
}


@end
