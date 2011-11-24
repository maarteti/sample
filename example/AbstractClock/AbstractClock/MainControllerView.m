//
//  MainControllerView.m
//  AbstractClock
//
//  Created by jinwoo choi on 11. 9. 3..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainControllerView.h"
#import "OptionControllerView.h"
#import "AbstractClockAppDelegate.h"

@implementation MainControllerView

@synthesize btnInfo;
@synthesize lblTime;
@synthesize lblDate;
@synthesize lblAmpm;
@synthesize bgImgView;
@synthesize timer;

- (id)init
{
    UIView *v = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    v.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:v];
    [v release];
    
    CGSize scrSize = [[UIScreen mainScreen] bounds].size;
    lblTime = [[UILabel alloc] initWithFrame:CGRectMake(scrSize.width-210, 65.0, 200.0, 40.0)];
    lblDate = [[UILabel alloc] initWithFrame:CGRectMake(scrSize.width-110, 40.0, 100.0, 20.0)];
    lblAmpm = [[UILabel alloc] initWithFrame:CGRectMake(scrSize.width-160, 60.0, 30.0, 40.0)];
    
    UIFont *fontStyle = [UIFont fontWithName:@"Helvetica-Bold" size:30.0];
    lblTime.textAlignment = UITextAlignmentRight;
    
    [lblTime setFont:fontStyle];
    
    lblDate.textAlignment = UITextAlignmentRight;
    
    [self.view addSubview:lblTime];
    [self.view addSubview:lblDate];
    [self.view addSubview:lblAmpm];
    
    [lblTime release];
    [lblDate release];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(interval) userInfo:nil repeats:YES];
    
    array = [[NSMutableArray alloc] init];
    
    
    for (int i=0; i<10; i++) {
        UIImage *bbb = [UIImage imageNamed:@"bonobono1.jpeg"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:bbb];
        [array addObject:imageView]; 
        
        [v addSubview:imageView];      
        int x = rand()%320;
        int y = rand()%480;
        imageView.center = CGPointMake(-999.0, -999.0);
        [imageView release];
    }
    
    index = 0;
    
//    UIImage *bono = [UIImage imageNamed:@"bonobono1.jpeg"];
//    bgImgView = [[UIImageView alloc] initWithImage:bono];
//    [v addSubview:bgImgView];          
//    bgImgView.center = CGPointMake(100.0, 200.0);

    
    UIImage *image = [UIImage imageNamed:@"bonobono2.jpeg"];
    btnInfo = [[UIButton alloc] init];
    [btnInfo sizeToFit];
    [btnInfo setFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)];
    [btnInfo setImage:image forState:UIControlStateNormal];
    [btnInfo addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchDown];
    btnInfo.highlighted = NO;
    [v addSubview:btnInfo];    
    return self;
}
     

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    NSLog(@"viewDidUnload");
    
    [array release];
    
    [btnInfo release];
    [lblTime release];
    [lblDate release];
    [lblAmpm release];
    [bgImgView release];
    [timer release];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)showInfo
{
    NSLog(@"showInfo");
    
    OptionControllerView *optView = [[OptionControllerView alloc] init];
    optView.delegate = self;    
    optView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:optView animated:YES];
    
    if([timer isValid]){
        [timer invalidate];
        timer = nil;
    }    
    
    [optView release];
    
}

- (void)interval
{
//    NSLog(@"interval");
    
    AbstractClockAppDelegate *appDelegate = (AbstractClockAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] 
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents = 
        [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:today];
    
    NSString *ampm;
    int hour = [weekdayComponents hour];
    if( appDelegate.option24Mode == NO ){
        if( hour > 12 ){
            ampm = @"PM";
        } else {
            ampm = @"AM";
        }
        hour = hour % 12;        
    } else {
        ampm = @"";
    }
    
    NSString *date = [NSString stringWithFormat:@"%d/%02d/%02d", [weekdayComponents year], [weekdayComponents month], [weekdayComponents day]];
    NSString *time = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, [weekdayComponents minute], [weekdayComponents second]];
    
    
    int r = rand()%20+1;
    float f = r/10.0;
    
    NSLog(@"%@", [array objectAtIndex:index]);
    
    index++;
    
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut
//                     animations:^(void) {
//                        bgImgView.transform = CGAffineTransformMakeScale(f, f);
//                     } completion:^(BOOL finished) {
////                      bgImgView.transform = CGAffineTransformIdentity;                         
//                     }];
    
    
    

    [lblAmpm setText:ampm];
    [lblTime setText:time];
    [lblDate setText:date];
}

- (void)OptionControllerViewDidFinish:(OptionControllerView *)controller {
    [self dismissModalViewControllerAnimated:YES];
    NSLog(@"fini");
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(interval) userInfo:nil repeats:YES];
}

@end
