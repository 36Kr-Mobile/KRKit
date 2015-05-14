//
//  KRIconLabelView.m
//  KRClient
//
//  Created by aidenluo on 5/9/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "KRImageLabelView.h"
#import "UIView+KRKit.h"

@interface KRImageLabelView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation KRImageLabelView

#pragma mark - Override Method

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageView sizeToFit];
    [self.label sizeToFit];
    switch (self.imagePosition) {
        case KRImagePositionTop:
        {
            CGFloat maxWidth = MAX(self.imageView.width, self.label.width);
            self.imageView.top = 0.0;
            self.imageView.centerX = maxWidth/2.0;
            self.label.top = self.imageView.bottom + self.elementInset;
            self.label.centerX = self.imageView.centerX;
            self.size = CGSizeMake(maxWidth, self.label.bottom);
            break;
        }
        case KRImagePositionLeft:
        {
            CGFloat maxHeight = MAX(self.imageView.height, self.label.height);
            self.imageView.left = 0.0;
            self.imageView.centerY = maxHeight/2.0;
            self.label.left = self.imageView.right + self.elementInset;
            self.label.centerY = self.imageView.centerY;
            self.size = CGSizeMake(self.label.right, maxHeight);
            break;
        }
        case KRImagePositionBottom:
        {
            CGFloat maxWidth = MAX(self.imageView.width, self.label.width);
            self.label.top = 0.0;
            self.label.centerX = maxWidth/2.0;
            self.imageView.top = self.label.bottom + self.elementInset;
            self.imageView.centerX = self.label.centerX;
            self.size = CGSizeMake(maxWidth, self.imageView.bottom);
            break;
        }
        case KRImagePositionRight:
        {
            CGFloat maxHeight = MAX(self.imageView.height, self.label.height);
            self.label.left = 0.0;
            self.label.centerY = maxHeight/2.0;
            self.imageView.left = self.label.right + self.elementInset;
            self.imageView.centerY = self.label.centerY;
            self.size = CGSizeMake(self.imageView.right, maxHeight);
            break;
        }
        default:
            break;
    }
}

#pragma mark - Helper Method

- (void)commonInit
{
    _imagePosition = KRImagePositionLeft;
    _elementInset = 5.0;
    _font = [UIFont systemFontOfSize:12.0];
    _textColor = [UIColor grayColor];
    _imageView = [UIImageView new];
    _label = [UILabel new];
    _label.backgroundColor = [UIColor clearColor];
    _label.textColor = _textColor;
    [self addSubview:_label];
    [self addSubview:_imageView];
}

#pragma mark - Property Method

- (void)setImagePosition:(KRImagePosition)imagePosition
{
    if (_imagePosition != imagePosition) {
        _imagePosition = imagePosition;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)setFont:(UIFont *)font
{
    if (_font != font) {
        _font = font;
        self.label.font = font;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)setElementInset:(CGFloat)elementInset
{
    if (_elementInset != elementInset) {
        _elementInset = elementInset;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    if (_textColor != textColor) {
        _textColor = textColor;
        self.label.textColor = textColor;
        [self.label setNeedsDisplay];
    }
}

- (void)setIcon:(UIImage *)icon
{
    if (_icon != icon) {
        _icon = icon;
        self.imageView.image = _icon;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)setText:(NSString *)text
{
    if (_text != text) {
        _text = text;
        self.label.text = text;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

@end
