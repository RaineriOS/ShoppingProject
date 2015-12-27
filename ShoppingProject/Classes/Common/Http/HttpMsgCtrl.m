//
//  HttpMsgCtrl.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/27.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "HttpMsgCtrl.h"
#import "AFNetworking.h"


@interface HttpMsgCtrl ()
{
    AFHTTPSessionManager *_manager ;
    NSURLSessionDataTask *_task;

}
@end

@implementation HttpMsgCtrl


- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
    }
    return self;
}

#pragma mark - 发送请求
-(void)sendHttpMsg:(HttpMessage *)sendMsg success:(void(^)(id responseObject))success   failure:(void(^)(NSError *))failure
{
    //序列化和超时
    _manager.requestSerializer.timeoutInterval = sendMsg.timeout;
    _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    if (sendMsg.requestMethod == RequestMethodGet) {
        _task = [_manager GET:sendMsg.requestUrl parameters:sendMsg.postDataDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSString *result =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
             SNLogDebug(@"success - %@",result);
             //message.responseString = result;
             id jsonResult =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
             
             if (success) {
                 success(jsonResult);
             }
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             SNLogError(@"GET-Http:error - %@",error);
             sendMsg.error = error;
             if (failure) {
                 failure(error);
             }
         }];
    }
    else if(sendMsg.requestMethod == RequestMethodPost)
    {
       _task = [_manager POST:sendMsg.requestUrl parameters:sendMsg.postDataDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSString *result =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            SNLogDebug(@"success - %@",result);
            //message.responseString = result;
            id jsonResult =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            
            if (success) {
                success(jsonResult);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            SNLogError(@"Post-Http:error - %@",error);
            sendMsg.error = error;
            if (failure) {
                failure(error);
            }
        }];

    }
    else if (sendMsg.requestMethod == RequestMethodPostStream)
    {
    
    
    }
    
    
}
#pragma mark - 取消http请求
-(void)cancelHttpMsg
{
    [_task cancel];
    _task = nil;
    _delegate = nil;

}
@end
