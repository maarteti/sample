//
//  ViewController.m
//  NaviTest
//
//  Created by jinwoo choi on 11. 9. 14..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id)init
{
    self = [super init];
    if(self) {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(next)] autorelease];
    }
    return self;
}

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
    NSLog(@"loadView");
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    NSArray *arr = [self.navigationController viewControllers];
    int i = [arr indexOfObject:self];
    self.title = [NSString stringWithFormat:@"%i번 컨트롤러",i];
}

- (void)next
{
    NSArray *arr = [self.navigationController viewControllers];
    int i = [arr indexOfObject:self];
    if( i == 5 ){
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        ViewController *v = [ViewController new];
        [self.navigationController pushViewController:v animated:YES];
        [v release];
    }
}

@end
