//
//  CityModel.h
//  天气
//
//  Created by qianfeng on 14/5/9.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) NSString *parentname;

+ (instancetype)modelWithName:(NSString *)name parentname:(NSString *)parentname code:(NSString *)code;

@end
