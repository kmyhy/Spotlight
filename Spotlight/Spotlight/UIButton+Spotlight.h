//
//  Created by yhy on 2018/11/8.
//  Copyright © 2018年 kmyhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonSpotlightOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Spotlight)
// MARK: 根据按钮背景的主题色设置按钮的图片/文字颜色
-(void)lightingWithOption:(ButtonSpotlightOption*)option backgroundView:(UIView*)view;
-(void)lightingWithOption:(ButtonSpotlightOption*)option backgroundColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
