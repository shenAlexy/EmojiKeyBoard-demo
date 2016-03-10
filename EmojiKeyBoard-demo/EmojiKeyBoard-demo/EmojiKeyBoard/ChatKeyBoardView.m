//
//  ChatKeyBoardView.m
//  joinup_iphone
//
//  Created by shen_gh on 15/7/29.
//  Copyright (c) 2015年 com.joinup. All rights reserved.
//

#import "ChatKeyBoardView.h"
#import "ChatKeyBoardAnimationView.h"//聊天框底部contain
#import "ChatEmojiView.h"//表情键盘View
#import "ChatOtherView.h"//照片和拍照
#import "EmojiObj.h"
#import "EmojiTextAttachment.h"


@interface ChatKeyBoardView()
<ChatEmojiViewDelegate,ChatOtherViewDelegate,
UITextViewDelegate>
{
    NSArray *_icons;//表情、添加按钮集
    CGFloat hight_text_one;
    
    BOOL keyBoardTap;
    ChatEmojiView *_emojiView;//表情键盘
    ChatOtherView *_otherView;//照片和拍照View
    
}
@property (nonatomic,strong) ChatKeyBoardAnimationView *bottomView;

@property (nonatomic,strong) UIButton *faceBtn;//表情按钮
@property (nonatomic,strong) UIButton *otherBtn;//其他按钮(图片、拍照)
@property (nonatomic,strong) UIButton *sendBtn;//发送按钮
@end

@implementation ChatKeyBoardView

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 初始化 init
- (instancetype)initWithDelegate:(id)delegate superView:(UIView *)superView{
    self=[super init];
    if (self) {
        //布局View
        [self setUpView];
        [self addNotifations];
        [self addToSuperView:superView];
        self.delegate=delegate;
    }
    return self;
}

#pragma mark setUpView
- (void)setUpView{
    //聊天框及bottomView
    [self initChatBgView];
    //添加按钮
    [self addIcons];
    //表情视图和 图片，拍照
    [self initIconsContentView];
    
}
- (void)initChatBgView{
    //聊天框
    [self addSubview:self.chatBgView];
    [self addSubview:self.bottomView];
}

//聊天框
- (UIView *)chatBgView{
    if (!_chatBgView) {
        _chatBgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTabBarHeight+0.5)];
        [_chatBgView setBackgroundColor:UICOLOR_FROM_RGB(245, 245, 245, 1)];
        [_chatBgView.layer setBorderColor:kAppLightGrayColor.CGColor];
        [_chatBgView.layer setBorderWidth:0.5];
        [_chatBgView addSubview:self.chatInputTextView];
        [_chatBgView addSubview:self.sendBtn];
    }
    return _chatBgView;
}

//聊天框底部View
- (ChatKeyBoardAnimationView *)bottomView{
    if (!_bottomView) {
        _bottomView=[[ChatKeyBoardAnimationView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.chatBgView.frame), kScreenWidth, ChatEmojiView_Hight)];
    }
    return _bottomView;
}

-(void)initIconsContentView{
    _emojiView = [[ChatEmojiView alloc]init];
    _emojiView.delegate = self;
    
    _otherView = [[ChatOtherView alloc]init];
    _otherView.delegate = self;
}


#pragma mark 添加表情、+按钮
- (void)addIcons{
    _icons=@[self.faceBtn,self.otherBtn];
    
    for (UIButton *btn in _icons) {
        [btn setImage:[UIImage imageNamed:@"chat_bottom_keyboard_nor"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(iconsAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.chatBgView addSubview:btn];
    }
}

//表情
- (UIButton *)faceBtn{
    if (!_faceBtn) {
        _faceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_faceBtn setFrame:CGRectMake(3, 0, 35, kTabBarHeight)];
        [_faceBtn setImage:[UIImage imageNamed:@"ic_emoji_blue"] forState:UIControlStateNormal];
        [_faceBtn setTag:1];
    }
    return _faceBtn;
}
//+
- (UIButton *)otherBtn{
    if (!_otherBtn) {
        _otherBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_otherBtn setFrame:CGRectMake(self.faceBtn.current_x_w, 0, 40, kTabBarHeight)];
        [_otherBtn setImage:[UIImage imageNamed:@"ic_add_blue"] forState:UIControlStateNormal];
        [_otherBtn setTag:2];
    }
    return _otherBtn;
}

//聊天输入
- (ChatInputTextView *)chatInputTextView{
    if (!_chatInputTextView) {
        _chatInputTextView=[[ChatInputTextView alloc]init];
        [_chatInputTextView setFont:UIFont_size(16.0)];
        [_chatInputTextView setBackgroundColor:kAppWhiteColor];
        [_chatInputTextView.layer setBorderWidth:0.5];
        [_chatInputTextView.layer setBorderColor:kAppLineColor.CGColor];
        [_chatInputTextView.layer setCornerRadius:kAppMainCornerRadius];
        [_chatInputTextView.layer setMasksToBounds:YES];
        [_chatInputTextView setReturnKeyType:UIReturnKeySend];
        [_chatInputTextView setEnablesReturnKeyAutomatically:YES];
        [_chatInputTextView setTextContainerInset:UIEdgeInsetsMake(10, 0, 5, 0)];
        [_chatInputTextView setDelegate:self];
        
        hight_text_one = [_chatInputTextView.layoutManager usedRectForTextContainer:_chatInputTextView.textContainer].size.height;
        
        [_chatInputTextView setFrame:CGRectMake(CGRectGetMaxX(self.otherBtn.frame)+3, 5,kScreenWidth-150, hight_text_one+20)];
        
    }
    return _chatInputTextView;
}

