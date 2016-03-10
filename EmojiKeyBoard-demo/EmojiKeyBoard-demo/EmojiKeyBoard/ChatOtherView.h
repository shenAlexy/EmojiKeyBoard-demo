//
//  ChatOtherView.h
//  joinup_iphone
//
//  Created by shen_gh on 15/7/29.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

/**
 *  照片和拍照
 */
#import <UIKit/UIKit.h>
@import AVFoundation;
@import AssetsLibrary;

#define ChatOtherIconsView_Hight  210.0f

@protocol ChatOtherViewDelegate <NSObject>

-(void)imagePickerControllerSourceType:(UIImagePickerControllerSourceType)sourceType;

@end

@interface ChatOtherView : UIView

@property (nonatomic,assign) id<ChatOtherViewDelegate>delegate;

@end
