//
//  MessageCenter.h
//  Message
//
//  Created by John Blanco on 3/5/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DispatchMessage;

@interface MessageCenter : NSObject {
}

// testing
+ (NSInteger)getCountOfListeningSources;

+ (void)setDebuggingEnabled:(BOOL)enabled;
+ (BOOL)isDebuggingEnabled;
	
// add message listener
+ (void)addGlobalMessageListener:(NSString *)name target:(NSObject *)target action:(SEL)action;
+ (void)addMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target action:(SEL)action;

// remove message listener
+ (void)removeMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target action:(SEL)action;
+ (void)removeMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target;
+ (void)removeMessageListener:(NSString *)name target:(NSObject *)target action:(SEL)action;
+ (void)removeMessageListenersForTarget:(NSObject *)name;

// global dispatches
+ (void)sendGlobalMessage:(DispatchMessage *)message;
+ (void)sendGlobalMessageNamed:(NSString *)name;
+ (void)sendGlobalMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userInfo;

// source dispatches
+ (void)sendMessage:(DispatchMessage *)message forSource:(NSObject *)source;
+ (void)sendMessageNamed:(NSString *)name forSource:(NSObject *)source;
+ (void)sendMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userInfo forSource:(NSObject *)source;

@end
