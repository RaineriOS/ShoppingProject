//
//  DatabaseManager.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/22.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabaseQueue;
@interface DatabaseManager : NSObject
{
    BOOL _isInitializeSuccess;
    
    BOOL _isDataBaseOpened;
    
    NSString *_writablePath;
 

}
@property (nonatomic, copy) NSString *writablePath;

@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;



- (BOOL)isDatabaseOpened;

- (void)openDataBase;

- (void)closeDataBase;
AS_SINGLETON(DatabaseManager);

@end
