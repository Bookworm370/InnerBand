//
//  SequencedMessage.h
//  MessageCenter
//
//  Created by John Blanco on 3/15/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DispatchMessage.h"

@interface SequencedMessage : DispatchMessage {
	NSMutableArray *_messageSequence;
	NSData *_outputOfLastMessage;
}

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence;
+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence;

@end
