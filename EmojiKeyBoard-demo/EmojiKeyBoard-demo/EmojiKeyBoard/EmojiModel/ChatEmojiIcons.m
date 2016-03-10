//
//  ChatEmojiIcons.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "ChatEmojiIcons.h"

@implementation ChatEmojiIcons

//获取表情包
+ (NSArray *)emojis {
    static NSArray *_emojis;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获取表情plist
        NSString *emojiFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Emoji.plist"];
        NSDictionary *emojiDic = [[NSDictionary alloc] initWithContentsOfFile:emojiFilePath];
        
        NSMutableArray *array=[NSMutableArray array];
        for (NSInteger i=1; i<76; i++) {
            [array addObject:[emojiDic valueForKey:[NSString stringWithFormat:@"[em_%@]",@(i)]]];
        }
        _emojis = array;
    });
    return _emojis;
}

+(NSInteger)getEmojiPopCount{
    return [[self class] emojis].count;
}

+ (NSString *)getEmojiNameByTag:(NSInteger)tag {
    NSArray *emojis = [[self class] emojis];
    return emojis[tag];
}

+(NSString *)getEmojiPopIMGNameByTag:(NSInteger)tag{
    NSString * name = [[self class]getEmojiNameByTag:tag];
    return [[self class]imgNameWithName:name];
}

+ (NSString *)getEmojiPopNameByTag:(NSInteger)tag {
    NSString *key = [NSString stringWithFormat:@"%@", [self getEmojiNameByTag:tag]];
    return NSLocalizedString(key, @"");
}

+(NSString *)imgNameWithName:(NSString*)name{
    return [NSString stringWithFormat:@"%@",name];
}

@end
