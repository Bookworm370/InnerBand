//
//  IBLineChart.m
//  iBoost
//
//  iBoost - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "IBLineChart.h"


@implementation IBLineChart
@synthesize lineColor = _lineColor;
@synthesize fillColor = _fillColor;
@synthesize padding = _padding;
@synthesize highlightPoints = _highlightPoints;
@synthesize dataProvider = _dataProvider;

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
		self.lineColor = [UIColor darkGrayColor];
		self.fillColor = [self.lineColor colorWithAlphaComponent:0.3];
		self.padding = 10;
		_renderPoints = [[NSMutableArray alloc] init];
		_invalidRenderPoints = YES;
	}
	return self;
}

- (void)setXAxisAs:(NSString*)key fromLow:(float)low toHigh:(float)high {
	xAxisKey = key;
	xAxisRangeLow = low;
	xAxisRangeHigh = high;
	_invalidRenderPoints = YES;
	[self setNeedsDisplay];
}
- (void)setYAxisAs:(NSString*)key fromLow:(float)low toHigh:(float)high {
	yAxisKey = key;
	yAxisRangeLow = low;
	yAxisRangeHigh = high;
	_invalidRenderPoints = YES;
	[self setNeedsDisplay];
}

- (void)setDataProvider:(NSArray*) dataProvider {
	if (_dataProvider != nil) {
		[_dataProvider release];
	}
	_dataProvider = [dataProvider retain];
	_invalidRenderPoints = YES;
	[self setNeedsDisplay];
}

- (CGFloat)valueIntoXPoint:(float)xVal {
	float w = [self getWidth] - (self.padding*2);
	float spread = xAxisRangeHigh - xAxisRangeLow;
	float pos = ( (xVal-xAxisRangeLow) * w ) / spread;
	return self.padding + pos;
}
- (CGFloat)valueIntoYPoint:(float)yVal {
	float h = [self getHeight] - (self.padding*2);
	float spread = yAxisRangeHigh - yAxisRangeLow;
	float pos = ( (yVal-yAxisRangeLow) * h ) / spread;
	return [self getHeight] - (self.padding + pos);
}
- (CGFloat)getWidth {
	return self.frame.size.width;
}
- (CGFloat)getHeight {
	return self.frame.size.height;
}

- (void) rebuildRenderPoints {
	[_renderPoints removeAllObjects];
	int len = self.dataProvider.count;
	for(int i=0; i<len; i++){
		NSDictionary * obj = [self.dataProvider objectAtIndex:i];
		NSNumber * dpX = [obj objectForKey:xAxisKey];
		NSNumber * dpY = [obj objectForKey:yAxisKey];
		CGFloat x = [self valueIntoXPoint:[dpX floatValue]];
		CGFloat y = [self valueIntoYPoint:[dpY floatValue]];
		NSValue *point = [NSValue valueWithCGPoint:CGPointMake(x, y)];
		[_renderPoints addObject:point];
	}
}

- (void)drawRect:(CGRect)rect {
	if (_invalidRenderPoints || !CGRectEqualToRect(self.bounds, _lastKnownBounds) ) {
		[self rebuildRenderPoints];
		_invalidRenderPoints = NO;
		_lastKnownBounds = self.bounds;
	}
	// Drawing code
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetShouldAntialias(context, true);
	CGPoint point;
	
	// draw fill points
	if (self.fillColor != nil) {
		CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
		for(int i=0; i<_renderPoints.count; i++){
			NSValue *val = [_renderPoints objectAtIndex:i];
			point = [val CGPointValue];
			if (i == 0) {
				CGContextMoveToPoint(context, point.x, [self valueIntoYPoint:yAxisRangeLow]);
			}
			CGContextAddLineToPoint(context, point.x, point.y);
			if (i == _renderPoints.count-1) {
				CGContextAddLineToPoint(context, point.x, [self valueIntoYPoint:yAxisRangeLow]);
			}
		}
		CGContextFillPath(context);
	}
	
	// draw data points
	if (self.lineColor != nil) {
		CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
		CGContextSetLineWidth(context, 2.0);
		
		for(int i=0; i<_renderPoints.count; i++){
			NSValue *val = [_renderPoints objectAtIndex:i];
			point = [val CGPointValue];
			if(i==0){
				CGContextMoveToPoint(context, point.x, point.y);
			}else{
				CGContextAddLineToPoint(context, point.x, point.y);
			}
		}
		CGContextStrokePath(context);
	}
	
	//draw point highlights
	if (self.highlightPoints) {
		CGContextSetFillColorWithColor(context, self.lineColor.CGColor);
		for(int i=0; i<_renderPoints.count; i++){
			NSValue *val = [_renderPoints objectAtIndex:i];
			point = [val CGPointValue];
			CGContextFillEllipseInRect(context, CGRectMake(point.x-3, point.y-3, 6, 6));
		}
	}
}

- (void)dealloc {
	[_renderPoints release];
	[_lineColor release];
	[_dataProvider release];
	[xAxisKey release];
	[yAxisKey release];
	[super dealloc];
}


@end
