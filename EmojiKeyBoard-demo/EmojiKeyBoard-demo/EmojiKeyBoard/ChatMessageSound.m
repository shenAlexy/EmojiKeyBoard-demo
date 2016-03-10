//
//  ChatMessageSound.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/5.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "ChatMessageSound.h"

@interface ChatMessageSound()

//播放声音
+ (void)playSoundWithName:(NSString *)name type:(NSString *)type from:(NSString *)from;
@end

@implementation ChatMessageSound

//播放声音
+ (void)playSoundWithName:(NSString *)name type:(NSString *)type from:(NSString *)from{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        SystemSoundID sound;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &sound);
        AudioServicesPlaySystemSound(sound);
//        //振动
//        if ([from isEqualToString:@"received"]) {
//            
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//        }
    }
    else {
        DLog(@"Error: audio file not found at path: %@", path);
    }
}

//收到消息的声音
+ (void)playMessageReceivedSound{
    [ChatMessageSound playSoundWithName:@"receivedSuccess" type:@"caf" from:@"received"];
}

//发送消息的声音
+ (void)playMessageSendSound{
    [ChatMessageSound playSoundWithName:@"sendSuccess" type:@"caf" from:@"send"];
}

@end
