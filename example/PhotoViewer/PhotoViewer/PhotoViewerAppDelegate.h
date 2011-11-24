//
//  PhotoViewerAppDelegate.h
//  PhotoViewer
//
//  Created by jinwoo choi on 11. 9. 18..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface PhotoViewerAppDelegate : NSObject <UIApplicationDelegate> {
    MainViewController *mainViewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
