//
//  IBHTableView.h
//  iBoost
//
//  Created by Sean Christmann on 8/16/10.
//  Copyright 2010 EffectiveUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IBHTableView;
@protocol IBHTableViewDelegate<UIScrollViewDelegate,NSObject>
@optional
- (CGFloat)tableView:(IBHTableView *)tableView widthForColumnAtIndex:(NSInteger)index;
@end

@protocol IBHTableViewDataSource<NSObject>
@required
- (NSInteger)numberOfColumnsInTableView:(IBHTableView *)tableView;
- (UITableViewCell *)tableView:(IBHTableView *)tableView cellForColumnAtIndex:(NSInteger)index;
@end

@interface IBHTableView : UIScrollView {
	//external
	id<IBHTableViewDataSource> _dataSource;
	CGFloat _columnWidth;
	
	//internal
	NSInteger _totalCols;
	NSMutableArray *_colWidths;
	BOOL _variableWidths;
	CGFloat _colHeight;
	CGFloat _totalWidth;
	NSMutableArray *_colCells;
	NSMutableArray *_colIndex;
	NSInteger _leftIndex;
	NSInteger _rightIndex;
}

@property(nonatomic, assign) id<IBHTableViewDelegate> delegate;
@property(nonatomic, assign) id<IBHTableViewDataSource> dataSource;
@property(nonatomic, assign) CGFloat columnWidth;

- (void)reloadData;
- (UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

@end




