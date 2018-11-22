//
//  SpotlightOption.m
//  Spotlight
//
//  Created by kmyhy on 2018/11/22.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "SpotlightOption.h"

@implementation SpotlightOption

-(instancetype)init{
    if(self = [super init]){
        self.lightColor = [UIColor whiteColor];
        self.darkColor = [UIColor blackColor];
        self.patchBackgroundSnapshot = NO;
    }
    return self;
}
@end
