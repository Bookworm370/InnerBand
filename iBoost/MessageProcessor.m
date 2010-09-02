//
//  MessageProcessor.m
//  MessageCenter
//
//  Created by John Blanco on 3/15/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "MessageProcessor.h"
#import "DispatchMessage.h"
#import "NSObject+Boost.h"

@implementation MessageProcessor

- (id)initWithMessage:(DispatchMessage *)message targetActions:(NSArray *)targetActions {
	self = [super init];
	
	if (self) {
		_message = [message retain];
		_targetActions = [targetActions copy];
	}
	
	return self;
}

- (void)dealloc {
	[_message release];
	[_targetActions release];
	[super dealloc];
}

- (void)process {
	// pool
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// process
	[_message inputData:nil];

	// dispatch for all target/action pairs
	for (NSInteger i = _targetActions.count - 1; i >= 0; --i) {
		NSDictionary *iDictionary = (NSDictionary *)[_targetActions objectAtIndex:i];
		NSObject *iTarget = (NSObject *)[iDictionary objectForKey:@"target"];
		SEL iAction = NSSelectorFromString((NSString *)[iDictionary objectForKey:@"action"]);

		// call target/actiom
		[iTarget performSelector:iAction withObject:_message];			
	}
	
	// pool
	[pool release];
}

- (void)processInThread:(DispatchMessage *)message targetActions:(NSArray *)targetActions {
	MessageProcessor *processor = [[MessageProcessor alloc] initWithMessage:message targetActions:targetActions];
	
	[processor process];
	[processor release];
}

@end
