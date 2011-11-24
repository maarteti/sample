//
//  MainViewController.h
//  PhotoViewer
//
//  Created by jinwoo choi on 11. 9. 18..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>

@interface MainViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIImageView *imageView;
}

- (void)viewPhotoLibrary;

@end
