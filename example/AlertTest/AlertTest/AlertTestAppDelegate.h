//
//  AlertTestAppDelegate.h
//  AlertTest
//
//  Created by jinwoo choi on 11. 9. 15..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AlertTestAppDelegate : NSObject <UIApplicationDelegate> {
    MainViewController *mainViewController;    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
