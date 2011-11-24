//
//  MainViewController.h
//  SqlLiteTest
//
//  Created by jinwoo choi on 11. 9. 21..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface MainViewController : UIViewController {
    sqlite3 *db;
    NSMutableArray *dataList;
}

- (void) selectTestQuery;
- (void) insertTestQuert;

@end
