//
//  NSMutableAttributedString+KRKit.h
//  KRKit
//
//  Created by aidenluo on 4/30/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSMutableAttributedString (KRKit)

- (void)kr_addTextColor:(UIColor*)color range:(NSRange)range;
- (void)kr_addTextColor:(UIColor *)color;

- (void)kr_addFont:(UIFont*)font range:(NSRange)range;
- (void)kr_addFont:(UIFont*)font;

- (void)kr_addKerning:(CGFloat)kerning range:(NSRange)range;
- (void)kr_addKerning:(CGFloat)kerning;

- (void)kr_addLineHeight:(CGFloat)lineHeight range:(NSRange)range;
- (void)kr_addLineHeight:(CGFloat)lineHeight;

@end
