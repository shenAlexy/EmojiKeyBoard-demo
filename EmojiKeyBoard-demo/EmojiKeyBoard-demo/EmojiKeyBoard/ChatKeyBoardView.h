//
//  ChatKeyBoardView.h
//  joinup_iphone
//
//  Created by shen_gh on 15/7/29.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//


/**
 *  聊天键盘
 */
#import <UIKit/UIKit.h>
#import "ChatInputTextView.h"//聊天输入

@class ChatKeyBoardView;

@protocol ChatKeyBoardViewDelegate <NSObject>

@optional
//根据键盘是否弹起，设置tableView frame
-(void)keyBoardView:(ChatKeyBoardView *)keyBoard ChangeDuration:(CGFloat)durtaion;

//发送消息
-(void)keyBoardView:(ChatKeyBoardView*)keyBoard sendMessage:(NSString*)message;

//相册、拍照
-(void)keyBoardView:(ChatKeyBoardView*)keyBoard imgPicType:(UIImagePickerControllerSourceType)sourceType;

@end

@interface ChatKeyBoardView : UIView

@property (nonatomic,strong) UIView *chatBgView;//聊天框
@property (nonatomic,strong) ChatInputTextView *chatInputTextView;//聊天输入
@property (nonatomic,assign) id<ChatKeyBoardViewDelegate>delegate;

//初始化init
- (instancetype)initWithDelegate:(id)delegate superView:(UIView *)superView;

//动态调整textView的高度
-(void)textViewChangeText;

//
-(void)tapAction;

@end
