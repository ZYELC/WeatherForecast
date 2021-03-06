//
//  IndexesModel.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/10.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 数据样式
 
     "abbreviation": "zs", (缩写)
     "alias": "",
     "content": "温度不高，其他各项气象条件适宜，中暑机率极低。",  （内容）
     "level": "无",
     "name": "中暑指数"
 */

@interface IndexesModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *level;

@end
