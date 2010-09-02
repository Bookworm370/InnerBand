//
//  StringAppenderMessage.m
//  iBoost
//
//  iBoost - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
