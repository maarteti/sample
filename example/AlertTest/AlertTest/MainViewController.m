//
//  MainViewController.m
//  AlertTest
//
//  Created by jinwoo choi on 11. 9. 15..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIView *view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    view.backgroundColor = [UIColor orangeColor];
    
    btnAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnAlert setFrame:CGRectMake(0.0, 0.0, 100.0, 50.0)];
    [btnAlert setTitle:@"Alert" forState:UIControlStateNormal];
    [btnAlert setCenter:CGPointMake(150.0, 220.0)];
    [btnAlert addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchDown];
    
    [view addSubview:btnAlert];
    
    
    UIButton *btnAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnAction setFrame:CGRectMake(0.0, 0.0, 100.0, 50.0)];
    [btnAction setTitle:@"Action" forState:UIControlStateNormal];
    [btnAction setCenter:CGPointMake(150.0, 320.0)];
    [btnAction addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchDown];
    
    [view addSubview:btnAction];

    
    
    
    self.view = view;
    
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [btnAlert release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
     
     
- (void)showAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"알림" message:@"똥이나 싸라" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"알았어", nil];
    [alertView show];
    [alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"click index : %d",buttonIndex );
}

- (void)showAction
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"액션" delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:@"제목" otherButtonTitles:@"기타", nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"click index : %d",buttonIndex );
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"didDismissWithButtonIndex : %d",buttonIndex );
}
@end
