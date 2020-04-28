# JHUIAlertView
a custom alert view which can add your custom view.
- 自定义的alert,可添加自定义视图

---

# Version
Latest release version:
- [1.2.1](https://github.com/xjh093/JHUIAlertView/releases)

---

# Cocoapods
`pod "JHUIAlertView"`

---

# What
![image](https://github.com/xjh093/JHUIAlertView/blob/master/Screen%20Shot%202017-09-15%20at%2011.16.20.png)

---

# Usage
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

---

# More detail in Demo :)

---
