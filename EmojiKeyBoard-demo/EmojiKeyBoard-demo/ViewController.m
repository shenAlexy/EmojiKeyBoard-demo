//
//  ViewController.m
//  EmojiKeyBoard-demo
//
//  Created by shen_gh on 16/3/9.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#import "ViewController.h"
#import "ChatKeyBoardView.h"//聊天框

@interface ViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) ChatKeyBoardView *chatKeyBoardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //聊天键盘置于tableView之上
    [self.view insertSubview:self.tableView belowSubview:self.chatKeyBoardView];
    
    [self gesture];
}

//聊天框
- (ChatKeyBoardView *)chatKeyBoardView{
    if (!_chatKeyBoardView) {
        _chatKeyBoardView=[[ChatKeyBoardView alloc]initWithDelegate:self superView:self.view];
    }
    return _chatKeyBoardView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:[self tableViewFrame] style:UITableViewStylePlain];
        [_tableView setBackgroundView:self.bgImageView];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableView;
}
- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, _tableView.bounds.size.width, _tableView.bounds.size.height)];
        [_bgImageView setImage:[UIImage imageNamed:@"bgImage.jpg"]];
        [_bgImageView setContentMode:UIViewContentModeScaleToFill];
    }
    return _bgImageView;
}

//tableView的frame随着聊天框的frame变化:如弹出键盘时
-(CGRect)tableViewFrame{
    CGRect frame = CGRectMake(0, 0, self.view.current_w, self.view.current_h);
    frame.size.height = self.chatKeyBoardView.frame.origin.y;
    return frame;
}

#pragma mark gesture
- (void)gesture{
    //点击手势
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesture];
}

#pragma mark - self action
- (void)tapAction:(UITapGestureRecognizer *)tapGesture{
    [self.chatKeyBoardView tapAction];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
