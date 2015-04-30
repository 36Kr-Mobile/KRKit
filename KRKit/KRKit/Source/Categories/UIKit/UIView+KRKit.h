//
//  UIView+KRKit.h
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

@import UIKit;

/**************************************************************************************************
 Frame相关
 **************************************************************************************************/

@interface UIView (KRSize)

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

- (void)kr_removeAllSubviews;

@end

/**************************************************************************************************
 点击事件 Touch Event
 **************************************************************************************************/

@interface UIView (KREvent) <UIGestureRecognizerDelegate>

- (void)kr_whenTapped:(void(^)(void))block;
- (void)kr_whenTouchedDown:(void(^)(void))block;
- (void)kr_whenTouchedUp:(void(^)(void))block;

@end

/**************************************************************************************************
 布局相关 Layout
 **************************************************************************************************/

typedef enum {
    KRViewAlignmentUnchanged,
    KRViewAlignmentLeftAligned,
    KRViewAlignmentRightAligned,
    KRViewAlignmentCenter
} KRViewAlignment;

@interface UIView (KRPosition)

- (void)kr_positionUnderView:(UIView *)view;
- (void)kr_positionUnderView:(UIView *)view padding:(CGFloat)padding;
- (void)kr_positionUnderView:(UIView *)view alignment:(KRViewAlignment)alignment;
- (void)kr_positionUnderView:(UIView *)view padding:(CGFloat)padding alignment:(KRViewAlignment)alignment;

- (void)kr_addCenteredSubview:(UIView *)subview;
- (void)kr_moveToCenterOfSuperview;

@end

/**************************************************************************************************
 加载相关 Layout
 **************************************************************************************************/

typedef NS_ENUM(NSUInteger, KRLoadingControlPosition) {
    KRLoadingControlPositionCenter,
    KRLoadingControlPositionLeft,
    KRLoadingControlPositionRight,
};

@interface UIView (KRLoading)

@property (strong, nonatomic) UIView *kr_coverView;
@property (assign, nonatomic) BOOL kr_isLoading;
@property (assign, nonatomic) BOOL kr_hidesContentWhenLoading;
@property (assign, nonatomic) KRLoadingControlPosition kr_loadingPosition;
@property (strong, nonatomic) UIActivityIndicatorView *kr_indicator;

- (void)kr_loading;
- (void)kr_stopLoading;
- (void)kr_loadingWithActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style;

@end