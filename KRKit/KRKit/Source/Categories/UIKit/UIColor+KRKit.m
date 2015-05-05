//
//  UIColor+KRKit.m
//  KRKit
//
//  Created by aidenluo on 5/5/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "UIColor+KRKit.h"

@implementation UIColor (KRKit)

+ (UIColor *)kr_ColorWithHex:(unsigned int)hex
{
    return [UIColor kr_ColorWithHex:hex alpha:1.0];
}

+ (UIColor *)kr_ColorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

+ (UIColor *)kr_RandomColor
{
    return [UIColor kr_RandomColorWithAlpha:1.0];
}

+ (UIColor*)kr_RandomColorWithAlpha:(CGFloat)alpha
{
    
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
    
}

@end
