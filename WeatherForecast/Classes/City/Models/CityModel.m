//
//  CityModel.m
//  天气
//
//  Created by qianfeng on 15/10/9.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

+ (instancetype)modelWithName:(NSString *)name parentname:(NSString *)parentname code:(NSString *)code
{
    CityModel *model = [[CityModel alloc] init];
    model.name = name;
    model.parentname = parentname;
    model.code = code;
    
    return model;
}

- (NSString *)description
{
    return [NSString  stringWithFormat:@"\nname:%@,parentname:%@,code:%@",_name,_parentname,_code];
}

@end
