//
//  TargetAction.h
//  InnerBand
//
//  Created by John Blanco on 3/23/12.
//  Copyright (c) 2012 Rapture In Venice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TargetAction : NSObject

@property (nonatomic, assign) NSObject *target;
@property (nonatomic, copy) NSString *action;

@end
