//
//  DispatchMessage.h
//  DispatchMessage
//
//  Created by John Blanco on 3/5/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DispatchMessage : NSObject {
	NSString *_name;
	NSMutableDictionary *_userInfo;
	BOOL _asynchronous;
}

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSMutableDictionary *userInfo;
@property (nonatomic, assign, getter=isAsynchronous) BOOL asynchronous;

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;
+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

- (NSString *)name;
- (NSDictionary *)userInfo;

- (void)inputData:(NSData *)input;
- (NSData *)outputData;

- (void)debug:(NSString *)message, ...;

@end
