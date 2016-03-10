//
//  Define.h
//  EmojiKeyBoard-demo
//
//  Created by shen_gh on 16/3/10.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#ifndef Define_h
#define Define_h

#pragma mark 获取当前屏幕的宽度、高度
//宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#pragma mark 导航条的高度
//导航条高度
#define kNavBarHeight 64.0
//标签栏的高度
#define kTabBarHeight 49.0
//导航条title的font
#define kNavTitleFont UIFont_size(18.0)
//标签栏item的font
#define kTabBarItemFont UIFont_size(11.0)
//选项卡的高度
#define tabsHeight 45.0
//预定义圆角数
#define kAppMainCornerRadius 4.0


#pragma mark 字体相关
//字体
#define UIFont_size(size) [UIFont systemFontOfSize:size]
#define UIFont_bold_Size(size) [UIFont boldSystemFontOfSize:size]


#pragma mark - Dev
//Log
#ifdef DEBUG
#define DLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(xx, ...)  ((void)0)
#endif


#pragma mark 颜色相关
//颜色
#define UICOLOR_FROM_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kAppBlackColor [UIColor blackColor]         //黑色
#define kAppGrayColor [UIColor grayColor]           //灰色
#define kAppDarkGrayColor [UIColor darkGrayColor]   //深灰色
#define kAppLightGrayColor [UIColor lightGrayColor] //浅灰色
#define kAppWhiteColor [UIColor whiteColor]         //白色
#define kAppRedColor [UIColor redColor]             //红色
#define kAppOrangeColor [UIColor orangeColor]       //橙色
#define kAppClearColor [UIColor clearColor]         //透明色
#define kAppDarkTextColor [UIColor darkTextColor]
#define kAppLightTextColor [UIColor lightTextColor]
#define kAppLineColor UICOLOR_FROM_RGB(229,229,229,1)//细线的颜色
#define kAppMainBgColor UICOLOR_FROM_RGB(240,240,240,1)

//本软件主色调
#define kAppMainBrownColor UICOLOR_FROM_RGB(53,48,43,1)
#define kAppMainLightBrownColor UICOLOR_FROM_RGB(118,108,96,1)
#define kAppMainOrangeColor UICOLOR_FROM_RGB(252,142,6,1)
#define kAppMainDarkGrayColor UICOLOR_FROM_RGB(105,105,105,1)

#endif /* Define_h */
