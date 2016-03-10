//
//  ChatOtherView.m
//  joinup_iphone
//
//  Created by shen_gh on 15/7/29.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "ChatOtherView.h"

#define wight  ([UIScreen mainScreen].bounds.size.width)
#define Bt_W 50.0f
#define Bt_H 75.0f
#define Bt_s 15.0f

@interface ButtonIcon : UIButton

@end

@implementation ButtonIcon

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self setTitleColor:kAppMainDarkGrayColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    contentRect = CGRectMake(0, 0, Bt_W, Bt_W);
    return contentRect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    contentRect = CGRectMake(0, Bt_W+5.0f, Bt_W, Bt_H-Bt_W);
    return contentRect;
}

@end


@interface ChatOtherView()
{
    ButtonIcon * _Album;//图片
    ButtonIcon * _Camera;//拍照
}
@end

@implementation ChatOtherView

-(instancetype)init{
    
    return [self initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame{
    frame = CGRectMake(0, 0, wight, ChatOtherIconsView_Hight);
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kAppMainBgColor;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    _Album = [[ButtonIcon alloc]initWithFrame:CGRectMake(Bt_s, Bt_s, Bt_W, Bt_H)];
    [_Album setImage:[UIImage imageNamed:@"btn_pic"] forState:UIControlStateNormal];
    [_Album setTitle:@"相册" forState:UIControlStateNormal];
    [_Album addTarget:self action:@selector(selectPhotoAlbum) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_Album];
    
    _Camera = [[ButtonIcon alloc]initWithFrame:CGRectMake(Bt_W+Bt_s*3, Bt_s, Bt_W, Bt_H)];
    [_Camera setImage:[UIImage imageNamed:@"btn_photo"] forState:UIControlStateNormal];
    [_Camera setTitle:@"拍照" forState:UIControlStateNormal];
    [_Camera addTarget:self action:@selector(selectCamera) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_Camera];
    
}

#pragma mark - 相机,相册-处理
-(void)selectPhotoAlbum{//相册
    ALAuthorizationStatus statu =  [ALAssetsLibrary authorizationStatus];
    switch (statu) {
        case ALAuthorizationStatusAuthorized:
        case ALAuthorizationStatusNotDetermined:
            [self sourceType: UIImagePickerControllerSourceTypePhotoLibrary];
            break;
        default:{
            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的“设置-隐私-照片”中允许访问您的照片" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
            break;
        }
    }
}

-(void)selectCamera{//相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:
        case AVAuthorizationStatusAuthorized:
            if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
                [self sourceType:sourceType];
            }
            break;
            
        default:{
            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"无法访问相机" message:@"请在iPhone的“设置-隐私-相机”中允许访问您的相机" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
            break;
        }
    }
}

#pragma mark - delegate
-(void)sourceType:(UIImagePickerControllerSourceType)type{
    if ([self.delegate respondsToSelector:@selector(imagePickerControllerSourceType:)]) {
        [self.delegate imagePickerControllerSourceType:type];
    }
}

@end
