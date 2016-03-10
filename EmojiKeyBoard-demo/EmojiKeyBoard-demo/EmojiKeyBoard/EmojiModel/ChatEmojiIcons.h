//
//  ChatEmojiIcons.h
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatEmojiIcons : NSObject

//获取表情集
+ (NSArray *)emojis;

//获取表情数量
+(NSInteger)getEmojiPopCount;

//根据表情tag获取表情图片
+(NSString *)getEmojiNameByTag:(NSInteger)tag;

+(NSString *)getEmojiPopNameByTag:(NSInteger)tag;

+(NSString *)getEmojiPopIMGNameByTag:(NSInteger)tag;

@end
