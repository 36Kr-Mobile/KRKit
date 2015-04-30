//
//  UIImage+KRKit.h
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KRKit)

+ (UIImage *)kr_templateImageNamed:(NSString *)name;

/*
 缩小图片
 */
+ (UIImage *)kr_scaleImage:(UIImage *)image asThubmnailWithHeight:(CGFloat)thumbnailHeight;

@end
