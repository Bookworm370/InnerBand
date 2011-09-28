//
//  NSMutableArray+Boost.h
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

#import <Foundation/Foundation.h>
#import "Types.h"

@interface NSMutableArray (Boost)

+ (NSMutableArray *)arrayUnretaining;

- (void)sortDiacriticInsensitiveCaseInsensitive;
- (void)sortDiacriticInsensitive;
- (void)sortCaseInsensitive;

- (void)pushObject:(id)obj;
- (id)popObject;
- (id)shiftObject;
- (void)unshiftObject:(id)obj;

- (void)deleteIf:(ib_enum_bool_t)blk;

- (void)shuffle;

@end
