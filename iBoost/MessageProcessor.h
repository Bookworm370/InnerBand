//
//  MessageProcessor.h
//  MessageCenter
//
//  Created by John Blanco on 3/15/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DispatchMessage;

@interface MessageProcessor : NSObject {
	DispatchMessage *_message;
	NSArray *_targetActions;
}

- (id)initWithMessage:(DispatchMessage *)message targetActions:(NSArray *)targetActions;
- (void)process;
- (void)processInThread:(DispatchMessage *)message targetActions:(NSArray *)targetActions;

@end
