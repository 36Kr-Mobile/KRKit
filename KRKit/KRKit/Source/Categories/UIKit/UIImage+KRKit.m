//
//  UIImage+KRKit.m
//  KRKit
//
//  Created by 小普 on 15/4/30.
//  Copyright (c) 2015年 36kr. All rights reserved.
//

#import "UIImage+KRKit.h"

@implementation UIImage (KRKit)

+ (UIImage *)kr_templateImageNamed:(NSString *)name
{
    return [[self imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)kr_scaleImage:(UIImage *)image asThubmnailWithHeight:(CGFloat)thumbnailHeight
{
    //缩小图片
    if (!image) {
        return nil;
    }
    UIImage *sourceImage = image;
    UIImage *newImage = nil;

    CGFloat thumbnailWidth = image.size.width * thumbnailHeight / image.size.height;

    UIGraphicsBeginImageContext(CGSizeMake(thumbnailWidth, thumbnailHeight));

    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = thumbnailWidth;
    thumbnailRect.size.height = thumbnailHeight;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
