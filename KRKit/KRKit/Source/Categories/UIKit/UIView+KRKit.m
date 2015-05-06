//
//  UIView+KRKit.m
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

#import "UIView+KRKit.h"
#import <objc/runtime.h>
@import QuartzCore;

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

@implementation UIView (Debug)

- (void)kr_markBorderWithRandomColor
{
    self.layer.borderColor = [UIColor colorWithRed:(arc4random() % 255 )/ 255.f green:(arc4random() % 255 )/ 255.f blue:(arc4random() % 255 )/ 255.f alpha:1].CGColor;
    self.layer.borderWidth = 1.0f;
}

- (void)kr_markBorderWithRandomColorRecursive
{
    [self kr_markBorderWithRandomColor];
    for (UIView *v in self.subviews) {
        [v kr_markBorderWithRandomColorRecursive];
    }
}

@end