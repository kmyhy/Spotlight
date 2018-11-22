//
//  ButtonSpotlightOption.h
//
//  Created by kmyhy on 2018/11/8.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpotlightOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonSpotlightOption : SpotlightOption
@property(assign, nonatomic) BOOL lightingText;             // 是否同时对文本进行高亮
@property (strong, nonatomic) UIImage* lightingImage;       // 要加光的图片

@end

NS_ASSUME_NONNULL_END
