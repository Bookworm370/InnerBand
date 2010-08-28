//
//  StringAppenderMessage.m
//  MessageCenter
//
//  Created by John Blanco on 3/15/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "StringAppenderMessage.h"


@implementation StringAppenderMessage

- (id)initWithName:(NSString *)name string:(NSString *)stringToAppend userInfo:(NSDictionary *)userInfo {
	self = [super initWithName:name userInfo:userInfo];
	
	if (self) {
		_stringToAppend = [stringToAppend copy];
	}
	
	return self;
}

- (void)dealloc {
	[_stringToAppend release];
	[_convertedString release];
	[super dealloc];
}

#pragma mark -

- (void)inputData:(NSData *)input {
	_convertedString = [[NSMutableString alloc] initWithData:input encoding:NSUTF8StringEncoding];
	
	// input and do nothing
	[_convertedString appendString:_stringToAppend];
}

- (NSData *)outputData {
	// output nothing
	return [_convertedString dataUsingEncoding:NSUTF8StringEncoding];
}

@end
