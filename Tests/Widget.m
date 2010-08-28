//
//  Widget.m
//  Message
//
//  Created by John Blanco on 3/5/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "Widget.h"
#import "MessageCenter.h"
#import "DispatchMessage.h"

@implementation Widget

- (void)dealloc {
	[super dealloc];
}

- (void)fireAlpha {
	// dispatch
	[MessageCenter sendMessageNamed:ALPHA_MSG forSource:self];
}

- (void)fireGlobalAlpha {
	// dispatch
	[MessageCenter sendMessageNamed:ALPHA_MSG forSource:nil];
}

- (void)fireBeta {
	DispatchMessage *message = [DispatchMessage messageWithName:BETA_MSG userInfo:[NSDictionary dictionaryWithObject:[NSNull null] forKey:@"WORKS"]];
	
	// dispatch
	[MessageCenter sendMessage:message forSource:self];
}

@end
