//
//  ColorTest.m
//  InnerBand
//
//  InnerBand - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "GHUnit.h"
#import "Macros.h"
#import "Functions.h"
#import "UIColor+InnerBand.h"

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

- (void)testComponents {
	UIColor *color = [UIColor colorWithRGBA:0x10203040];

	GHAssertEquals(16 / 255.0f, color.r, nil);
	GHAssertEquals(32 / 255.0f, color.g, nil);
	GHAssertEquals(48 / 255.0f, color.b, nil);
	GHAssertEquals(64 / 255.0f, color.a, nil);

	color = [UIColor colorWithARGB:0x10203040];
	
	GHAssertEquals(16 / 255.0f, color.a, nil);
	GHAssertEquals(32 / 255.0f, color.r, nil);
	GHAssertEquals(48 / 255.0f, color.g, nil);
	GHAssertEquals(64 / 255.0f, color.b, nil);
}	
	
- (void)testHexStrings {
	GHAssertEqualStrings(@"#ff0000", [[UIColor redColor] hexString], nil);
	GHAssertEqualStrings(@"#00ff00", [[UIColor greenColor] hexString], nil);
	GHAssertEqualStrings(@"#0000ff", [[UIColor blueColor] hexString], nil);

	GHAssertEqualStrings(@"#10204080", [[UIColor colorWithRed:(16.0/255.0) green:(32.0/255.0) blue:(64.0/255.0) alpha:(128.0/255.0)] hexString], nil);
}

- (void)test256Colors {
	UIColor *a256Red = [UIColor colorWith256Red:255 green:0 blue:0];
	UIColor *nativeRed = [UIColor redColor];
	
	GHAssertEqualStrings([nativeRed hexString], [a256Red hexString], nil);

	UIColor *a256Green = [UIColor colorWith256Red:0 green:255 blue:0];
	UIColor *nativeGreen = [UIColor greenColor];
	
	GHAssertEqualStrings([nativeGreen hexString], [a256Green hexString], nil);

	UIColor *a256Blue = [UIColor colorWith256Red:0 green:0 blue:255];
	UIColor *nativeBlue = [UIColor blueColor];
	
	GHAssertEqualStrings([nativeBlue hexString], [a256Blue hexString], nil);
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
	GHAssertEqualsWithAccuracy(RGB256_TO_COL(0x88) * 1.2f, grayColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(RGB256_TO_COL(0x77) * 1.2f, grayColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(RGB256_TO_COL(0x66) * 1.2f, grayColor.b, 0.01, nil);
}

- (void)testDarker {
	UIColor *grayColor = [UIColor colorWithHexString:@"#887766"];
	grayColor = [grayColor colorDarkerByPercent:20.0f];
	GHAssertEqualsWithAccuracy(RGB256_TO_COL(0x88) * 0.8f, grayColor.r, 0.01, nil);
	GHAssertEqualsWithAccuracy(RGB256_TO_COL(0x77) * 0.8f, grayColor.g, 0.01, nil);
	GHAssertEqualsWithAccuracy(RGB256_TO_COL(0x66) * 0.8f, grayColor.b, 0.01, nil);
}

@end
