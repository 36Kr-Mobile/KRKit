//
//  NSMutableAttributedString+KRKit.m
//  KRKit
//
//  Created by aidenluo on 4/30/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "NSMutableAttributedString+KRKit.h"

@implementation NSMutableAttributedString (KRKit)

- (void)kr_addTextColor:(UIColor*)color range:(NSRange)range
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)kr_addTextColor:(UIColor *)color
{
    [self kr_addTextColor:color range:NSMakeRange(0, self.length)];
}

- (void)kr_addFont:(UIFont*)font range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:font range:range];
}

- (void)kr_addFont:(UIFont*)font
{
    [self kr_addFont:font range:NSMakeRange(0, self.length)];
}

- (void)kr_addKerning:(CGFloat)kerning range:(NSRange)range
{
    [self addAttribute:NSKernAttributeName value:@(kerning) range:range];
}

- (void)kr_addKerning:(CGFloat)kerning
{
    [self kr_addKerning:kerning range:NSMakeRange(0, self.length)];
}

- (void)kr_addLineHeight:(CGFloat)lineHeight range:(NSRange)range
{
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineHeight];
    [self addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:range];
}

- (void)kr_addLineHeight:(CGFloat)lineHeight
{
    [self kr_addLineHeight:lineHeight range:NSMakeRange(0, self.length)];
}

@end
