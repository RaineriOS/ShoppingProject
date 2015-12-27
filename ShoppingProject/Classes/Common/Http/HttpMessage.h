//
//  HttpMessage.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/27.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    RequestMethodPost        = 0,
    RequestMethodGet         = 1,
    // 且支持单个文件流上传
    RequestMethodPostStream  = 2,
    
}RequestMethod;
@interface HttpMessage : NSObject
/** 请求标识*/
@property (nonatomic, assign) E_CMDCODE cmdCode;
//超时时间
@property (nonatomic, assign) CGFloat  timeout;
//请求方法
@property (nonatomic, assign) RequestMethod requestMethod;
//请求的URL
@property (nonatomic, copy) NSString *requestUrl;
//请求参数
@property (nonatomic, strong) NSDictionary *postDataDic;

/** 客户端返回的错误码*/
@property (nonatomic, copy) NSString *errorCode;
/** 返回的内容*/
@property (nonatomic, copy) NSString *responseString;
/** 客户端返回的错误消息   包含一切错误信息*/
@property (nonatomic, strong) NSError   *error;


@end
