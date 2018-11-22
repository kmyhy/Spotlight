//
//  LabelSpotlightOption.h
//  Spotlight
//
//  Created by qq on 2018/11/22.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpotlightOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface LabelSpotlightOption : SpotlightOption

@property(assign, nonatomic) BOOL enhancedBackground; // 是否增强背景，即设置一个强对比的背景色
@property(assign, nonatomic) CGRect enhancedBackgroundRect; // 增强背景的 frame
@property(assign, nonatomic) CGFloat enhancedBackgroundAlpha;// 增强背景的 alpha
@property (assign, nonatomic) BOOL blendEnhancedBackground; // 融合模式：使用背景主色调作为增强背景的颜色
@end

NS_ASSUME_NONNULL_END
