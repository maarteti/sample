//
//  MainViewController.h
//  AlertTest
//
//  Created by jinwoo choi on 11. 9. 15..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate> {
    UIButton *btnAlert;
    
}

- (void)showAlert;
- (void)showAction;

@end
