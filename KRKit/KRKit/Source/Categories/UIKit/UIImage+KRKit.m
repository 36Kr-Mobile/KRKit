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

+ (UIImage *)kr_circularImage:(UIImage *)image withRadius:(CGFloat)radius withDiamter:(NSUInteger)diameter
{
    if (!image) {
        return nil;
    }
    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        
        UIBezierPath *imgPath = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:radius];
        [imgPath addClip];
        [image drawInRect:frame];
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        CGContextRestoreGState(context);
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
