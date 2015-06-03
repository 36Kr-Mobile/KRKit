//
//  UIView+KRKit.h
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

@import UIKit;

/**************************************************************************************************
 Layout相关
 **************************************************************************************************/

@interface UIView (KRLayout)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat cornerRadius;

@property (nonatomic) UIView *topSuperView;

- (void)kr_widthEqualToView:(UIView *)view;
- (void)kr_heightEqualToView:(UIView *)view;
- (void)kr_sizeEqualToView:(UIView *)view;
- (void)kr_centerXEqualToView:(UIView *)view;
- (void)kr_centerYEqualToView:(UIView *)view;
- (void)kr_top:(CGFloat)top fromView:(UIView *)view;
- (void)kr_bottom:(CGFloat)bottom fromView:(UIView *)view;
- (void)kr_left:(CGFloat)left fromView:(UIView *)view;
- (void)kr_right:(CGFloat)right fromView:(UIView *)view;
- (void)kr_fillWidth;
- (void)kr_fillHeight;
- (void)kr_fill;
- (void)kr_removeAllSubviews;

@end

@interface UIView (Debug)

- (void)kr_markBorderWithRandomColor;
- (void)kr_markBorderWithRandomColorRecursive;

@end
