//
//  BlockBasedDispatchMessage.m
//  InnerBand
//
//  InnerBand - The iOS Booster!
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

#import "BlockBasedDispatchMessage.h"
#import "ARCMacros.h"

@implementation BlockBasedDispatchMessage

+ (id)messageWithName:(NSString *)name isAsynchronous:(BOOL)isAsync input:(void (^)(NSData *))inputBlock output:(NSData * (^)(void))outputBlock {
    BlockBasedDispatchMessage *msg = [[BlockBasedDispatchMessage alloc] initWithName:name userInfo:nil];
    msg.asynchronous = isAsync;

    msg->inputBlock_ = SAFE_ARC_BLOCK_COPY(inputBlock);
    msg->outputBlock_ = SAFE_ARC_BLOCK_COPY(outputBlock);

    return SAFE_ARC_AUTORELEASE(msg);
}

- (void)dealloc {
    SAFE_ARC_BLOCK_RELEASE(inputBlock_);
    SAFE_ARC_BLOCK_RELEASE(outputBlock_);
    SAFE_ARC_SUPER_DEALLOC();
}

- (void)inputData:(NSData *)input {
    inputBlock_(input);
}

- (NSData *)outputData {
    return outputBlock_();    
}

@end
