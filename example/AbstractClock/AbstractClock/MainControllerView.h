//
//  MainControllerView.h
//  AbstractClock
//
//  Created by jinwoo choi on 11. 9. 3..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionControllerView.h"

@interface MainControllerView : UIViewController <ConfigViewDelegate> {
    UIButton *btnInfo;
    UILabel *lblTime;
    UILabel *lblDate;
    UILabel *lblAmpm;

    UIImageView *bgImgView;
    NSTimer *timer;
    
    NSMutableArray *array;
    int index;
}

@property(nonatomic, retain) UIButton *btnInfo;
@property(nonatomic, retain) UILabel *lblTime;
@property(nonatomic, retain) UILabel *lblDate;
@property(nonatomic, retain) UILabel *lblAmpm;
@property(nonatomic, retain) UIImageView *bgImgView;
@property(nonatomic, retain) NSTimer *timer;

- (void)showInfo;

@end
