//
//  UIView+KRKit.m
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

#import "UIView+KRKit.h"
#import <objc/runtime.h>

@implementation UIView (KRSize)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)kr_removeAllSubviews
{
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end

static char kWhenTappedBlockKey;
static char kWhenTouchedDownBlockKey;
static char kWhenTouchedUpBlockKey;

@implementation UIView (KREvent)

#pragma mark - Private

- (void)runBlockForKey:(void *)blockKey
{
    void(^block)(void);
    block = objc_getAssociatedObject(self, blockKey);
    if (block) {
        block();
    }
}

- (void)setBlock:(void(^)(void))block forKey:(void *)key
{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)tapped
{
    [self runBlockForKey:&kWhenTappedBlockKey];
}

#pragma mark - Public

- (void)kr_whenTapped:(void(^)(void))block
{
    self.userInteractionEnabled = YES;

    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    tapGR.delegate = self;
    tapGR.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGR];
    [self setBlock:block forKey:&kWhenTappedBlockKey];
}

- (void)kr_whenTouchedDown:(void(^)(void))block
{
    [self setBlock:block forKey:&kWhenTouchedDownBlockKey];
}

- (void)kr_whenTouchedUp:(void(^)(void))block
{
    [self setBlock:block forKey:&kWhenTouchedUpBlockKey];
}

#pragma mark - Override

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedDownBlockKey];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedUpBlockKey];
}

@end

@implementation UIView (KRPosition)

- (void)kr_positionUnderView:(UIView *)view
{
    [self kr_positionUnderView:view padding:0];
}

- (void)kr_positionUnderView:(UIView *)view padding:(CGFloat)padding
{
    [self kr_positionUnderView:view padding:padding alignment:KRViewAlignmentCenter];
}

- (void)kr_positionUnderView:(UIView *)view alignment:(KRViewAlignment)alignment
{
    [self kr_positionUnderView:view padding:0 alignment:alignment];
}

- (void)kr_positionUnderView:(UIView *)view padding:(CGFloat)padding alignment:(KRViewAlignment)alignment
{
    self.top = view.bottom + padding;

    switch (alignment) {
        case KRViewAlignmentUnchanged:
            // do nothing
            break;
        case KRViewAlignmentLeftAligned:
            self.left = view.left;
            break;

        case KRViewAlignmentRightAligned:
            self.right = view.right;
            break;

        case KRViewAlignmentCenter:
            self.centerX = view.centerX;
            break;
    }
}

- (void)kr_addCenteredSubview:(UIView *)subview
{
    subview.left = (CGFloat)((self.bounds.size.width - subview.width) / 2);
    subview.top = (CGFloat)((self.bounds.size.height - subview.width) / 2);

    [self addSubview:subview];
}

- (void)kr_moveToCenterOfSuperview
{
    self.left = (CGFloat)((self.superview.bounds.size.width - self.width) / 2);
    self.top = (CGFloat)((self.superview.bounds.size.height - self.height) / 2);
}

@end


static char kIsLoadingKeyForView;
static char kHidesViewContentWhenLoadingKey;
static char kPositionKeyForView;
static char kIndicatorKeyForView;
static char kCoverViewKeyForView;

@implementation UIView (KRLoading)

@dynamic kr_isLoading;
@dynamic kr_hidesContentWhenLoading;
@dynamic kr_loadingPosition;
@dynamic kr_indicator;
@dynamic kr_coverView;

#pragma mark - Setter

- (void)setKr_isLoading:(BOOL)kr_isLoading
{
    objc_setAssociatedObject(self, &kIsLoadingKeyForView, [NSNumber numberWithBool:kr_isLoading], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setKr_hidesContentWhenLoading:(BOOL)kr_hidesContentWhenLoading
{
    objc_setAssociatedObject(self, &kHidesViewContentWhenLoadingKey, [NSNumber numberWithBool:kr_hidesContentWhenLoading], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setKr_loadingPosition:(KRLoadingControlPosition)kr_loadingPosition
{
    objc_setAssociatedObject(self, &kPositionKeyForView, [NSNumber numberWithInteger:kr_loadingPosition], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setKr_indicator:(UIActivityIndicatorView *)kr_indicator
{
    objc_setAssociatedObject(self, &kIndicatorKeyForView, kr_indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setKr_coverView:(UIView *)kr_coverView
{
    objc_setAssociatedObject(self, &kCoverViewKeyForView, kr_coverView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getter

- (BOOL)kr_isLoading
{
    NSNumber *isLoading = objc_getAssociatedObject(self, &kIsLoadingKeyForView);
    return [isLoading boolValue];
}

- (BOOL)kr_hidesContentWhenLoading
{
    NSNumber *hidesButtonWhenLoading = objc_getAssociatedObject(self, &kHidesViewContentWhenLoadingKey);
    return [hidesButtonWhenLoading boolValue];
}

- (KRLoadingControlPosition)kr_loadingPosition
{
    NSNumber *position = objc_getAssociatedObject(self, &kPositionKeyForView);
    return (KRLoadingControlPosition)[position integerValue];
}

- (UIActivityIndicatorView *)kr_indicator
{
    return objc_getAssociatedObject(self, &kIndicatorKeyForView);
}

- (UIView *)kr_coverView
{
    return objc_getAssociatedObject(self, &kCoverViewKeyForView);
}

#pragma mark - Public

- (void)kr_loading
{
    [self kr_loadingWithActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
}

- (void)kr_loadingWithActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style
{
    self.kr_isLoading = YES;

    if (!self.kr_indicator) {
        self.kr_indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    }
    if (self.kr_hidesContentWhenLoading) {
        if (!self.kr_coverView) {
            self.kr_coverView = [[UIView alloc] initWithFrame:self.bounds];
            self.kr_coverView.backgroundColor = self.backgroundColor;
        }
        [self addSubview:self.kr_coverView];
    }
    [self addSubview:self.kr_indicator];
    self.alpha = 0.8;

    const CGFloat margin = 15.0;

    switch (self.kr_loadingPosition) {
        case KRLoadingControlPositionCenter:
        {
            self.kr_indicator.centerX = self.width / 2.0;
            break;
        }
        case KRLoadingControlPositionLeft:
        {
            self.kr_indicator.left = self.left - margin;
            break;
        }
        case KRLoadingControlPositionRight:
        {
            self.kr_indicator.right = self.width - margin;
            break;
        }
        default:
            break;
    }
    self.kr_indicator.centerY = self.height / 2.0;

    [self.kr_indicator startAnimating];
}

- (void)kr_stopLoading
{
    [self.kr_indicator stopAnimating];
    [self.kr_indicator removeFromSuperview];
    [self.kr_coverView removeFromSuperview];

    self.alpha = 1;
    self.kr_isLoading = NO;
}

@end