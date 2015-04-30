//
//  NSAttributedString+KRKit.m
//  KRKit
//
//  Created by aidenluo on 4/30/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "NSAttributedString+KRKit.h"

@implementation NSAttributedString (KRKit)

+ (NSAttributedString*)kr_attributedStringWithText:(NSString*)text lineHeight:(CGFloat)space
{
    if(text.length < 1) return nil;
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:space];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:text];
    [attr addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0,attr.length)];
    return attr;
}

+ (NSAttributedString*)kr_attributedStringWithText:(NSString *)text kerning:(CGFloat)kerning
{
    if(text.length < 1) return nil;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:text];
    [attr addAttribute:NSKernAttributeName value:@(kerning) range:NSMakeRange(0, text.length)];
    return attr;
}

@end
