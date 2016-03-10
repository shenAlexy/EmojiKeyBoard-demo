//
//  EmojiObj.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "EmojiObj.h"

@implementation EmojiObj

/*子类中实现*/
+(NSArray *)emojiObjsWithPage:(NSInteger)page{return @[];}

+(NSInteger)pageCountIsSupport{return 0;}

/*子类不需要实现*/
+(NSInteger)countInOneLine{
    return  (kScreenWidth+EmojiIMG_Space-2*EmojiView_Border)/(EmojiIMG_Width_Hight+EmojiIMG_Space);
}

+(NSInteger)onePageCount{
    NSInteger count_line = [[self class]countInOneLine];
    return count_line*EmojiIMG_Lines-1;
}

+(EmojiObj *)del_Obj{
    EmojiObj * del_obj = [EmojiObj new];
    del_obj.emojiImgName = [NSString stringWithFormat:@"face.bundle/%@",@"compose_emotion_delete"];
    return del_obj;
}


@end
