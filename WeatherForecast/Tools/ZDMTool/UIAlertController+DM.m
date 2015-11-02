//
//  UIAlertController+DM.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/17.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "UIAlertController+DM.h"

@implementation UIAlertController (DM)

+ (void)showAlertViewWithMessage:(NSString *)message target:(id)target{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    
    [target presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertViewWithMessage:(NSString *)message target:(id)target handler:(AlertControlerBlock)handler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler();
        }
    }]];
    
    [target presentViewController:alertController animated:YES completion:nil];
}

@end
