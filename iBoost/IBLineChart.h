//
//  IBLineChart.h
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

