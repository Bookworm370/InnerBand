//
//  iBoostCatalogAppDelegate.h
//  iBoostCatalog
//
//  Created by John Blanco on 8/21/10.
//  Copyright Effective UI 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeatureSelectorVC;

@interface iBoostCatalogAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FeatureSelectorVC *featureListController;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

