//
//  ViewUtil.m
//  Common
//
//  Created by Sean Christmann on 3/24/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import "ViewUtil.h"


@implementation ViewUtil

+ (id) loadInstanceOfView:(Class)clazz fromNibNamed:(NSString *)name {
	id obj = nil;
	NSArray *topObjects = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
	for (id currentObject in topObjects) {
		if ([currentObject isKindOfClass:clazz]) {
			obj = currentObject;
			break;
		}
	}
	return obj;
}

@end
