//
//  StringAppenderMessage.h
//  MessageCenter
//
//  Created by John Blanco on 3/15/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DispatchMessage.h"

@interface StringAppenderMessage : DispatchMessage {
	NSString *_stringToAppend;
	NSMutableString *_convertedString;
}

- (id)initWithName:(NSString *)name string:(NSString *)stringToAppend userInfo:(NSDictionary *)userInfo;

@end
