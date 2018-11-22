//
//  ViewController.m
//  BlackOrWhiteImageButton
//
//  Created by qq on 2018/11/8.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Camera.h"
#import <Photos/Photos.h>
#import "UIButton+Spotlight.h"
#import "UILabel+Spotlight.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ivPhotoPreview;
@property (weak, nonatomic) IBOutlet UIButton *btChoosePhoto;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btBack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btChoosePhotoClicked:(id)sender {
    [self photoAlbum:self];
}

// MARK: - ImagePicker 委托协议
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    
    UIImage* image = info[@"UIImagePickerControllerOriginalImage"];
    
    if(image){
        self.ivPhotoPreview.image = image;
        
        ButtonSpotlightOption* option = [ButtonSpotlightOption new];
        option.lightingText = YES;// 默认 NO
        option.lightColor = [UIColor yellowColor];// 默认为白色
        option.darkColor = [UIColor purpleColor];// 默认为黑色
//        option.patchBackgroundSnapshot = YES;
        [self.btBack lightingWithOption:option backgroundView:self.ivPhotoPreview];
        
        SpotlightOption* opt = [SpotlightOption new];
        opt.lightColor = [UIColor yellowColor];// 默认为白色
        opt.darkColor = [UIColor purpleColor];// 默认为黑色
        
        [self.label lightingWithOption:opt backgroundView:self.ivPhotoPreview];
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
