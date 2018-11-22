//
//  Created by yhy on 2018/11/8.
//  Copyright © 2018年 kmyhy. All rights reserved.
//

#import "UIButton+Spotlight.h"
#import "UIImage+Palette.h"
#import "UIColor+Complementary.h"
#import "UIColor+Hex.h"
#import "UIImage+Extension.h"
#import "UIView+snapshot.h"

@implementation UIButton (Spotlight)

-(void)lightingWithOption:(ButtonSpotlightOption*)option backgroundView:(UIView*)view{
    // 计算 button 在背景 view 上的投射区域
    CGRect r = [self convertRect:self.bounds toView:view];
    
    // 从背景 view 上截取适当区域的截图
    UIImage* snapshot = [view snapshot];
    snapshot = [snapshot cutWithRect:r];
    
    if(!option){
        option = [ButtonSpotlightOption new];
    }
    
    if(option.patchBackgroundSnapshot){
        [self setBackgroundImage:snapshot forState:UIControlStateNormal];
    }
    // 从截图中获取主色调 recommendColor
    [snapshot getPaletteImageColor:^(PaletteColorModel *recommendColor, NSDictionary *allModeColorDic, NSError *error) {
        UIColor* color = [UIColor colorWithHexString:recommendColor.imageColorString];
        
        // 计算背景色是否为暗色，并生成对应的互补色
        UIColor* complementaryColor = [color isDarkColor] ? option.lightColor : option.darkColor;
        // 高亮按钮图片
        UIImage* colorImage;
        
        if(!option.lightingImage){
            colorImage = [self.imageView.image colorImage:complementaryColor];
        }else{
            colorImage = [option.lightingImage colorImage:complementaryColor];
        }
        [self setImage:colorImage forState:UIControlStateNormal];
        
        // 高亮按钮文本
        if(option.lightingText){
            
            [self setTitleColor:complementaryColor forState:UIControlStateNormal];
            
        }
    }];

}
-(void)lightingWithOption:(ButtonSpotlightOption*)option backgroundColor:(UIColor*)color{
    if(!option){
        option = [ButtonSpotlightOption new];
    }
    // 计算背景色是否为暗色，并生成对应的互补色
    UIColor* complementaryColor = [color isDarkColor] ? option.lightColor : option.darkColor;
    
    // 用按钮的 image 进行高光
    UIImage* colorImage;
    
    if(!option.lightingImage){
        colorImage = [self.imageView.image colorImage:complementaryColor];
    }else{
        colorImage = [option.lightingImage colorImage:complementaryColor];
    }
    
    [self setImage:colorImage forState:UIControlStateNormal];
    
    if(option.lightingText){
        
        [self setTitleColor:complementaryColor forState:UIControlStateNormal];
        
    }
}
@end
