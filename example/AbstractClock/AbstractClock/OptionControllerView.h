//
//  OptionControllerView.h
//  AbstractClock
//
//  Created by jinwoo choi on 11. 9. 12..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConfigViewDelegate;

@interface OptionControllerView : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    id <ConfigViewDelegate> delegate;
    
    NSMutableArray *listOfItems;
    
}

@property (nonatomic, assign) id <ConfigViewDelegate> delegate;
@property (nonatomic, assign) NSMutableArray *listOfItems;

- (void)selectDone;

@end

@protocol ConfigViewDelegate
- (void)OptionControllerViewDidFinish:(OptionControllerView *)controller;
@end
