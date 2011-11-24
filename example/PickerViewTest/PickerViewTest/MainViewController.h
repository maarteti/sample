//
//  MainViewController.h
//  PickerViewTest
//
//  Created by jinwoo choi on 11. 9. 15..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *pickerView;
    UILabel *lblText;
    
    NSArray *leftData;
    NSArray *rightData;
}

- (void) updateLabelText;

@end
