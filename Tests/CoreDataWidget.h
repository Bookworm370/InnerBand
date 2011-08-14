//
//  CoreDataWidget.h
//  iBoost
//
//  Created by John Blanco on 8/13/11.
//  Copyright (c) 2011 Double Encore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataWidget : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * b;
@property (nonatomic, retain) NSNumber * i;
@property (nonatomic, retain) NSNumber * f;

@end
