//
//  AbstractClockAppDelegate.m
//  AbstractClock
//
//  Created by jinwoo choi on 11. 9. 3..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "AbstractClockAppDelegate.h"
#import "MainControllerView.h"
#import "OptionControllerView.h"

@implementation AbstractClockAppDelegate

@synthesize window;
@synthesize mainControllerView;
@synthesize optionControllerView;

@synthesize optionMode;
@synthesize option24Mode;
@synthesize optionAutoLock;
@synthesize optionDateInfo;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    mainControllerView = [[MainControllerView alloc] init];
    [window addSubview:mainControllerView.view];

//    UIViewController *uiv = [[UIViewController alloc] init];
//    optionControllerView = [[OptionControllerView alloc] initWithRootViewController:uiv];
//    [window addSubview:optionControllerView.view];
    
    [self.window makeKeyAndVisible];
    
    optionMode = 0;
    option24Mode = YES;
    optionAutoLock = NO;
    optionDateInfo = NO;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)change24Mode:(UISwitch *)sender
{
    option24Mode = sender.on;
}

- (void)changeDateInfo:(UISwitch *)sender
{
    optionDateInfo = sender.on;
}

- (void)changeAutoLock:(UISwitch *)sender
{
    optionAutoLock = sender.on;
}

- (void)dealloc
{
    [mainControllerView release];
    [optionControllerView release];
    [window release];
    [super dealloc];
}

@end
