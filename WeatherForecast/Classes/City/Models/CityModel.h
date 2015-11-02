//
//  CityModel.h
//  天气
//
//  Created by qianfeng on 15/10/9.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) NSString *parentname;

+ (instancetype)modelWithName:(NSString *)name parentname:(NSString *)parentname code:(NSString *)code;

@end
