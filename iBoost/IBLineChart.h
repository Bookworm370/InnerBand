//
//  LineChart.h
//
//  Created by Sean Christmann on 5/27/08.
//  Copyright 2008 EffectiveUI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IBLineChart : UIView {
	//internal vars
	NSMutableArray *_renderPoints;
	BOOL _invalidRenderPoints;
	CGRect _lastKnownBounds;
	NSString *xAxisKey;
	NSString *yAxisKey;
	float xAxisRangeLow;
	float xAxisRangeHigh;
	float yAxisRangeLow;
	float yAxisRangeHigh;
	
	//external vars
	UIColor *_lineColor;
	UIColor *_fillColor;
	NSArray *_dataProvider;
	float _padding;
	BOOL _highlightPoints;
}

-(CGFloat)getWidth;
-(CGFloat)getHeight;

-(CGFloat)valueIntoXPoint:(float)xVal;
-(CGFloat)valueIntoYPoint:(float)yVal;

- (void)setXAxisAs:(NSString*)key fromLow:(float)low toHigh:(float)high;
- (void)setYAxisAs:(NSString*)key fromLow:(float)low toHigh:(float)high;


@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic, retain) UIColor *fillColor;
@property (nonatomic, assign) float padding;
@property (nonatomic, assign) BOOL highlightPoints;
@property (nonatomic, retain) NSArray *dataProvider;
@end

