//
//  JHUIAlertView.m
//  JHKit
//
//  Created by HaoCold on 2017/8/26.
//  Copyright © 2017年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHUIAlertView.h"

@interface JHUIAlertView()

@property (strong,  nonatomic) JHUIAlertConfig      *config;

@end

@implementation JHUIAlertView

+ (void)jh_show_title:(NSString *)title
              message:(NSString *)message
               inView:(UIView *)view{
    JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
    config.title.text       = title;
    config.content.text     = message;
    JHUIAlertView *alert    = [[JHUIAlertView alloc] initWithConfig:config];
    [view addSubview:alert];
}

+ (void)jh_show_title:(NSString *)title
              message:(NSString *)message
               inView:(UIView *)view
          buttonTitle:(NSString *)buttonTitle
             andBlock:(dispatch_block_t)block{
    JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
    config.title.text       = title;
    config.content.text     = message;
    JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:buttonTitle color:nil font:nil image:nil handle:^{
        if (block) {
            block();
        }
    }];
    config.buttons = @[btnconfig1];
    JHUIAlertView *alert    = [[JHUIAlertView alloc] initWithConfig:config];
    [view addSubview:alert];
}

+ (void)jh_show_title:(NSString *)title
              message:(NSString *)message
               inView:(UIView *)view
          buttonTitle:(NSString *)buttonTitle
             andBlock:(dispatch_block_t)block
         buttonTitle2:(NSString *)buttonTitle2
            andBlock2:(dispatch_block_t)block2{
    JHUIAlertConfig *config = [[JHUIAlertConfig alloc] init];
    config.title.text       = title;
    config.content.text     = message;
    JHUIAlertButtonConfig *btnconfig1 = [JHUIAlertButtonConfig configWithTitle:buttonTitle color:nil font:nil image:nil handle:^{
        if (block) {
            block();
        }
    }];
    JHUIAlertButtonConfig *btnconfig2 = [JHUIAlertButtonConfig configWithTitle:buttonTitle2 color:nil font:nil image:nil handle:^{
        if (block2) {
            block2();
        }
    }];
    config.buttons = @[btnconfig1,btnconfig2];
    JHUIAlertView *alert    = [[JHUIAlertView alloc] initWithConfig:config];
    [view addSubview:alert];
}

- (instancetype)initWithConfig:(JHUIAlertConfig *)config{
    return [self initWithFrame:CGRectZero config:config];
}

- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:CGRectZero config:[[JHUIAlertConfig alloc] init]];
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
    
    if (_config.blackViewAlpha < 0 || _config.blackViewAlpha >0.8) {
        _config.blackViewAlpha = 0.5;
    }
    if (_config.contentViewWidth <= 0 ||
        _config.contentViewWidth > [UIScreen mainScreen].bounds.size.width) {
        _config.contentViewWidth = [UIScreen mainScreen].bounds.size.width - 100;
    }
    if (_config.contentViewCornerRadius < 0) {
        _config.contentViewCornerRadius = 10;
    }
    if (_config.buttonHeight < 0) {
        _config.buttonHeight = 40;
    }
    
    // 黑底
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.frame = frame;
    blackView.alpha = _config.blackViewAlpha;
    [self addSubview:blackView];
    
    //
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = _config.contentViewCornerRadius;
    [self addSubview:contentView];
    _contentView = contentView;
    
    CGFloat X = 0, Y = 0, W = 0, H = 0;
    CGRect sframe;
    
    // 标题
    if (_config.title.text.length > 0) {
        
        X = _config.title.leftPadding;
        Y = _config.title.topPadding;
        W = _config.contentViewWidth - X - _config.title.rightPadding;
        
        UILabel *titleLable = [self xx_setup_attributed_label:_config.title.text
                                                         font:_config.title.font
                                                        width:W
                                                    lineSpace:_config.title.lineSpace];
        sframe = titleLable.frame;
        sframe.origin.x = X;
        sframe.origin.y = Y;
        titleLable.frame = sframe;
    
        if (_config.title.autoHeight) {
            titleLable.numberOfLines = 0;
        }
        
        [contentView addSubview:titleLable];
        _titleLabel = titleLable;
        
        Y = CGRectGetMaxY(titleLable.frame) + _config.title.bottomPadding;
    }
    
    // 内容
    if (_config.content.text.length > 0) {
        
        //分割线
        if (_config.title.text.length > 0 && _config.titleBottomLineHidden == NO) {
            X = 0, W = _config.contentViewWidth, H = 0.5;
            sframe = CGRectMake(X,Y,W,H);
            
            UIView *line = [self xx_setup_line:sframe];
            [contentView addSubview:line];
            _titleBottomLine = line;
        }
        
        X = _config.content.leftPadding;
        Y = Y + _config.content.topPadding;
        W = _config.contentViewWidth - X - _config.content.rightPadding;
        
        UILabel *contentLabel = [self xx_setup_attributed_label:_config.content.text
                                                           font:_config.content.font
                                                          width:W
                                                      lineSpace:_config.content.lineSpace];
        sframe = contentLabel.frame;
        sframe.origin.x = X;
        sframe.origin.y = Y;
        contentLabel.frame = sframe;
        
        if (_config.content.autoHeight) {
            contentLabel.numberOfLines = 0;
        }
        
        [contentView addSubview:contentLabel];
        _contentLabel = contentLabel;
        
        Y = CGRectGetMaxY(contentLabel.frame) + _config.content.bottomPadding;

    }
    
    CGFloat buttonH = _config.buttonHeight;
    //按钮
    if (_config.buttons.count == 2) {
        
        // 分割线 横
        if (_config.title.text.length > 0 || _config.content.text.length > 0) {
            X= 0, W = _config.contentViewWidth, H = 0.5;
            sframe = CGRectMake(X,Y,W,H);
            
            UIView *line = [self xx_setup_line:sframe];
            [contentView addSubview:line];
        }
        
        // 分割线 竖
        X = _config.contentViewWidth*0.5, W = 0.5, H = buttonH;
        sframe = CGRectMake(X,Y,W,H);
        UIView *line = [self xx_setup_line:sframe];
        [contentView addSubview:line];
        
        //按钮
        X = 0, W = _config.contentViewWidth*0.5;
        
        for (int i = 0; i < _config.buttons.count; ++i) {
            sframe = CGRectMake(X,Y,W,H);
            JHUIAlertButtonConfig *btnConfig = _config.buttons[i];
            [self xx_setup_button:sframe title:btnConfig.title color:btnConfig.color font:btnConfig.font image:btnConfig.image superview:contentView tag:i];
            X += W;
        }
    }else{
        X= 0, W = (CGRectGetWidth(frame) - 100), H = buttonH;
        for (int i = 0; i < _config.buttons.count; ++i) {
            sframe = CGRectMake(X,Y,W,H);
            JHUIAlertButtonConfig *btnConfig = _config.buttons[i];
            UIButton *button = [self xx_setup_button:sframe title:btnConfig.title color:btnConfig.color font:btnConfig.font image:btnConfig.image superview:contentView tag:i];
            
            // space
            if (btnConfig.imageTitleSpace > 0) {
                [button setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,btnConfig.imageTitleSpace)];
                [button setTitleEdgeInsets:UIEdgeInsetsMake(0,btnConfig.imageTitleSpace,0,0)];
            }
            
            //分割线
            if (i == 0 && _config.title.text.length == 0 && _config.content.text.length == 0){
                //no line
            }else{
                H = 0.5;
                sframe = CGRectMake(X,Y,W,H);
                UIView *line = [self xx_setup_line:sframe];
                [contentView addSubview:line];
            }
            H = buttonH;
            Y += H;
        }
    }
    
    if (_config.dismissWhenTapOut) {
        [blackView addGestureRecognizer:({
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xx_tap)];
        })];
    }
    
    X = 50, W = _config.contentViewWidth;
    if (_config.buttons.count == 2) {
        H = Y + H;
    }else{
        H = Y;
    }
    
    if (H <= 0) {
        H = _config.contentViewHeight;
    }
    
    contentView.frame = CGRectMake(X,Y,W,H);
    contentView.center = self.center;
    
}

