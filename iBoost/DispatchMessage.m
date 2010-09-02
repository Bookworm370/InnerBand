//
//  DispatchMessage.m
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

#import "DispatchMessage.h"
#import "MessageCenter.h"

@implementation DispatchMessage

@synthesize asynchronous = _asynchronous;

- (id)init {
	self = [super init];
	
	if (self) {
		_name = nil;
		_userInfo = nil;
		_asynchronous = NO;
	}
	
	return self;
}

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo {
	self = [super init];

	if (self) {
		_name = [name copy];
		_userInfo = [userInfo mutableCopy];
	}
	
	return self;
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo {
	DispatchMessage *message = [[DispatchMessage alloc] initWithName:name userInfo:userInfo];

	// autorelease
	return [message autorelease];
}

- (void)dealloc {
	[_name release];
	[_userInfo release];
	[super dealloc];
}

#pragma mark -

- (NSString *)name {
	return _name;
}

- (NSObject *)userInfo {
	return [[_userInfo copy] autorelease];
}

#pragma mark -

- (void)inputData:(NSData *)input {
	// input and do nothing
}

- (NSData *)outputData {
	// output nothing
	return nil;
}

#pragma mark -

- (void)debug:(NSString *)message, ... {
	if ([MessageCenter isDebuggingEnabled]) {
		va_list argList;
		va_start(argList, message);
		
		NSString *interpolatedMessage = [[NSString alloc] initWithFormat:message arguments:argList];
		NSLog(@"[%@] %@", self.class, interpolatedMessage);
		[interpolatedMessage release];

		va_end(argList);
	}
}

@end
