//
//  UILabel+Highlight.h
//  Hightlight
//
//  Created by kmyhy on 2018/11/22.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpotlightOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Spotlight)

-(void)lightingWithOption:(SpotlightOption*)option backgroundView:(UIView*)view;
-(void)lightingWithOption:(SpotlightOption*)option backgroundColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
