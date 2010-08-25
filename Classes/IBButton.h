//
//  IBButton.h
//  iBoost
//
//  Created by Sean Christmann on 8/12/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	IBButtonTypeGlossy,
	IBButtonTypeSoft,
	IBButtonTypeFlat
} IBButtonType;

@interface IBButton : UIButton {
	IBButtonType _type;
	float _cornerRadius;
	UIColor *_color;
	UIColor *_shineColor;
	UIColor *_borderColor;
	int _borderSize;
}
@property(nonatomic, retain) UIColor *color;
@property(nonatomic, retain) UIColor *shineColor;
@property(nonatomic, retain) UIColor *borderColor;
@property(nonatomic, assign) int borderSize;
@property(nonatomic, assign) IBButtonType type;
@property(nonatomic, assign) float cornerRadius;

+(IBButton*) glossButtonWithTitle:(NSString*)title color:(UIColor*)color;
+(IBButton*) softButtonWithTitle:(NSString*)title color:(UIColor*)color;
+(IBButton*) flatButtonWithTitle:(NSString*)title color:(UIColor*)color;

@end
