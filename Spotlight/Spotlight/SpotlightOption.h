//
//  SpotlightOption.h
//  Spotlight
//
//  Created by kmyhy on 2018/11/22.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpotlightOption : NSObject
@property (strong, nonatomic)UIColor* lightColor; // 高亮时的颜色,典型的如白色
@property (strong, nonatomic)UIColor* darkColor;  // 加暗时的颜色，典型的如黑色
@property(assign, nonatomic) BOOL patchBackgroundSnapshot;  // 是否在按钮后面贴上一小块截图，测试用

@end

NS_ASSUME_NONNULL_END
