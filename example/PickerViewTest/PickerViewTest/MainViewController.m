//
//  MainViewController.m
//  PickerViewTest
//
//  Created by jinwoo choi on 11. 9. 15..
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
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor orangeColor];
    
    pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [view addSubview:pickerView];    
    
    leftData = [[NSArray alloc] initWithObjects:@"첫번째", @"두번째", @"세번째", nil];
    rightData = [[NSArray alloc] initWithObjects:@"네번째", @"다섯번째", @"여섯번째", nil];
    
    lblText = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 230.0, 300.0, 30.0)];
    lblText.text = @"label";
    [view addSubview:lblText];
    
    self.view = view;
    
    [self updateLabelText];
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
    
    [pickerView release];
    [leftData release];
    [rightData release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    
    switch (component) {
        case 0:
            title = [leftData objectAtIndex:row];
            break;
        case 1:
            title = [rightData objectAtIndex:row];
            break;
            
        default:
            break;
    }
    return title;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 100.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self updateLabelText];
}

- (void) updateLabelText
{
    NSString *leftValue = [NSString stringWithString:[leftData objectAtIndex:[pickerView selectedRowInComponent:0]]];
    NSString *rightValue = [NSString stringWithString:[rightData objectAtIndex:[pickerView selectedRowInComponent:1]]];
    lblText.text = [NSString stringWithFormat:@"%@ %@", leftValue, rightValue];
}

@end
