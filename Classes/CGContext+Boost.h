//
//  GraphicUtil.h
//  Common
//
//  Created by Sean Christmann on 3/17/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

CG_EXTERN void CGContextAddRoundedRect(CGContextRef ccontext, CGRect rect, CGFloat radius);
CG_EXTERN void CGContextAddRoundedRectComplex(CGContextRef ccontext, CGRect rect, const CGFloat radiuses[]);

