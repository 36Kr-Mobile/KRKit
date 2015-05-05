//
//  UIColor+KRKit.h
//  KRKit
//
//  Created by aidenluo on 5/5/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

@import UIKit;

@interface UIColor (KRKit)

+ (UIColor *)kr_ColorWithHex:(unsigned int)hex;
+ (UIColor *)kr_ColorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;
+ (UIColor *)kr_RandomColor;
+ (UIColor*)kr_RandomColorWithAlpha:(CGFloat)alpha;

@end
