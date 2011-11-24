//
//  Photo.h
//  SqlLiteTest
//
//  Created by jinwoo choi on 11. 9. 21..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Photo : NSObject {
    NSInteger id;
    NSString *name;
}

@property (nonatomic, readonly) NSInteger id;
@property (nonatomic, copy) NSString *name;

@end
