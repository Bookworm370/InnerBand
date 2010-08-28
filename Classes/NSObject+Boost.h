//
//  NSObject+Boost.h
//  iBoost
//
//  Created by John Blanco on 8/21/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSObject (Additions)

- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3;
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4;
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4 withObject:(id)p5;
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4 withObject:(id)p5 withObject:(id)p6;
- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4 withObject:(id)p5 withObject:(id)p6 withObject:(id)p7;

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2;

@end
