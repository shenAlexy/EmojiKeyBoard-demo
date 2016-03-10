//
//  CommentEmoji.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "CommentEmoji.h"

@implementation CommentEmoji

+(NSArray*)emojiObjsWithPage:(NSInteger)page{
    if (page>[[self class]pageCountIsSupport]) {
        return @[];
    }
    NSMutableArray * array_common_s = [NSMutableArray array];
    NSInteger count_line = [[self class]countInOneLine];
    NSInteger start_count = (count_line*EmojiIMG_Lines-1)*page;
    NSInteger end_count = MIN([ChatEmojiIcons getEmojiPopCount], start_count+(count_line*EmojiIMG_Lines-1));
    for (int tag = (int)start_count;tag < end_count; tag++) {
        CommentEmoji * obj = [CommentEmoji new];
        obj.emojiImgName = [NSString stringWithFormat:@"face.bundle/%@",[ChatEmojiIcons getEmojiPopIMGNameByTag:tag]];
        obj.emojiName = [NSString stringWithFormat:@"face.bundle/%@",[ChatEmojiIcons getEmojiPopNameByTag:tag]];
        obj.emojiString = [NSString stringWithFormat:@"face.bundle/%@",[ChatEmojiIcons getEmojiNameByTag:tag]];
        [array_common_s addObject:obj];
    }
    [array_common_s addObject:[[self class] del_Obj]];
    return array_common_s;
}

+(NSInteger)pageCountIsSupport{
    NSInteger count_all = [ChatEmojiIcons getEmojiPopCount];
    NSInteger page_one = [[self class]onePageCount];
    return  (count_all/page_one)+((int)((count_all%page_one)!=0));
}


@end
