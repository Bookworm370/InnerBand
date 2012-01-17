//
//  MemoryTest.m
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

@interface MemoryTest : GHTestCase
@end

@implementation MemoryTest

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

- (void)testMemoryRelease {
	NSObject *oldPtr;
	NSObject *ptr;
	
	oldPtr = ptr = [[[NSDate alloc] init] retain];
	GHAssertTrue([oldPtr retainCount] == 2, nil);
	ptr = SAFE_RELEASE(ptr);
	GHAssertNil(ptr, nil);
	GHAssertTrue([oldPtr retainCount] == 1, nil);

	ptr = nil;
	ptr = SAFE_RELEASE(ptr);
	GHAssertNil(ptr, nil);
}

- (void)testMemoryReleaseAndAssign {
	NSObject *oldPtr;
	NSObject *newPtr;
	NSObject *ptr;
	
	oldPtr = ptr = [[[NSDate alloc] init] retain];
	newPtr = [NSDate date];
	GHAssertTrue([oldPtr retainCount] == 2, nil);
    SAFE_RELEASE(ptr);
	ptr = [newPtr retain];
	GHAssertEquals(ptr, newPtr, nil);
	GHAssertTrue([oldPtr retainCount] == 1, nil);

	oldPtr = ptr = [[[NSDate alloc] init] retain];
	newPtr = nil;
	GHAssertTrue([oldPtr retainCount] == 2, nil);
    SAFE_RELEASE(ptr);
	ptr = [newPtr retain];
	GHAssertNil(ptr, nil);
	GHAssertTrue([oldPtr retainCount] == 1, nil);
}

@end
