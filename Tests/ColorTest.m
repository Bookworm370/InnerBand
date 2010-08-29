//
//  ColorTest.m
//  iBoost
//
//  Created by John Blanco on 6/4/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "GHUnit.h"
#import "Macros.h"
#import "UIColor+Boost.h"

@interface ColorTest : GHTestCase
@end

@implementation ColorTest

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
}

- (void)tearDown {
    // Run after each test method
}   

- (void)testHexStrings {
	GHAssertEqualStrings(@"#ff0000", [[UIColor redColor] hexString], nil);
	GHAssertEqualStrings(@"#00ff00", [[UIColor greenColor] hexString], nil);
	GHAssertEqualStrings(@"#0000ff", [[UIColor blueColor] hexString], nil);

	GHAssertEqualStrings(@"#10204080", [[UIColor colorWithRed:(16.0/255.0) green:(32.0/255.0) blue:(64.0/255.0) alpha:(128.0/255.0)] hexString], nil);
}

- (void)testRGBAColors {
	UIColor *opaqueRed = [UIColor colorWithRGBA:0xff0000ff];
	
	GHAssertEqualsWithAccuracy(1.0f, opaqueRed.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueRed.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueRed.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueRed.a, 0.01, nil);
	
	UIColor *opaqueGreen = [UIColor colorWithRGBA:0x00ff00ff];
	
	GHAssertEqualsWithAccuracy(0.0f, opaqueGreen.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueGreen.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueGreen.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueGreen.a, 0.01, nil);

	UIColor *opaqueBlue = [UIColor colorWithRGBA:0x0000ffff];
	
	GHAssertEqualsWithAccuracy(0.0f, opaqueBlue.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueBlue.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueBlue.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueBlue.a, 0.01, nil);
	
	UIColor *opaqueWhite = [UIColor colorWithRGBA:0xffffffff];
	
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.a, 0.01, nil);

	UIColor *translucentWhite = [UIColor colorWithRGBA:0xffffff80];
	
	GHAssertEqualsWithAccuracy(1.0f, translucentWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, translucentWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, translucentWhite.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.5f, translucentWhite.a, 0.01, nil);

	UIColor *transparentWhite = [UIColor colorWithRGBA:0xffffff00];
	
	GHAssertEqualsWithAccuracy(1.0f, transparentWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, transparentWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, transparentWhite.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, transparentWhite.a, 0.01, nil);
}

- (void)testARGBColors {
	UIColor *opaqueRed = [UIColor colorWithARGB:0xffff0000];
	
	GHAssertEqualsWithAccuracy(1.0f, opaqueRed.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueRed.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueRed.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueRed.a, 0.01, nil);
	
	UIColor *opaqueGreen = [UIColor colorWithARGB:0xff00ff00];
	
	GHAssertEqualsWithAccuracy(0.0f, opaqueGreen.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueGreen.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueGreen.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueGreen.a, 0.01, nil);
	
	UIColor *opaqueBlue = [UIColor colorWithARGB:0xff0000ff];
	
	GHAssertEqualsWithAccuracy(0.0f, opaqueBlue.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueBlue.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueBlue.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueBlue.a, 0.01, nil);
	
	UIColor *opaqueWhite = [UIColor colorWithARGB:0xffffffff];
	
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.a, 0.01, nil);
	
	UIColor *translucentWhite = [UIColor colorWithARGB:0x80ffffff];
	
	GHAssertEqualsWithAccuracy(1.0f, translucentWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, translucentWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, translucentWhite.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.5f, translucentWhite.a, 0.01, nil);
	
	UIColor *transparentWhite = [UIColor colorWithARGB:0x00ffffff];
	
	GHAssertEqualsWithAccuracy(1.0f, transparentWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, transparentWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, transparentWhite.b, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, transparentWhite.a, 0.01, nil);
}

