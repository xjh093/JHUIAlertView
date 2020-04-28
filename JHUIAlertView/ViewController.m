//
//  ViewController.m
//  JHUIAlertView
//
//  Created by HaoCold on 2017/9/8.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import "ViewController.h"
#import "JHUIAlertView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,  strong) UITableView *tableView;
@property (nonatomic,  strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"JHUIAlertView";
    self.dataArray = @[@"标题",
                        @"内容",
                        @"按钮",
                        @"两个按钮",
                        @"三个按钮",
                        @"标题+按钮",
                        @"内容+按钮",
                        @"标题+内容+一个按钮",
                        @"标题+内容+两个按钮",
                        @"标题+内容+三个按钮",
                        @"标题+内容+四个按钮",
                        @"添加自定义视图",
                        @"内容限制高度"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark ---UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"resueID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textAlignment = 1;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self xx_event:indexPath.row];
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:0];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView = tableView;
    }
    return _tableView;
}

- (void)xx_event:(NSInteger)tag
{
    if (0 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title.text       = @"这是一个很长的提示";
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
        
    }else if (1 == tag) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.content.text     = @"这里是内容";
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
        config.title.text       = @"这是一个提示";
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (6 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.content.text          = @"您的余额不足，需充值之";
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click2");
        }];
        
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (7 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title.text            = @"这是一个提示";
        config.content.text          = @"您的余额不足，需充值之后才能继续观看";
        config.content.font      = [UIFont systemFontOfSize:15];
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }else if (8 == tag){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title.text            = @"这是一个提示";
        config.content.text          = @"您的余额不足，需充值之后才能继续观看";
        config.content.font      = [UIFont systemFontOfSize:15];
        
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
        config.title.text            = @"这是一个提示";
        config.content.text          = @"您的余额不足，需充值之后才能继续观看";
        config.content.font      = [UIFont systemFontOfSize:15];
        
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
        config.title.text            = @"这是一个提示";
        config.content.text          = @"您的余额不足，需充值之后才能继续观看，需充值之后才能继续观看，需充值之后才能继续观看，需充值之后才能继续观看";
        
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
    }else if (tag == 11){
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        
#if 1
        config.title.text       = @"添加自定义视图";
        config.title.bottomPadding = 100; // set bottomPadding to keep enough height
        config.dismissWhenTapOut   = NO;
        
#else
        // when you want a fully custom view, you should use 'contentViewHeight'
        config.contentViewHeight = 300;
#endif
        
        JHUIAlertView *alertView = [[JHUIAlertView alloc] initWithConfig:config];
        
        [alertView addCustomView:^(JHUIAlertView *alertView, CGRect contentViewRect, CGRect titleLabelRect, CGRect contentLabelRect) {
            
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(10, CGRectGetMaxY(titleLabelRect)+10, contentViewRect.size.width-20, 20);
            label.text = @"这是一个自定义的标签";
            label.textColor = [UIColor blackColor];
            label.backgroundColor = [UIColor lightGrayColor];
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            
            [alertView.contentView addSubview:label];
            
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(10, CGRectGetMaxY(label.frame)+10, contentViewRect.size.width-20, 40);
            button.backgroundColor = [UIColor lightGrayColor];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            [button setTitle:@"button" forState:0];
            [button addTarget:self action:@selector(buttonEvent:) forControlEvents:1<<6];
            [alertView.contentView addSubview:button];
            
        }];
        
        [self.view addSubview:alertView];
    }else if (tag == 12) {
        JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
        config.title.text = @"生命游戏";
        config.content.maxHeight = [UIScreen mainScreen].bounds.size.width - 80;
        config.content.text = @"生命游戏(Game of Life)没有游戏玩家各方之间的竞争，也谈不上输赢，可以把它归类为仿真游戏。事实上，也是因为它模拟和显示的图像看起来颇似生命的出生和繁衍过程而得名为“生命游戏”。在游戏进行中，杂乱无序的细胞会逐渐演化出各种精致、有形的结构；这些结构往往有很好的对称性，而且每一代都在变化形状。一些形状一经锁定就不会逐代变化。有时，一些已经成形的结构会因为一些无序细胞的“入侵”而被破坏。但是形状和秩序经常能从杂乱中产生出来。";
        
        JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:@"确定" color:nil font:nil image:nil handle:^{
            NSLog(@"click1");
        }];
        config.buttons = @[btnconfig1];
        JHUIAlertView *alert = [[JHUIAlertView alloc] initWithConfig:config];
        [self.view addSubview:alert];
    }
}

- (void)buttonEvent:(UIButton *)button
{
    UIView *view = button.superview;
    while (view) {
        if ([view isKindOfClass: [JHUIAlertView class]]) {
            [view removeFromSuperview];
            break;
        }
        view = view.superview;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
