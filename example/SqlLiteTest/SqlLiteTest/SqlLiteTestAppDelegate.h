//
//  SqlLiteTestAppDelegate.h
//  SqlLiteTest
//
//  Created by jinwoo choi on 11. 9. 21..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface SqlLiteTestAppDelegate : NSObject <UIApplicationDelegate> {
    MainViewController *mainView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
