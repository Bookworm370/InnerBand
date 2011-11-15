//
//  NumberTest.m
//  iBoost
//
//  iBoost - The iOS Booster!
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
#import "NSNumber+Boost.h"

@interface NumberTest : GHTestCase
@end

@implementation NumberTest

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

- (void)testFormatting {
	// whole positive numbers
	NSNumber *num = BOX_INT(0);
	GHAssertEqualStrings(@"$0.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$0.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"0", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"0", [num formattedFlatDecimal], nil);
	GHAssertEqualStrings(@"zero", [num formattedSpellOut], nil);

	num = BOX_INT(1);
	GHAssertEqualStrings(@"$1.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$1.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"1", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"1", [num formattedFlatDecimal], nil);
	GHAssertEqualStrings(@"one", [num formattedSpellOut], nil);

	num = BOX_INT(10);
	GHAssertEqualStrings(@"$10.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$10.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"10", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"10", [num formattedFlatDecimal], nil);
	GHAssertEqualStrings(@"ten", [num formattedSpellOut], nil);

	num = BOX_INT(100);
	GHAssertEqualStrings(@"$100.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$100.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"100", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"100", [num formattedFlatDecimal], nil);
	GHAssertEqualStrings(@"one hundred", [num formattedSpellOut], nil);

	num = BOX_INT(1000);
	GHAssertEqualStrings(@"$1,000.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$1,000.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"1,000", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"1000", [num formattedFlatDecimal], nil);
	GHAssertEqualStrings(@"one thousand", [num formattedSpellOut], nil);

	num = BOX_INT(1000000);
	GHAssertEqualStrings(@"$1,000,000.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$1,000,000.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"1000000", [num formattedFlatDecimal], nil);
	GHAssertEqualStrings(@"one million", [num formattedSpellOut], nil);
	
	// decimals
	num = BOX_FLOAT(0.1);
	GHAssertEqualStrings(@"$0.10", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$0.10", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"0.1", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"0.1", [num formattedFlatDecimal], nil);

	num = BOX_FLOAT(0.01);
	GHAssertEqualStrings(@"$0.01", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$0.01", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"0.01", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"0.01", [num formattedFlatDecimal], nil);

	num = BOX_FLOAT(0.001);
	GHAssertEqualStrings(@"$0.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$0.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"0.001", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"0.001", [num formattedFlatDecimal], nil);

	num = BOX_FLOAT(0.005);
	GHAssertEqualStrings(@"$0.00", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"$0.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"0.005", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"0.005", [num formattedFlatDecimal], nil);

	// negative decimals
	num = BOX_FLOAT(-0.1);
	GHAssertEqualStrings(@"($0.10)", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"-$0.10", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"-0.1", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"-0.1", [num formattedFlatDecimal], nil);
	
	num = BOX_FLOAT(-0.01);
	GHAssertEqualStrings(@"($0.01)", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"-$0.01", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"-0.01", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"-0.01", [num formattedFlatDecimal], nil);
	
	num = BOX_FLOAT(-0.001);
	GHAssertEqualStrings(@"($0.00)", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"-$0.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"-0.001", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"-0.001", [num formattedFlatDecimal], nil);
	
	num = BOX_FLOAT(-0.005);
	GHAssertEqualStrings(@"($0.00)", [num formattedCurrency], nil);
	GHAssertEqualStrings(@"-$0.00", [num formattedCurrencyWithMinusSign], nil);
	GHAssertEqualStrings(@"-0.005", [num formattedDecimal], nil);
	GHAssertEqualStrings(@"-0.005", [num formattedFlatDecimal], nil);
}

@end
