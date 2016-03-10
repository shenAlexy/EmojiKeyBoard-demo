//
//  ChatKeyBoardAnimationView.m
//  joinup_iphone
//
//  Created by shen_gh on 15/7/29.
//  copyRight (c) 2015年 com.joinup(Beijing). All rights reserved.
//

#import "ChatKeyBoardAnimationView.h"

@implementation ChatKeyBoardAnimationView

-(void)addSubview:(UIView *)view{
    
    CGRect frameS = self.frame;
    frameS.size.height = CGRectGetHeight(view.frame);
    self.frame = frameS;
    
    for (UIView * v in self.subviews) {
        [v removeFromSuperview];
    }
    
    [super addSubview:view];
    
    CGRect frame = view.frame;
    frame.origin.y = CGRectGetHeight(self.frame);
    view.frame = frame;
    frame.origin.y = 0;
    [UIView animateWithDuration:DURTAION animations:^{
        view.frame = frame;
    }];
}

@end
