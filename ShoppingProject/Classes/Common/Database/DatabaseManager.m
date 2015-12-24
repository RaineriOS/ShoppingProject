//
//  DatabaseManager.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/22.
//  Copyright © 2015年 郑永能. All rights reserved.
//


#include <sqlite3.h>
#import "DatabaseManager.h"
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

@implementation DatabaseManager
DEF_SINGLETON(DatabaseManager);
- (id)init{
    if(self = [super init]){
        
        _isDataBaseOpened = NO;
        
        [self setWritablePath:[DatabaseDirectory() stringByAppendingPathComponent:kDatabaseFileName]];
        
        [self openDataBase];
    }
    return self;
}

- (BOOL)isDatabaseOpened
{
    return _isDataBaseOpened;
}
- (void)openDataBase{
    
    _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:self.writablePath];
    
    if (_databaseQueue == 0x00) {
        _isDataBaseOpened = NO;
        return;
    }
    
    _isDataBaseOpened = YES;
    DLog(@"Open Database OK!");
    [_databaseQueue inDatabase:^(FMDatabase *db){
        [db setShouldCacheStatements:YES];
    }];
}
- (void)closeDataBase{
    if(!_isDataBaseOpened){
        return;
    }
    
    [_databaseQueue close];
    _isDataBaseOpened = NO;
    DLog(@"关闭数据库成功。");
}
-(void)dealloc{
    
    [self closeDataBase];
}
@end