- (void)testRGBColors {
	UIColor *opaqueRed = [UIColor colorWithARGB:0xff0000];
	
	GHAssertEqualsWithAccuracy(1.0f, opaqueRed.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueRed.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueRed.b, 0.01, nil);
	
	UIColor *opaqueGreen = [UIColor colorWithARGB:0x00ff00];
	
	GHAssertEqualsWithAccuracy(0.0f, opaqueGreen.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueGreen.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueGreen.b, 0.01, nil);
	
	UIColor *opaqueBlue = [UIColor colorWithARGB:0x0000ff];
	
	GHAssertEqualsWithAccuracy(0.0f, opaqueBlue.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, opaqueBlue.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueBlue.b, 0.01, nil);
	
	UIColor *opaqueWhite = [UIColor colorWithARGB:0xffffff];
	
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, opaqueWhite.b, 0.01, nil);	
}

- (void)testHexStringColors {
	UIColor *redColor = [UIColor colorWithHexString:@"#ff0000"];

	GHAssertEqualsWithAccuracy(1.0f, redColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.b, 0.01, nil);

	redColor = [UIColor colorWithHexString:@"ff0000"];
	
	GHAssertEqualsWithAccuracy(1.0f, redColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.b, 0.01, nil);
	
	redColor = [UIColor colorWithHexString:@"#f00"];
	
	GHAssertEqualsWithAccuracy(1.0f, redColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.b, 0.01, nil);

	redColor = [UIColor colorWithHexString:@"f00"];
	
	GHAssertEqualsWithAccuracy(1.0f, redColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.b, 0.01, nil);
	
	redColor = [UIColor colorWithHexString:@"#FF0000"];
	
	GHAssertEqualsWithAccuracy(1.0f, redColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.b, 0.01, nil);

	redColor = [UIColor colorWithHexString:@"FF0000"];
	
	GHAssertEqualsWithAccuracy(1.0f, redColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, redColor.b, 0.01, nil);

	UIColor *blueColor = [UIColor colorWithHexString:@"#0000ff"];
	
	GHAssertEqualsWithAccuracy(0.0f, blueColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, blueColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, blueColor.b, 0.01, nil);
	
	blueColor = [UIColor colorWithHexString:@"0000ff"];
	
	GHAssertEqualsWithAccuracy(0.0f, blueColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, blueColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, blueColor.b, 0.01, nil);
	
	blueColor = [UIColor colorWithHexString:@"#00f"];
	
	GHAssertEqualsWithAccuracy(0.0f, blueColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, blueColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, blueColor.b, 0.01, nil);
	
	blueColor = [UIColor colorWithHexString:@"00f"];
	
	GHAssertEqualsWithAccuracy(0.0f, blueColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, blueColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, blueColor.b, 0.01, nil);
	
	blueColor = [UIColor colorWithHexString:@"#0000FF"];
	
	GHAssertEqualsWithAccuracy(0.0f, blueColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, blueColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, blueColor.b, 0.01, nil);
	
	blueColor = [UIColor colorWithHexString:@"0000FF"];
	
	GHAssertEqualsWithAccuracy(0.0f, blueColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0.0f, blueColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(1.0f, blueColor.b, 0.01, nil);
}

- (void)testBrighter {
	UIColor *grayColor = [UIColor colorWithHexString:@"#887766"];
	grayColor = [grayColor colorBrighterByPercent:20.0f];
	GHAssertEqualsWithAccuracy(0x88 / 255.0f * 1.2f, grayColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0x77 / 255.0f * 1.2f, grayColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0x66 / 255.0f * 1.2f, grayColor.b, 0.01, nil);
}

- (void)testDarker {
	UIColor *grayColor = [UIColor colorWithHexString:@"#887766"];
	grayColor = [grayColor colorDarkerByPercent:20.0f];
	GHAssertEqualsWithAccuracy(0x88 / 255.0f * 0.2f, grayColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(0x77 / 255.0f * 0.2f, grayColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(0x66 / 255.0f * 0.2f, grayColor.b, 0.01, nil);
}

@end
