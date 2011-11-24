//
//  Photo.m
//  SqlLiteTest
//
//  Created by jinwoo choi on 11. 9. 21..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "Photo.h"

@implementation Photo

@synthesize id, name;

- (void) dealloc 
{
    [name release];
    [super dealloc];
}

@end
