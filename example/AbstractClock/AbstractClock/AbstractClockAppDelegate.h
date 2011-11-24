//
//  AbstractClockAppDelegate.h
//  AbstractClock
//
//  Created by jinwoo choi on 11. 9. 3..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainControllerView;
@class OptionNavigationController;

@interface AbstractClockAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainControllerView *mainControllerView;
    OptionNavigationController *optionControllerView;
    
    int optionMode;
    BOOL option24Mode;
    BOOL optionDateInfo;
    BOOL optionAutoLock;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainControllerView *mainControllerView;
@property (nonatomic, retain) OptionNavigationController *optionControllerView;

@property (nonatomic, assign) int optionMode;
@property (nonatomic, assign) BOOL option24Mode;
@property (nonatomic, assign) BOOL optionDateInfo;
@property (nonatomic, assign) BOOL optionAutoLock;

- (void)change24Mode:(UISwitch *)sender;
- (void)changeDateInfo:(UISwitch *)sender;
- (void)changeAutoLock:(UISwitch *)sender;

@end
