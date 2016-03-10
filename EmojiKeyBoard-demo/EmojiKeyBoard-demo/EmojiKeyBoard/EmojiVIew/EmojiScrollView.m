//
//  EmojiScrollView.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "EmojiScrollView.h"

@implementation EmojiScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
    }
    
    return self;
}


@end
