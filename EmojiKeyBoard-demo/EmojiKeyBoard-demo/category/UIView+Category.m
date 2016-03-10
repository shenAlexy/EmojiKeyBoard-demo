//
//  UIView+Category.m
//  joinup_iphone
//
//  Created by shen_gh on 15/4/23.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat)current_x{
    return self.frame.origin.x;
}
- (CGFloat)current_y{
    return self.frame.origin.y;
}
- (CGFloat)current_w{
    return self.frame.size.width;
}
- (CGFloat)current_h{
    return self.frame.size.height;
}
- (CGFloat)current_x_w{
    return self.frame.origin.x+self.frame.size.width;
}
- (CGFloat)current_y_h{
    return self.frame.origin.y+self.frame.size.height;
}

//画线
+ (UIView *)lineWithColor:(UIColor *)color frame:(CGRect)frame{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    [view setBackgroundColor:color];
    return view;
}

@end
