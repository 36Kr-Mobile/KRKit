//
//  KRIconLabelView.h
//  KRClient
//
//  Created by aidenluo on 5/9/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KRImagePosition)
{
    KRImagePositionTop,
    KRImagePositionLeft,
    KRImagePositionBottom,
    KRImagePositionRight
};

@interface KRImageLabelView : UIView

@property (nonatomic, assign) KRImagePosition imagePosition; //default is KRImagePositionLeft
@property (nonatomic, assign) CGFloat elementInset; //defaut is 5.0
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *text;

@end
