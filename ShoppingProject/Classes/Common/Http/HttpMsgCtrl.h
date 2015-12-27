//
//  HttpMsgCtrl.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/27.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpMessage.h"

@protocol  HttpMsgCtrlDelegate <NSObject>
//- (void)requestDidStart:(ASIHTTPRequest *)request;
//- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders;
- (void)requestDidFinished:(NSString *)logString;
- (void)requestDidFailed:(NSString *)logString;
@end

@interface HttpMsgCtrl : NSObject

@property (nonatomic, weak) id<HttpMsgCtrlDelegate> delegate;


/*!
 @abstract      发送一个请求
 @discussion    封装好了请求的参数信息的sendMsg，传递给该方法即可异步发送请求
 @param         sendMsg  封装好了请求的参数信息、和标识的对象
 */
-(void)sendHttpMsg:(HttpMessage *)sendMsg success:(void(^)(id responseObject))success   failure:(void(^)(NSError *))failure;

/**
 *  取消请求
 */
-(void)cancelHttpMsg;

@end
