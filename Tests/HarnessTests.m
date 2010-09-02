//
//  HarnessTests.m
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
#import "MessageCenter.h"
#import "HTTPGetRequestMessage.h"
#import "Widget.h"

#define GOOGLE @"GOOGLE"

@interface HarnessTests : GHTestCase {
	Widget *widget;
}

@end

@implementation HarnessTests

- (BOOL)shouldRunOnMainThread {
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
	return NO;
}

- (void)setUpClass {
    // Run at start of all tests in the class
	[MessageCenter setDebuggingEnabled:YES];
}

- (void)tearDownClass {
    // Run at end of all tests in the class
	[MessageCenter setDebuggingEnabled:NO];
}

- (void)setUp {
	widget = [[Widget alloc] init];
}

- (void)tearDown {
	[widget release];
}   

- (void)testHTTP {
	// add listener
	[MessageCenter addMessageListener:GOOGLE source:widget target:self action:@selector(httpReturned:)];

	NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"nintendo" forKey:@"QUERY"];
	HTTPGetRequestMessage *message = [HTTPGetRequestMessage messageWithName:GOOGLE userInfo:userInfo url:@"http://www.google.com/search?q=[QUERY]"];
	
	// dispatch
	[MessageCenter sendMessage:message forSource:widget];
	
}

- (void)httpReturned:(HTTPGetRequestMessage *)message {
	NSDictionary *userInfo = message.userInfo;
	
	NSLog(@"BYTES RECEIVED: %i", [[message outputData] length]);
	NSLog(@"STATUS CODE: %@", [userInfo objectForKey:HTTP_STATUS_CODE]);
}

@end
