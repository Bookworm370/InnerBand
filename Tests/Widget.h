//
//  Widget.h
//  Message
//
//  Created by John Blanco on 3/5/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ALPHA_MSG @"messageAlpha"
#define BETA_MSG @"messageBeta"

@interface Widget : NSObject {
}

- (void)fireAlpha;
- (void)fireGlobalAlpha;
- (void)fireBeta;

@end
