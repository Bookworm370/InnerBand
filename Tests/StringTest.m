//
//  StringTest.m
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

@interface StringTest : GHTestCase
@end

@implementation StringTest

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

- (void)testEmptyStrings {
	BOOL isEmpty;
	
	isEmpty = IS_EMPTY_STRING((NSString *)nil);
	GHAssertTrue(isEmpty, nil);

	isEmpty = IS_EMPTY_STRING(@"");
	GHAssertTrue(isEmpty, nil);

	isEmpty = IS_EMPTY_STRING(@"X");
	GHAssertFalse(isEmpty, nil);

	isEmpty = IS_EMPTY_STRING([NSDictionary dictionary]);
	GHAssertTrue(isEmpty, nil);
}

- (void)testPopulatedStrings {
	BOOL isPopulated;
	
	isPopulated = IS_POPULATED_STRING((NSString *)nil);
	GHAssertFalse(isPopulated, nil);
	
	isPopulated = IS_POPULATED_STRING(@"");
	GHAssertFalse(isPopulated, nil);
	
	isPopulated = IS_POPULATED_STRING(@"X");
	GHAssertTrue(isPopulated, nil);
	
	isPopulated = IS_POPULATED_STRING([NSDictionary dictionary]);
	GHAssertFalse(isPopulated, nil);
}

@end
