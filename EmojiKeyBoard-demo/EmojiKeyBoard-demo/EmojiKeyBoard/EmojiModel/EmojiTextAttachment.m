//
//  EmojiTextAttachment.m
//  joinup_iphone
//
//  Created by shen_gh on 15/8/4.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "EmojiTextAttachment.h"

@implementation EmojiTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex{
    
    return CGRectMake(0, self.Top, lineFrag.size.height*self.Scale, lineFrag.size.height*self.Scale);
}

-(instancetype)initWithData:(NSData *)contentData ofType:(NSString *)uti{
    self = [super initWithData:contentData ofType:uti];
    if (self) {
        self.Scale = 1.0f;
        self.Top = 0.0f;
        if (self.image == nil) {
            self.image = [UIImage imageWithData:contentData];
        }
    }
    return self;
}

@end
