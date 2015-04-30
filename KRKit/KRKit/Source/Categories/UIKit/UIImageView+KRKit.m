//
//  UIImageView+KRKit.m
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

#import "UIImageView+KRKit.h"

@implementation UIImageView (KRKit)

- (instancetype)initWithImage:(UIImage *)image tintColor:(UIColor *)tintColor
{
    self = [self initWithImage:image];
    if (self) {
        self.tintColor = tintColor;
    }
    return self;
}

@end
