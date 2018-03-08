//
//  ViewController.m
//  JHUIAlertView
//
//  Created by HaoCold on 2017/9/8.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import "ViewController.h"
#import "JHUIAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"JHUIAlertView";
    
    [self jhSetupViews];
    
}

- (void)jhSetupViews
{
    NSArray *titles = @[@"标题",
                        @"内容",
                        @"按钮",
                        @"两个按钮",
                        @"三个按钮",
                        @"标题+按钮",
                        @"内容+按钮",
                        @"标题+内容+一个按钮",
                        @"标题+内容+两个按钮",
                        @"标题+内容+三个按钮",
                        @"标题+内容+四个按钮"];
    CGFloat W = self.view.frame.size.width;
    for (int i = 0; i < titles.count; ++i) {
        
        UIButton *button = [UIButton buttonWithType:0];
        button.frame = CGRectMake(10, 70+45*i, W-20, 40);
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitle:titles[i] forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        [button addTarget:self action:@selector(xx_event:) forControlEvents:1<<6];
        button.tag = i;
        [self.view addSubview:button];
    }
}

- (void)xx_event:(UIButton *)button
{
    NSInteger tag = button.tag;
    if (0 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title            = @"这是一个很长的提示";
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
        
    }else if (1 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.content          = @"这里是内容";
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (2 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (3 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"取消" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        JHUIAlertButtonConfig *btnconfig2 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        config.buttons = @[btnconfig1,btnconfig2];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (4 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"取消" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        JHUIAlertButtonConfig *btnconfig2 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        JHUIAlertButtonConfig *btnconfig3 = [JHUIAlertButtonConfig configWithTitle:@"看看" color:nil font:nil image:nil handle:^{
            NSLog(@"click3");
        }];
        
        config.buttons = @[btnconfig1,btnconfig2,btnconfig3];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (5 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title            = @"这是一个提示";
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (6 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.content          = @"您的余额不足，需充值之";
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (7 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title            = @"这是一个提示";
        config.content          = @"您的余额不足，需充值之后才能继续观看";
        config.contentFont      = [UIFont systemFontOfSize:15];
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (8 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title            = @"这是一个提示";
        config.content          = @"您的余额不足，需充值之后才能继续观看";
        config.contentFont      = [UIFont systemFontOfSize:15];
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"取消" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        JHUIAlertButtonConfig *btnconfig2 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        config.buttons = @[btnconfig1,btnconfig2];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (9 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title            = @"这是一个提示";
        config.content          = @"您的余额不足，需充值之后才能继续观看";
        config.contentFont      = [UIFont systemFontOfSize:15];
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"取消" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        JHUIAlertButtonConfig *btnconfig2 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        JHUIAlertButtonConfig *btnconfig3 = [JHUIAlertButtonConfig configWithTitle:@"看看" color:nil font:nil image:nil handle:^{
            NSLog(@"click3");
        }];
        
        config.buttons = @[btnconfig1,btnconfig2,btnconfig3];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (10 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title            = @"这是一个提示";
        config.content          = @"您的余额不足，需充值之后才能继续观看";
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"取消" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        JHUIAlertButtonConfig *btnconfig2 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        JHUIAlertButtonConfig *btnconfig3 = [JHUIAlertButtonConfig configWithTitle:@"看看" color:nil font:nil image:nil handle:^{
            NSLog(@"click3");
        }];
        
        JHUIAlertButtonConfig *btnconfig4 = [JHUIAlertButtonConfig configWithTitle:@"等等" color:nil font:nil image:nil handle:^{
            NSLog(@"click4");
        }];
        
        config.buttons = @[btnconfig1,btnconfig2,btnconfig3,btnconfig4];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end