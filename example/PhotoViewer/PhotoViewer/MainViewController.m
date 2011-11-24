//
//  MainViewController.m
//  PhotoViewer
//
//  Created by jinwoo choi on 11. 9. 18..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(id) init
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    view.backgroundColor = [UIColor redColor];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)];
    [view addSubview:imageView];
    

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0.0, 0.0, 100.0, 40.0)];
    [btn setTitle:@"photo" forState:UIControlStateNormal];
    [btn setCenter:CGPointMake(320/2, 480/2)];
    [btn addTarget:self action:@selector(viewPhotoLibrary) forControlEvents:UIControlEventTouchDown];
    [view addSubview:btn]; 
    
        
    self.view = view;
    
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    NSLog(@"loadView");
       
   
                    
}

- (void)viewPhotoLibrary
{
    
    //    UIImage *sShot = [UIImage imageNamed:@"photo.jpg"];
    //    UIImageWriteToSavedPhotosAlbum(sShot, nil, nil, nil);
    //    [sShot release];
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    
    imagePicker.delegate = self;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentModalViewController:imagePicker animated:YES];
    
    //    imagePicker.mediaTypes = [NSArray arrayWithObjects:
    //                              (NSString *) kUTTypeImage,
    //                              (NSString *) kUTTypeMovie, nil];
    //    
    //    imagePicker.allowsEditing = YES;
    //    [self presentModalViewController:imagePicker 
    //                            animated:YES];
    //    [imagePicker release];
    
    [imagePicker release];

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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [imageView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    UIImage *image = info.
//    [imageView setImage:image];
}

@end
