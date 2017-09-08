//
//  JHUIAlertView.m
//  JHKit
//
//  Created by HaoCold on 2017/8/26.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import "JHUIAlertView.h"

@interface JHUIAlertView()
@property (strong,  nonatomic) JHUIAlertConfig      *config;
@end

@implementation JHUIAlertView

- (instancetype)initWithConfig:(JHUIAlertConfig *)config{
    return [self initWithFrame:CGRectZero config:config];
}

- (instancetype)initWithFrame:(CGRect)frame config:(JHUIAlertConfig *)config
{
    frame = [UIScreen mainScreen].bounds;
    self = [super initWithFrame:frame];
    if (self) {
        _config = config;
        [self jhSetupViews:frame];
    }
    return self;
}

- (void)jhSetupViews:(CGRect)frame
{
    //黑底
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.frame = frame;
    blackView.alpha = (_config.blackViewAlpha >=0 && _config.blackViewAlpha <=0.8)?_config.blackViewAlpha:0.5;
    [self addSubview:blackView];
    
    
    //
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 5;
    [self addSubview:contentView];
    
    CGFloat X,Y,W,H,titleH;
    CGRect sframe;
    
    //标题
    X = 0, Y = 0, W = CGRectGetWidth(frame) - 100, H = titleH = 40;
    
    if (_config.title.length > 0) {
        if (_config.titleFont) {
            H = titleH = _config.titleFont.pointSize * 2.5;
        }
        sframe = CGRectMake(X,Y,W,H);
        UILabel *label = [self xx_setup_label:sframe title:_config.title color:_config.titleColor font:_config.titleFont==nil?[UIFont systemFontOfSize:18]:_config.titleFont];
        label.numberOfLines = 1;
        [contentView addSubview:label];
        
        Y += H;
    }
    
    //内容
    if (_config.content.length > 0) {
        
        //分割线
        if (_config.title.length > 0) {
            X= 0,W = (CGRectGetWidth(frame) - 100),H=0.5;
            sframe = CGRectMake(X,Y,W,H);
            
            UIView *line1 = [[UIView alloc] init];
            line1.frame = sframe;
            line1.backgroundColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1];
            [contentView addSubview:line1];
        }
        
        if (_config.contentLeftMargin > 0) {
            X = _config.contentLeftMargin;
            W -= 2*X;
        }
        
        CGSize size = CGSizeMake(W, MAXFLOAT);
        UIFont *font = [UIFont systemFontOfSize:16];
        if (_config.contentFont) {
            font = _config.contentFont;
        }
        size = [_config.content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
        CGFloat height = size.height;
        H = height * 2;
        if (H < 60) {
            H = 60;
        }
        sframe = CGRectMake(X,Y,W,H);
        UILabel *label = [self xx_setup_label:sframe title:_config.content color:_config.contentColor font:_config.contentFont];
        
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:label.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:6];
        paragraphStyle.alignment = NSTextAlignmentCenter;//居中
        [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
        label.attributedText = attStr;

        [contentView addSubview:label];
        Y += H;
    }
    
    CGFloat buttonH = titleH;
    //按钮
    if (_config.buttons.count == 0) {
        [blackView addGestureRecognizer:({
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xx_tap)];
        })];
    }else if (_config.buttons.count == 2) {
        
        //分割线
        if (_config.title.length > 0 || _config.content.length > 0) {
            X= 0,W = (CGRectGetWidth(frame) - 100),H=0.5;
            sframe = CGRectMake(X,Y,W,H);
            
            UIView *line1 = [[UIView alloc] init];
            line1.frame = sframe;
            line1.backgroundColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1];
            [contentView addSubview:line1];
        }
        
        X = (CGRectGetWidth(frame) - 100)*0.5,W = 0.5,H = buttonH;
        sframe = CGRectMake(X,Y,W,H);
        
        UIView *line2 = [[UIView alloc] init];
        line2.frame = sframe;
        line2.backgroundColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1];
        [contentView addSubview:line2];
        
        //按钮
        X = 0, W = (CGRectGetWidth(frame) - 100)*0.5;
        
        for (int i = 0; i < _config.buttons.count; ++i) {
            sframe = CGRectMake(X,Y,W,H);
            JHUIAlertButtonConfig *btnConfig = _config.buttons[i];
            [self xx_setup_button:sframe title:btnConfig.title color:btnConfig.titleColor font:btnConfig.titleFont image:btnConfig.image superview:contentView tag:i];
            X += W;
        }
    }else{
        X= 0,W = (CGRectGetWidth(frame) - 100),H=buttonH;
        for (int i = 0; i < _config.buttons.count; ++i) {
            sframe = CGRectMake(X,Y,W,H);
            JHUIAlertButtonConfig *btnConfig = _config.buttons[i];
            [self xx_setup_button:sframe title:btnConfig.title color:btnConfig.titleColor font:btnConfig.titleFont image:btnConfig.image superview:contentView tag:i];
            
            //分割线
            if (i == 0 && _config.title.length == 0 && _config.content.length == 0){
                //no line
            }else{
                H = 0.5;
                sframe = CGRectMake(X,Y,W,H);
                
                UIView *line1 = [[UIView alloc] init];
                line1.frame = sframe;
                line1.backgroundColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1];
                [contentView addSubview:line1];
            }
            H = buttonH;
            Y += H;
        }
    }
    
    X = 50, W = CGRectGetWidth(frame) - 100;
    if (_config.buttons.count == 2) {
        H = Y + H;
    }else{
        H = Y;
    }
    contentView.frame = CGRectMake(X,Y,W,H);
    contentView.center = self.center;
    
}

