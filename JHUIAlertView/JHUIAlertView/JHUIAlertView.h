//
//  JHUIAlertView.h
//  JHKit
//
//  Created by HaoCold on 2017/8/26.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHUIAlertConfig,JHUIAlertButtonConfig;

@interface JHUIAlertView : UIView

+ (void)jh_show_title:(NSString *)title
              message:(NSString *)message
               inView:(UIView *)view;

+ (void)jh_show_title:(NSString *)title
              message:(NSString *)message
               inView:(UIView *)view
          buttonTitle:(NSString *)buttonTitle
             andBlock:(dispatch_block_t)block;

+ (void)jh_show_title:(NSString *)title
              message:(NSString *)message
               inView:(UIView *)view
          buttonTitle:(NSString *)buttonTitle
             andBlock:(dispatch_block_t)block
         buttonTitle2:(NSString *)buttonTitle2
            andBlock2:(dispatch_block_t)block2;

- (instancetype)initWithConfig:(JHUIAlertConfig *)config;

@end

@interface JHUIAlertConfig : NSObject
///标题
@property (copy,    nonatomic) NSString         *title;
///标题颜色
@property (strong,  nonatomic) UIColor          *titleColor;
///标题字体,默认18
@property (strong,  nonatomic) UIFont           *titleFont;
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
