//
//  ZDMTool.m
//  糗事百科
//
//  Created by qianfeng on 15/9/19.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZDMTool.h"

@implementation ZDMTool

/**
 *  发送AFNetwork的get请求获取数据
 *
 *  @param urlStr       网址
 *  @param parameters   参数
 *  @param successBlock 成功后返回数据
 *  @param failureBlock 失败后返回error
 */
+ (void)sendAFNetworkGet:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(SuccessNetworkGetBlock)successBlock failure:(FailureNetworkGetBolck)failureBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock([self jsonParserWithData:responseObject]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

/**
 *  Json数据解析:NSJSONReadingMutableContainers
 *
 *  @param data 需要解析的数据
 *
 *  @return 返回解析后的数据
 */
+ (id)jsonParserWithData:(id)data
{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

// 取值
+ (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

// 存值
+ (void)setObject:(id)objectValue forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setValue:objectValue forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
