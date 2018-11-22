//
//  UIViewController+Camera.h
//  Client
//
//  Created by qq on 2018/10/24.
//  Copyright © 2018年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Camera)
-(void)takePhoto:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate;
- (void)photoAlbum:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate;
-(void)openCamera:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
