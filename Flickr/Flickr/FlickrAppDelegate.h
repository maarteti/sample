//
//  FlickrAppDelegate.h
//  Flickr
//
//  Created by jinwoo choi on 11. 11. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
