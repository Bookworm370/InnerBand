//
//  NSDate+Boost.h
//  iBoost
//
//  Created by John Blanco on 8/29/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSDate (Boost)

@property (nonatomic, readonly) NSInteger utcYear;
@property (nonatomic, readonly) NSInteger utcMonth;
@property (nonatomic, readonly) NSInteger utcDay;
@property (nonatomic, readonly) NSInteger utcHour;
@property (nonatomic, readonly) NSInteger utcMinute;
@property (nonatomic, readonly) NSInteger utcSecond;

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;

- (NSTimeInterval)utcTimeIntervalSince1970;

@end
