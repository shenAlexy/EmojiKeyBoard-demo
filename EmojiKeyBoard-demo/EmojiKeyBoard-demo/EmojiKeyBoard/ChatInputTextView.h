//
//  ChatInputTextView.h
//  joinup_iphone
//
//  Created by shen_gh on 15/7/29.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

/**
 *  聊天的输入框
 */
#import <UIKit/UIKit.h>
#import "EmojiTextAttachment.h"

@interface ChatInputTextView : UITextView<NSTextStorageDelegate>

@property (nonatomic, copy)NSString * plainText;

+ (CGRect)getJamTextSize:(CGSize)constrainedSize attributeString:(NSAttributedString *)attributeString;

+ (NSAttributedString *)getAttributedText:(NSString *)source font:(UIFont *)font color:(UIColor*)color jamScale:(float)jamScale bottom:(float)bottom;

@end
