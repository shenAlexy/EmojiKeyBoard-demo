//
//  UIView+Category.h
//  joinup_iphone
//
//  Created by shen_gh on 15/4/23.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

//宽度
- (CGFloat)current_w;

//高度
- (CGFloat)current_h;

//当前view.frame的x、y、x+宽、y+高
- (CGFloat)current_x;
- (CGFloat)current_y;
- (CGFloat)current_x_w;
- (CGFloat)current_y_h;

//细线
+ (UIView *)lineWithColor:(UIColor *)color frame:(CGRect)frame;

@end
