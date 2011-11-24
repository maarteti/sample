//
//  WebViewTestAppDelegate.h
//  WebViewTest
//
//  Created by jinwoo choi on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface WebViewTestAppDelegate : NSObject <UIApplicationDelegate> {
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
