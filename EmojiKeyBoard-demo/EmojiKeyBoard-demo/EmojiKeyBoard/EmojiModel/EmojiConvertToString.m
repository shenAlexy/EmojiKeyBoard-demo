//
//  EmojiConvertToString.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "EmojiConvertToString.h"
#import "ChatEmojiIcons.h"

@implementation EmojiConvertToString

+ (NSString *)convertToCommonEmoticons:(NSString *)text{
    //表情数量
    NSInteger emojiCount=[ChatEmojiIcons getEmojiPopCount];
    NSMutableString *retText = [[NSMutableString alloc] initWithString:text];
    
    for(NSInteger i=1; i<=emojiCount; i++) {
        NSRange range;
        range.location = 0;
        range.length = retText.length;
        [retText replaceOccurrencesOfString:[NSString stringWithFormat:@",face.bundle/%@.png",@(i)]
                                 withString:[NSString stringWithFormat:@"[em_%@]",@(i)]
                                    options:NSLiteralSearch
                                      range:range];
        
    }
    
    return retText;
}

@end
