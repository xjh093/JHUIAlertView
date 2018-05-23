# JHUIAlertView

.h

```
#import <UIKit/UIKit.h>

@class JHUIAlertConfig,JHUIAlertButtonConfig;

@interface JHUIAlertView : UIView

- (instancetype)initWithConfig:(JHUIAlertConfig *)config;

@end

@interface JHUIAlertConfig : NSObject
///标题
@property (copy,    nonatomic) NSString         *title;
///标题颜色
@property (strong,  nonatomic) UIColor          *titleColor;
///标题字体,默认18
@property (strong,  nonatomic) UIFont           *titleFont;
///隐藏标题下面的分隔线, default is NO.
@property (assign,  nonatomic) BOOL              titleBottomLineHidden;
///内容
@property (copy,    nonatomic) NSString         *content;
///内容颜色
@property (strong,  nonatomic) UIColor          *contentColor;
///内容字体,默认16
@property (strong,  nonatomic) UIFont           *contentFont;
///内容左边距
@property (assign,  nonatomic) CGFloat           contentLeftMargin;
///按钮
@property (strong,  nonatomic) NSArray<JHUIAlertButtonConfig *> *buttons;
///黑底透明度，0~0.8
@property (assign,  nonatomic) CGFloat           blackViewAlpha;
///弹出动画, 默认是 YES
@property (nonatomic,  assign) BOOL              showAnimated;
///弹出动画, 默认是 0.25
@property (nonatomic,  assign) CGFloat           showAnimateDuration;
@end

@interface JHUIAlertButtonConfig : NSObject
///标题
@property (copy,    nonatomic) NSString         *title;
///标题颜色
@property (strong,  nonatomic) UIColor          *titleColor;
///标题字体,默认18
@property (strong,  nonatomic) UIFont           *titleFont;
///图片
@property (strong,  nonatomic) UIImage          *image;
///回调
@property (copy,    nonatomic) dispatch_block_t  block;

+ (JHUIAlertButtonConfig *)configWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font image:(UIImage *)image handle:(dispatch_block_t)block;
@end
```


使用：& use
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
