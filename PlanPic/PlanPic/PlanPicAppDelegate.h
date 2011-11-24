//
//  PlanPicAppDelegate.h
//  PlanPic
//
//  Created by jinwoo choi on 11. 11. 22..
//  Copyright (c) 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuBarController;

@interface PlanPicAppDelegate : UIResponder <UIApplicationDelegate> {
    MenuBarController *menuBarCtrl;
}

@property (strong, nonatomic) UIWindow *window;

@end
