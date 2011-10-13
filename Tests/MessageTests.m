//
//  MessageTests.m
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
#import "Widget.h"
#import "MessageCenter.h"
#import "DispatchMessage.h"
#import "StringAppenderMessage.h"
#import "SequencedMessage.h"
#import "Macros.h"

#define GOOGLE @"GOOGLE"

@interface MessageTests : GHTestCase {
	NSInteger methodFiredTimes;
	NSInteger methodFiredWithWorks;
	
	Widget *widget;
}

@end

@implementation MessageTests

- (BOOL)shouldRunOnMainThread {
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
	return NO;
}

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
	methodFiredTimes = 0;
	methodFiredWithWorks = 0;
	
	widget = [[Widget alloc] init];
}

- (void)tearDown {
	[widget release];
}   

- (void)testListener {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// fire!
	[widget fireAlpha];

	// check that we got one message
	GHAssertEquals(1, methodFiredTimes, nil);
}

- (void)testIncorrectListener {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// fire a different message!
	[widget fireBeta];
	
	// check that we got one message
	GHAssertEquals(0, methodFiredTimes, nil);
}

- (void)testMultipleListeners {
	// add listeners
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFireAsWell)];
	
	// fire!
	[widget fireAlpha];
	
	// check that we got two messages
	GHAssertEquals(2, methodFiredTimes, nil);
}

- (void)testGlobalMessage {
	// another widget
	Widget *widget2 = [[Widget alloc] init];
	
	// add listener to this other widget
	[MessageCenter addMessageListener:ALPHA_MSG source:nil target:self action:@selector(methodToFire)];
	
	// fire global message on original widget!
	[widget fireGlobalAlpha];
	
	[widget2 release];
}

- (void)testListenerFiredMultipleTimes {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// fire 3 times!
	[widget fireAlpha];
	[widget fireAlpha];
	[widget fireAlpha];
	
	// check that we got 3 messages
	GHAssertEquals(3, methodFiredTimes, nil);
}

- (void)testRemovingSelectorListener {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// remove listener by target/action
	[MessageCenter removeMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// fire!
	[widget fireAlpha];
	
	// check that the listener was removed correctly and we got no messages
	GHAssertEquals(0, methodFiredTimes, nil);
}

- (void)testRemovingTargetListener {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// remove listener by target
	[MessageCenter removeMessageListener:ALPHA_MSG source:widget target:self];
	
	// fire!
	[widget fireAlpha];
	
	// check that the listener was removed correctly and we got no messages
	GHAssertEquals(0, methodFiredTimes, nil);
}

- (void)testRemovingAllListenersByTarget {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// remove all listeners
	[MessageCenter removeMessageListenersForTarget:self];
	
	// fire!
	[widget fireAlpha];
	
	// check that all listeners were removed correctly and we got no messages
	GHAssertEquals(0, methodFiredTimes, nil);
}

- (void)testAddingAndRemovingTargetListener {
	// add listener
	[MessageCenter addMessageListener:ALPHA_MSG source:widget target:self action:@selector(methodToFire)];
	
	// fire!
	[widget fireAlpha];
	
	// check that we got 1 messages
	GHAssertEquals(1, methodFiredTimes, nil);
	
	// remove listener
	[MessageCenter removeMessageListener:ALPHA_MSG source:widget target:self];
	
	// fire!
	[widget fireAlpha];
	
	// check that we still only have the 1 message
	GHAssertEquals(1, methodFiredTimes, nil);
}

- (void)testStringAppenderMessage {
	StringAppenderMessage *alphaMessage;
	StringAppenderMessage *betaMessage;
	SequencedMessage *seqMessage;
	
	// add listener
	[MessageCenter addMessageListener:@"APPEND" source:widget target:self action:@selector(methodToVerifyStringAppender:)];
	
	// dispatch test of nil + ALPHA = ALPHA
	alphaMessage = [[[StringAppenderMessage alloc] initWithName:@"APPEND" string:@"ALPHA" userInfo:[NSDictionary dictionaryWithObject:@"ALPHA" forKey:@"actual"]] autorelease];
	[MessageCenter sendMessage:alphaMessage forSource:widget];	
	
	// dispatch test of nil + ALPHA + BETA = ALPHABETA
	alphaMessage = [[[StringAppenderMessage alloc] initWithName:nil string:@"ALPHA" userInfo:nil] autorelease];
	betaMessage = [[[StringAppenderMessage alloc] initWithName:nil string:@"BETA" userInfo:nil] autorelease];
	seqMessage = [SequencedMessage messageWithName:@"APPEND" userInfo:[NSDictionary dictionaryWithObject:@"ALPHABETA" forKey:@"actual"] sequence:[NSArray arrayWithObjects:alphaMessage, betaMessage, nil]];
	
	[MessageCenter sendMessage:seqMessage forSource:widget];	
}

- (void)testObjectsAndKeys {
    DispatchMessage *msg = [DispatchMessage messageWithName:@"anon" andObjectsAndKeys:BOX_INT(1), @"one", BOX_INT(2), @"two", nil];
    
    GHAssertEqualObjects(BOX_INT(1), [msg.userInfo objectForKey:@"one"], nil);
    GHAssertEqualObjects(BOX_INT(2), [msg.userInfo objectForKey:@"two"], nil);
}

- (void)methodToFire {
	methodFiredTimes++;
}

- (void)methodToFireAsWell {
	methodFiredTimes++;
}

- (void)methodToVerifyStringAppender:(DispatchMessage *)message {
	NSString *convertedString = [[NSString alloc] initWithData:[message outputData] encoding:NSUTF8StringEncoding];
	
	// check nil and ALPHA concatenated
	GHAssertEqualObjects([message.userInfo objectForKey:@"actual"], convertedString, nil);
}

- (void)methodToFireAndReceiveMessageWithWORKS:(DispatchMessage *)message {
	// only bumps the counter if we have appropriate message info
	if (message.userInfo && [message.userInfo objectForKey:@"WORKS"]) {
		methodFiredWithWorks++;
	}
}

@end
