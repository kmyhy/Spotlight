//
//  UIViewController+Camera.m
//  Client
//
//  Created by yhy on 2018/10/24.
//  Copyright © 2018年 kmyhy. All rights reserved.
//

#import "UIViewController+Camera.h"

@implementation UIViewController (Camera)
-(void)takePhoto:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = delegate;
        //设置拍照后的图片可被编辑
        //        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;

        picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;//后置摄像头
        [self presentViewController:picker animated:YES completion:nil];
        
    }else {
        NSLog(@"该设备无摄像头");
    }
}
-(void)openCamera:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)delegate{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = delegate;
        //设置拍照后的图片可被编辑
        //        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
        picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;//后置摄像头
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:
         UIImagePickerControllerSourceTypeCamera];// 设置相机功能：包含设备支持的的所有功能（拍照、视频等）
//        picker.mediaTypes = @[(NSString *)kUTTypeMovie,(NSString*)kUTTypeMPEG4];    //设置为视频模式-注意媒体类型定义在MobileCoreServices.framework中
        picker.videoQuality = UIImagePickerControllerQualityTypeIFrame1280x720;   //设置视频质量
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;  //设置摄像头打开模式为拍照（但可以切换到其它功能）
        [self presentViewController:picker animated:YES completion:nil];
        
    }else {
        NSLog(@"该设备无摄像头");
    }
}
//从相册选择
- (void)photoAlbum:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.navigationBar.translucent = NO;
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = delegate;
    //设置选择后的图片可被编辑
    //    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}
@end
