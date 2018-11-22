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
#import <objc/runtime.h>


@implementation UILabel (Spotlight)

-(void)lightingWithOption:(LabelSpotlightOption*)option backgroundView:(UIView*)view{
    // 计算 label 在背景 view 上的投射区域
    CGRect r = [self convertRect:self.bounds toView:view];
    
    // 从背景 view 上截取适当区域的截图
    UIImage* snapshot = [view snapshot];
    snapshot = [snapshot cutWithRect:r];
    
    if(!option){
        option = [LabelSpotlightOption new];
    }
    
    // 从截图中获取主色调 recommendColor
    [snapshot getPaletteImageColor:^(PaletteColorModel *recommendColor, NSDictionary *allModeColorDic, NSError *error) {
        UIColor* color = [UIColor colorWithHexString:recommendColor.imageColorString];
        
        // 计算背景色是否为暗色，并生成对应的互补色
        UIColor* complementaryColor = color.isDarkColor ? option.lightColor : option.darkColor;
        // 高亮文本
        [self setTextColor:complementaryColor];
        [self enhanceBackground:option referencedColor:color];

    }];
    
}
-(void)lightingWithOption:(LabelSpotlightOption*)option backgroundColor:(UIColor*)color{
    if(!option){
        option = [LabelSpotlightOption new];
    }
    // 计算背景色是否为暗色，并生成对应的互补色
    UIColor* complementaryColor = [color isDarkColor] ? option.lightColor : option.darkColor;
    [self setTextColor:complementaryColor];
    [self enhanceBackground:option referencedColor:color];
}
// MARK: 增强背景显示
-(void)enhanceBackground:(LabelSpotlightOption*)option referencedColor:(UIColor*)color{
        // 增强背景显示
    if(option.enhancedBackground && !CGRectIsNull(option.enhancedBackgroundRect)){
        
        if(self.enhancedBackgroundView){
            // 移除原来的 view,避免 view 重复叠加
            [self.enhancedBackgroundView removeFromSuperview];
        }
        UIView* v = [[UIView alloc]initWithFrame:option.enhancedBackgroundRect];
        self.enhancedBackgroundView = v;
        if(option.blendEnhancedBackground){
            v.backgroundColor = color;
        }else{
            v.backgroundColor = color.isDarkColor?option.darkColor:option.lightColor;
        }
        v.alpha = option.enhancedBackgroundAlpha;
        [self.superview insertSubview:v belowSubview:self];
    }
}
// MARK: - Getter/Setter
- (void)setEnhancedBackgroundView:(UIView *)view{
    objc_setAssociatedObject(self, @selector(enhancedBackgroundView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView*)enhancedBackgroundView {
    UIView* view = objc_getAssociatedObject(self, @selector(enhancedBackgroundView));
    return view;
}
@end
