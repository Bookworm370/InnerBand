//
//  HarnessTests.m
//  MessageCenter
//
//  Created by John Blanco on 3/17/10.
//  Copyright 2010 Effective UI. All rights reserved.
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
