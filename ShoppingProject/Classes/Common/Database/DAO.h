//
//  DAO.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/22.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMDatabaseAdditions.h"

@interface DAO : NSObject
{
    @protected
    FMDatabaseQueue *_databaseQueue;
}

@end
@interface DAO()

@property (nonatomic,strong) FMDatabaseQueue *databaseQueue;

AS_SINGLETON(DAO)
+ (void)createTablesNeeded;
@end