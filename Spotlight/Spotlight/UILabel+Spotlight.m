//
//  UILabel+Highlight.m
//  Hightlight
//
//  Created by kmyhy on 2018/11/22.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "UILabel+Spotlight.h"
#import "UIImage+Palette.h"
#import "UIColor+Complementary.h"
#import "UIColor+Hex.h"
#import "UIImage+Extension.h"
#import "UIView+snapshot.h"

@implementation UILabel (Spotlight)

-(void)lightingWithOption:(SpotlightOption*)option backgroundView:(UIView*)view{
    // 计算 label 在背景 view 上的投射区域
    CGRect r = [self convertRect:self.bounds toView:view];
    
    // 从背景 view 上截取适当区域的截图
    UIImage* snapshot = [view snapshot];
    snapshot = [snapshot cutWithRect:r];
    
    if(!option){
        option = [SpotlightOption new];
    }
    
    // 从截图中获取主色调 recommendColor
    [snapshot getPaletteImageColor:^(PaletteColorModel *recommendColor, NSDictionary *allModeColorDic, NSError *error) {
        UIColor* color = [UIColor colorWithHexString:recommendColor.imageColorString];
        
        // 计算背景色是否为暗色，并生成对应的互补色
        UIColor* complementaryColor = [color isDarkColor] ? option.lightColor : option.darkColor;
        // 高亮文本
        [self setTextColor:complementaryColor];

    }];
    
}
-(void)lightingWithOption:(SpotlightOption*)option backgroundColor:(UIColor*)color{
    if(!option){
        option = [SpotlightOption new];
    }
    // 计算背景色是否为暗色，并生成对应的互补色
    UIColor* complementaryColor = [color isDarkColor] ? option.lightColor : option.darkColor;
    [self setTextColor:complementaryColor];
}

@end
