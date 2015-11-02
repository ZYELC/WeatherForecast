//
//  ZDMTool.h
//  糗事百科
//
//  Created by qianfeng on 15/9/19.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessNetworkGetBlock)(id responseObject);
typedef void(^FailureNetworkGetBolck)(NSError *error);

@interface ZDMTool : NSObject

/**
 *  发送AFNetwork的get请求获取数据
 *
 *  @param urlStr       网址
 *  @param parameters   参数
 *  @param successBlock 成功后返回数据
 *  @param failureBlock 失败后返回error
 */
+ (void)sendAFNetworkGet:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(SuccessNetworkGetBlock)successBlock failure:(FailureNetworkGetBolck)failureBlock;

/**
 *  Json数据解析:NSJSONReadingMutableContainers
 *
 *  @param data 需要解析的数据
 *
 *  @return 返回解析后的数据
 */
+ (id)jsonParserWithData:(id)data;


// 取值
+ (id)objectForKey:(NSString *)key;

// 存值
+ (void)setObject:(id)objectValue forKey:(NSString *)key;

@end