- (UIButton *)xx_setup_button:(CGRect)frame
                        title:(NSString *)title
                        color:(UIColor *)color
                         font:(UIFont *)font
                        image:(UIImage *)image
                    superview:(UIView *)view
                          tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:1];
    if (image) {
        button = [UIButton buttonWithType:0];
    }
    button.tag = tag;
    button.frame = frame;
    button.titleLabel.font = font==nil?[UIFont systemFontOfSize:18]:font;
    [button setTitle:title==nil?[NSString stringWithFormat:@"按钮%@",@(tag)]:title forState:0];
    [button setTitleColor:color==nil?[UIColor blackColor]:color forState:0];
    [button setImage:image forState:0];
    [button addTarget:self action:@selector(xx_click:) forControlEvents:1<<6];
    [view addSubview:button];
    return button;
}

- (UILabel *)xx_setup_label:(CGRect)frame
                      title:(NSString *)title
                      color:(UIColor *)color
                       font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    label.textColor = color==nil?[UIColor blackColor]:color;
    label.font = font==nil?[UIFont systemFontOfSize:16]:font;
    label.textAlignment = 1;
    label.numberOfLines = 0;
    return label;
}

- (void)xx_click:(UIButton *)button
{
    JHUIAlertButtonConfig *btnConfig = _config.buttons[button.tag];
    if (btnConfig.block) {
        btnConfig.block();
    }
    
    [self removeFromSuperview];
}

- (void)xx_tap
{
    [self removeFromSuperview];
}

@end

@implementation JHUIAlertConfig
- (instancetype)init
{
    self = [super init];
    if (self) {
        _blackViewAlpha = 0.5;
        _contentLeftMargin = 20;
    }
    return self;
}
@end

@implementation JHUIAlertButtonConfig
+ (JHUIAlertButtonConfig *)configWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font image:(UIImage *)image handle:(dispatch_block_t)block{
    JHUIAlertButtonConfig *btnConfig = [[JHUIAlertButtonConfig alloc] init];
    btnConfig.title = title;
    btnConfig.titleColor = color;
    btnConfig.titleFont = font;
    btnConfig.image = image;
    btnConfig.block = block;
    return btnConfig;
}
@end
