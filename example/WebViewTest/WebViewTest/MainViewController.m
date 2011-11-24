//
//  MainViewController.m
//  WebViewTest
//
//  Created by jinwoo choi on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    UIView *view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    view.backgroundColor = [UIColor orangeColor];
    
    url = [[[UITextField alloc] initWithFrame:CGRectMake(10.0, 30.0, 240.0, 30.0)] autorelease];
    [url setBorderStyle:UITextBorderStyleBezel];
    [url setPlaceholder:@"http://www.daum.net"]; 
    [url setDelegate:self];
    [url setBackgroundColor:[UIColor whiteColor]];
    [view addSubview:url];
    
    UIButton *btnSubmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnSubmit setFrame:CGRectMake(260.0, 30.0, 50.0, 30.0)];
    [btnSubmit setTitle:@"Go" forState:UIControlStateNormal];
    [btnSubmit addTarget:self
                  action:@selector(inputReturnHandler:) forControlEvents:UIControlEventTouchDown];
    [view addSubview:btnSubmit];
    
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 70.0, 320.0, 410.0)];
    webView.delegate = self;
    [view addSubview:webView]; 
    
    accel = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    accel.center = CGPointMake(320/2, 480/2);
    [view addSubview:accel];
       
    self.view = view;
    
     NSLog(@"viewLoad");
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
    [webView release];
    [url release];
    [accel release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self changeWebViewUrl:textField.text];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:textField.text]]];
    
    return YES;
}

- (void)inputReturnHandler:(id *)sender
{
    [self changeWebViewUrl:url.text];
}

- (void)changeWebViewUrl:(NSString *)urlStr
{
    NSLog(@"%@", urlStr );
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"start");
    [accel startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"end");
    [accel stopAnimating];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@", request.mainDocumentURL.absoluteString);
    url.text = request.mainDocumentURL.absoluteString;
    return YES;
}
@end
