//
//  PathConstant.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/22.
//  Copyright © 2015年 郑永能. All rights reserved.
//
#define kDatabaseFileName       @"suningEBuy.sqlite"
static NSString *_DatabaseDirectory;

static inline NSString* DatabaseDirectory() {
    if(!_DatabaseDirectory) {
        NSString* cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        _DatabaseDirectory = [[[cachesDirectory stringByAppendingPathComponent:[[NSProcessInfo processInfo] processName]] stringByAppendingPathComponent:@"Database"] copy];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL isDir = YES;
        BOOL isExist = [fileManager fileExistsAtPath:_DatabaseDirectory isDirectory:&isDir];
        if (!isExist)
        {
            [fileManager createDirectoryAtPath:_DatabaseDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
        }
    }
    
    return _DatabaseDirectory;
}

