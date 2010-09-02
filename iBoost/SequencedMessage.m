//
//  SequencedMessage.m
//  MessageCenter
//
//  Created by John Blanco on 3/15/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "SequencedMessage.h"


@implementation SequencedMessage

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence {
	self = [super initWithName:name userInfo:userInfo];
	
	if (self) {
		_messageSequence = [messageSequence mutableCopy];

		// if any message in the sequence is asynchronous, the whole thing is asynchronous
		for (DispatchMessage *iMessage in _messageSequence) {
			if (iMessage.isAsynchronous) {
				self.asynchronous = YES;
				break;
			}
		}
	}
	
	return self;
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence {
	SequencedMessage *message = [[SequencedMessage alloc] initWithName:name userInfo:userInfo sequence:messageSequence];
	
	// autorelease
	return [message autorelease];
}

- (void)dealloc {
	[_messageSequence release];
	[super dealloc];
}

#pragma mark -

- (void)inputData:(NSData *)input {
	_outputOfLastMessage = nil;
	
	// process each message in sequence
	for (DispatchMessage *iMessage in _messageSequence) {
		// process
		[iMessage inputData:_outputOfLastMessage];
		
		// release
		[_outputOfLastMessage release];
		
		// gather output
		_outputOfLastMessage = [[iMessage outputData] retain];
	}
}

- (NSData *)outputData {
	// this is the output of the last message we processed in inputData
	return [_outputOfLastMessage autorelease];
}

@end
