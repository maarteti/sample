//
//  MainViewController.m
//  SqlLiteTest
//
//  Created by jinwoo choi on 11. 9. 21..
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
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:bounds];
    
    [view setBackgroundColor:[UIColor redColor]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0.0, 0.0, 100.0, 30.0)];
    [btn setCenter:CGPointMake(200.0, 200.0)];
    [btn setTitle:@"gogo" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(insertTestQuert) forControlEvents:UIControlEventTouchDown];
    [view addSubview:btn];
    
    
                     
    
    /* 어플리케이션 패스를 구한다. */     
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"SQLliteTestDB.sqlite"];
    
    NSLog(@"path: %@", path );
    
    /* 데이터베이스를 오픈한다 */
    if(sqlite3_open([path UTF8String], &db) == SQLITE_OK) {
        char *error = NULL;
        const char* query = "SELECT count(*) from photo2";
        
        /* mytable을 쿼리해보고 오류가 있으면 mytable을 생성한다. */
        if (sqlite3_exec(db, query, NULL, 0, &error) != SQLITE_OK) {
            sqlite3_free(error);
            NSLog(@"mytable을 쿼리해보고 오류가 있으면 mytable을 생성한다.");
            
            /* 테이블 생성 */
            if (sqlite3_exec(db, "CREATE TABLE 'photo2' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR)", NULL, 0, &error) != SQLITE_OK) {
                NSLog(@"테이블 생성");
                
                NSLog(@"TABLE CREATE ERROR: %s", error);
                sqlite3_free(error);
            }    
        }
    } else {
        /* DB 오픈 에러 */
        sqlite3_close(db);
        db = NULL;
        
        NSLog(@"DB OPEN ERROR: '%s'", sqlite3_errmsg(db));    
    }
    
    dataList = [[NSMutableArray alloc] initWithCapacity:100];


    
        
    self.view = view;
    
    [self selectTestQuery];
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
    [dataList release];
    if (db) {
        sqlite3_close(db);
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)selectTestQuery
{
    /* 이전 데이터를 모두 삭제 */
    [dataList removeAllObjects];
    
    const char *query = "SELECT * FROM photo2";
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(db, query, -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            /* dataList에 쿼리결과 등록 */
            NSString* str = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [dataList addObject:str];
            [str release];
        }
    }
    sqlite3_finalize(statement);
    
//    NSLog(@"%@", query );
    NSLog(@"%@ %d", dataList, [dataList count] );
    
}

- (void)insertTestQuert
{
    char *error = NULL;
    
    /* 사용자가 입력한 값을 DB에 추가한다 */
    NSString *query = [NSString stringWithFormat:@"INSERT INTO photo2 (name) VALUES ('%@')", @"test test"];
    sqlite3_exec(db, [query UTF8String], NULL, 0, &error);
    
    [self selectTestQuery];
}

@end
