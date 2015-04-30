//
//  NSAttributedString+KRKit.h
//  KRKit
//
//  Created by aidenluo on 4/30/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSAttributedString (KRKit)

+ (NSAttributedString*)kr_attributedStringWithText:(NSString*)text lineHeight:(CGFloat)space;
+ (NSAttributedString*)kr_attributedStringWithText:(NSString *)text kerning:(CGFloat)kerning;

@end
