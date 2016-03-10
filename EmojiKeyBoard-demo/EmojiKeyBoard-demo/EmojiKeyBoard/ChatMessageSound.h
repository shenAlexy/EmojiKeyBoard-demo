//
//  ChatMessageSound.h
//  joinup_iphone
//
//  Created by shen_gh on 15/8/5.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ChatMessageSound : NSObject

//收到消息的声音
+ (void)playMessageReceivedSound;

//发送消息的声音
+ (void)playMessageSendSound;

@end