- (UILabel *)xx_setup_attributed_label:(NSString *)text
                                  font:(UIFont *)font
                                 width:(CGFloat)width
                             lineSpace:(CGFloat)lineSpace
{
    // set line space
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    paragraphStyle.alignment = NSTextAlignmentCenter; // 居中
    if ([text containsString:@"\n"]) {
        paragraphStyle.alignment = NSTextAlignmentLeft; // 居左
    }
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    // calculate size
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSDictionary *dic = @{NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paragraphStyle};
    size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    // label
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, width, size.height);
    label.font = font;
    label.attributedText = attStr;
    return label;
}

- (UIView *)xx_setup_line:(CGRect)frame{
    UIView *line = [[UIView alloc] init];
    line.frame = frame;
    line.backgroundColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1];
    return line;
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

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    if (newSuperview && _config.showAnimation) {
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
        self.alpha = 0;
        [UIView animateWithDuration:_config.showAnimationDuration animations:^{
            self.transform = CGAffineTransformIdentity;
            self.alpha = 1;
        }];
    }
}

- (void)addCustomView:(JHUIAlertViewAddCustomViewBlock)block{
    if (block) {
        block(self,_contentView.frame,_titleLabel.frame,_contentLabel.frame);
    }
}

@end



@implementation JHUIAlertConfig

- (instancetype)init{
    self = [super init];
    if (self) {
        
        _title = [[JHUIAlertTextConfig alloc] init];
        _title.text = @"";
        _title.topPadding = 10;
        _title.leftPadding = 10;
        _title.bottomPadding = 10;
        _title.rightPadding = 10;
        _title.autoHeight = YES;
        
        _content = [[JHUIAlertTextConfig alloc] init];
        _content.text = @"";
        _content.font = [UIFont systemFontOfSize:16];
        _content.topPadding = 15;
        _content.leftPadding = 20;
        _content.bottomPadding = 15;
        _content.rightPadding = 20;
        _content.autoHeight = YES;
        _content.lineSpace = 4;
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        
        _titleBottomLineHidden = NO;
        _blackViewAlpha = 0.5;
        _showAnimation = YES;
        _showAnimationDuration = 0.25;
        _contentViewWidth = size.width - 100;
        _contentViewCornerRadius = 10;
        _dismissWhenTapOut = YES;
        _buttonHeight = 40;
    }
    return self;
}

@end

@implementation JHUIAlertTextConfig

- (instancetype)init{
    self = [super init];
    if (self) {
        _color = [UIColor blackColor];
        _font = [UIFont systemFontOfSize:18];
    }
    return self;
}

@end

@implementation JHUIAlertButtonConfig

+ (JHUIAlertButtonConfig *)configWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font image:(UIImage *)image handle:(dispatch_block_t)block{
    JHUIAlertButtonConfig *btnConfig = [[JHUIAlertButtonConfig alloc] init];
    btnConfig.title = title;
    btnConfig.color = color;
    btnConfig.font = font;
    btnConfig.image = image;
    btnConfig.block = block;
    return btnConfig;
}

@end