//发送
- (UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_sendBtn setFrame:CGRectMake(self.chatInputTextView.current_x_w+8, 8, kScreenWidth-10-(self.chatInputTextView.current_x_w+3),kTabBarHeight-16)];
        [_sendBtn.layer setBorderColor:kAppMainLightBrownColor.CGColor];
        [_sendBtn.layer setBorderWidth:0.5];
        [_sendBtn setTitleColor:kAppMainLightBrownColor forState:UIControlStateNormal];
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [_sendBtn.titleLabel setFont:UIFont_size(14.0)];
        [_sendBtn setBackgroundImage:[UIImage imageFormColor:kAppWhiteColor frame:_sendBtn.bounds] forState:UIControlStateNormal];
        [_sendBtn setBackgroundImage:[UIImage imageFormColor:kAppLineColor frame:_sendBtn.bounds] forState:UIControlStateHighlighted];
        [_sendBtn addTarget:self action:@selector(sendBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}

#pragma mark textView delegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(![textView hasText] && [text isEqualToString:@""]) {
        return NO;
    }
    if ([text isEqualToString:@"\n"]) {
        [self sendMessage];
        return NO;
    }
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView{
    [self textViewChangeText];
}

-(void)sendMessage{
    if (![self.chatInputTextView hasText]&&(self.chatInputTextView.text.length==0)) {
        return;
    }
    NSString *plainText = self.chatInputTextView.plainText;
    //空格处理
    plainText = [plainText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (plainText.length > 0) {
        [self sendMessage:plainText];
        self.chatInputTextView.text = @"";
        [self textViewChangeText];
    }
}

#pragma mark 添加通知
- (void)addNotifations{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardHiden:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
}
#pragma mark - 系统键盘通知事件
-(void)keyBoardHiden:(NSNotification*)noti{
    //隐藏键盘
    if (keyBoardTap==NO) {
        CGRect endF = [[noti.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
        CGFloat duration = [[noti.userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        CGRect fram = self.frame;
        fram.origin.y = (endF.origin.y - self.chatBgView.frame.size.height);
        [self duration:duration EndF:fram];
    }else{
        keyBoardTap = NO;
    }
}

-(void)duration:(CGFloat)duration EndF:(CGRect)endF{
    [UIView animateWithDuration:duration animations:^{
        keyBoardTap = NO;
        self.frame = endF;
    }];
    [self changeDuration:duration];
}

#pragma mark - self delegate action
-(void)changeDuration:(CGFloat)duration{
    //动态调整tableView高度
    if (_delegate&&[self.delegate respondsToSelector:@selector(keyBoardView:ChangeDuration:)]) {
        [self.delegate keyBoardView:self ChangeDuration:duration];
    }
}
- (void)sendMessage:(NSString *)message{
    //发送消息
    if (_delegate&&[self.delegate respondsToSelector:@selector(keyBoardView:sendMessage:)]) {
        [_delegate keyBoardView:self sendMessage:message];
    }
}
-(void)imagePickerControllerSourceType:(UIImagePickerControllerSourceType)sourceType{
    //相册  拍照
    if (_delegate&&[self.delegate respondsToSelector:@selector(keyBoardView:imgPicType:)]) {
        [self.delegate keyBoardView:self imgPicType:sourceType];
    }
}


-(void)keyBoardShow:(NSNotification*)noti{
    //显示键盘
    CGRect endF = [[noti.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    if (keyBoardTap==NO) {
        for (UIButton * b in _icons) {
            b.selected = NO;
        }
        [self.bottomView addSubview:[UIView new]];
        
        NSTimeInterval duration = [[noti.userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        CGRect fram = self.frame;
        fram.origin.y = (endF.origin.y - _chatBgView.frame.size.height);
        [self duration:duration EndF:fram];
    }else{
        keyBoardTap = NO;
    }
}

#pragma mark addToSuperView
- (void)addToSuperView:(UIView *)superView{
    CGFloat s_h = CGRectGetHeight(superView.bounds);
    CGRect frame = CGRectMake(0,s_h-kTabBarHeight-0.5,kScreenWidth, s_h+0.5);
    self.frame = frame;
    [superView addSubview:self];
}

#pragma mark Event
- (void)iconsAction:(UIButton *)sender{
    if (sender.selected) {
        [self.chatInputTextView becomeFirstResponder];
        return;
    }else{
        keyBoardTap = YES;
        [self.chatInputTextView resignFirstResponder];
    }
    for (UIButton * b in _icons) {
        if ([b isEqual:sender]) {
            sender.selected = !sender.selected;
        }else{
            b.selected = NO;
        }
    }
    UIView * visiableView;
    switch (sender.tag) {
        case 1:
        {
            //表情
            visiableView=_emojiView;
        }
            break;
        case 2:{
            //+
            visiableView=_otherView;
        }
            break;
        default:{
            visiableView=[[UIView alloc]init];
        }
            break;
    }
    
    [self.bottomView addSubview:visiableView];
    CGRect fram = self.frame;
    fram.origin.y =kScreenHeight- (CGRectGetHeight(visiableView.frame) + self.chatBgView.bounds.size.height);
    [self duration:DURTAION EndF:fram];
}

#pragma mark - self public api action
-(void)tapAction{
    UIButton * b = [[UIButton alloc]init];
    b.selected = NO;
    [self iconsAction:b];
}

//动态调整textView的高度
-(void)textViewChangeText{
    CGFloat h = [self.chatInputTextView.layoutManager usedRectForTextContainer:self.chatInputTextView.textContainer].size.height;
    self.chatInputTextView.contentSize = CGSizeMake(self.chatInputTextView.contentSize.width, h+20);
    CGFloat five_h = hight_text_one*5.0f;
    h = h>five_h?five_h:h;
    CGRect frame = self.chatInputTextView.frame;
    CGFloat diff = self.chatBgView.frame.size.height - self.chatInputTextView.frame.size.height;
    if (frame.size.height == h+20) {
        if (h == five_h) {
            [self.chatInputTextView setContentOffset:CGPointMake(0, self.chatInputTextView.contentSize.height - h - 20) animated:NO];
        }
        return;
    }
    
    frame.size.height = h+20;
    self.chatInputTextView.frame = frame;
    [self topLayoutSubViewWithH:(frame.size.height+diff)];
    [self.chatInputTextView setContentOffset:CGPointZero animated:YES];
}

-(void)topLayoutSubViewWithH:(CGFloat)hight{
    CGRect frame = self.chatBgView.frame;
    CGFloat diff = hight - frame.size.height;
    frame.size.height = hight;
    self.chatBgView.frame = frame;
    
    frame = self.bottomView.frame;
    frame.origin.y = CGRectGetHeight(self.chatBgView.bounds);
    self.bottomView.frame = frame;
    
    frame = self.frame;
    frame.origin.y -= diff;
    
    [self duration:DURTAION EndF:frame];
}

#pragma mark Event
- (void)sendBtnClicked{
    //发送
    if (![self.chatInputTextView hasText]&&(self.chatInputTextView.text.length==0)) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"不能发送空白消息" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    NSString *plainText = self.chatInputTextView.plainText;
    //空格处理
    plainText = [plainText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (plainText.length > 0) {
        [self sendMessage:plainText];
        self.chatInputTextView.text = @"";
        [self textViewChangeText];
    }
    
}

#pragma mark - chat Emoji View Delegate
- (void)chatEmojiViewSelectEmojiIcon:(EmojiObj *)objIcon{
    //选择了某个表情
    EmojiTextAttachment *attach = [[EmojiTextAttachment alloc] initWithData:nil ofType:nil];
    attach.Top = -3.5;
    attach.image = [UIImage imageNamed:objIcon.emojiImgName];
    NSMutableAttributedString * attributeString =[[NSMutableAttributedString alloc]initWithAttributedString:self.chatInputTextView.attributedText];;
    if (attach.image && attach.image.size.width > 1.0f) {
        attach.emoName = objIcon.emojiString;
        [attributeString insertAttributedString:[NSAttributedString attributedStringWithAttachment:attach] atIndex:_chatInputTextView.selectedRange.location];
        
        NSRange range;
        range.location = self.chatInputTextView.selectedRange.location;
        range.length = 1;
        
        NSParagraphStyle *paragraph = [NSParagraphStyle defaultParagraphStyle];
        
        [attributeString setAttributes:@{NSAttachmentAttributeName:attach, NSFontAttributeName:self.chatInputTextView.font,NSBaselineOffsetAttributeName:[NSNumber numberWithInt:0.0], NSParagraphStyleAttributeName:paragraph} range:range];
    }
    self.chatInputTextView.attributedText = attributeString;
    [self textViewChangeText];
}
- (void)chatEmojiViewTouchUpinsideSendButton{
    //表情键盘：点击发送表情
    [self sendMessage];
}
- (void)chatEmojiViewTouchUpinsideDeleteButton{
    //点击了删除表情
    NSRange range = self.chatInputTextView.selectedRange;
    NSInteger location = (NSInteger)range.location;
    if (location == 0) {
        return;
    }
    range.location = location-1;
    range.length = 1;
    
    NSMutableAttributedString *attStr = [self.chatInputTextView.attributedText mutableCopy];
    [attStr deleteCharactersInRange:range];
    self.chatInputTextView.attributedText = attStr;
    self.chatInputTextView.selectedRange = range;
    [self textViewChangeText];
}
@end
