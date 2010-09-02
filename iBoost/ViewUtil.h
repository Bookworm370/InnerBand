//
//  ViewUtil.h
//  Common
//
//  Created by Sean Christmann on 3/24/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ViewUtil : NSObject {
}

/**
 This function is very handy for loading an instance of a specified class from a specified NIB
 file.  It's sorta like UIView initWithNibName, but more general purpose.  Very useful for loading
 UITableViewCells from NIB files, e.g.:
 
 MessageCell *cell = [tableView dequeueReusableCellWithIdentifier: @"MessageCell"];
 if (cell == nil) {
 cell = [ViewUtil loadInstanceOfView:[MessageCell class] fromNibNamed:@"MessageCell"];
 }
 **/
+ (id)loadInstanceOfView:(Class)clazz fromNibNamed:(NSString *)name;

@end
