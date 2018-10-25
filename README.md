# JHUIAlertView
a custom alert view


# Example:
```
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
```

```
like this:
```
![image](https://github.com/xjh093/JHUIAlertView/blob/master/Screen%20Shot%202017-09-15%20at%2011.16.20.png)
