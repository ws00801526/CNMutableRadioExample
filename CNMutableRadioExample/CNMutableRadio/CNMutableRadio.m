//
//  CNMutableRadio.m
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//


#import "CNMutableRadio.h"

@implementation CNMutableRadio
{
    NSArray *_choices;
    __weak UILabel *_titleLabel;       //显示状态文字
    __weak UIView *_onView;   //显示选中背景
    __weak UIView *_offView; //显示未选中的背景
    __weak UIView *_onInnerView;   //显示选中状态内部view
    __weak UIView *_offInnerView;    //显示未选中状态内部view
    __weak UIView *_containerView;
    __weak UIImageView *_imageView;
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self commonInit];
    }
    return self;
}


- (void)commonInit{
        
    //配置状态背景颜色
    self.onTintColor = [UIColor orangeColor];
    self.offTintColor = [UIColor lightGrayColor];
    
    self.onInnerTintColor = [UIColor darkGrayColor];
    self.offInnerTintColor = [UIColor whiteColor];
    
    //配置状态文字颜色
    self.onTextColor = [UIColor orangeColor];
    self.offTextColor = [UIColor darkTextColor];
    
    self.backgroundColor = [UIColor clearColor];
    
    //初始化文字显示
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14.0f];
    titleLabel.textColor = self.offTextColor;
    titleLabel.highlightedTextColor = self.onTextColor;
    [self addSubview:_titleLabel = titleLabel];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetHeight(self.bounds)/2 - 10, 20, 20)];
    
    //初始化关闭背景
    UIView *offView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    offView.layer.cornerRadius = 10;
    offView.backgroundColor = self.offTintColor;
    [containerView addSubview:_offView = offView];
    
    UIView *onView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    onView.backgroundColor = self.onTintColor;
    onView.hidden = YES;
    onView.layer.cornerRadius = 10;
    [containerView addSubview:_onView = onView];
    
    
    UIView *offInnerView = [[UIView alloc] initWithFrame:CGRectMake(2.5, 2.5, 15, 15)];
    offInnerView.backgroundColor = [UIColor whiteColor];
    offInnerView.layer.cornerRadius = 7.5;
    [containerView addSubview:_offInnerView = offInnerView];
    
    UIView *onInnerView = [[UIView alloc] initWithFrame:CGRectMake(2.5, 2.5, 15, 15)];
    onInnerView.hidden = YES;
    onInnerView.backgroundColor = [UIColor darkGrayColor];
    onInnerView.layer.cornerRadius = 7.5;
    [containerView addSubview:_onInnerView = onInnerView];
    
    [self addSubview:_containerView = containerView];

}


- (void)layoutSubviews{
    
    [_titleLabel setFrame:CGRectMake(30, 0, _titleLabel.frame.size.width, 30)];
    [_containerView setFrame:CGRectMake(5, 30/2 - 10, 20, 20)];

    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 35 + _titleLabel.frame.size.width, self.height)];
    
}


#pragma mark - setters & getters

- (void)setTitle:(NSString *)title{
    
    _title = title;
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    [self layoutIfNeeded];
    
}

- (void)setOn:(BOOL)on{
    if (_on == on) {
        return;
    }
    _on = on;
    if (_on) {
        _onView.bounds = _onInnerView.bounds = CGRectZero;
        _onView.hidden = _onInnerView.hidden = NO;
        [UIView animateWithDuration:.3 animations:^{
            _onInnerView.bounds = CGRectMake(0, 0, 15, 15);
            _onView.bounds = CGRectMake(0, 0, 20, 20);
            _titleLabel.highlighted = YES;
            _imageView.highlighted = YES;
        }];
    }else{
        [UIView animateWithDuration:.3 animations:^{
            _onInnerView.bounds = _onView.bounds = CGRectZero;
            _titleLabel.highlighted = NO;
            _imageView.highlighted = NO;
        } completion:^(BOOL finished) {
            _onView.hidden = _onInnerView.hidden = YES;
        }];
    }
}

- (void)setY:(CGFloat)y{
    [self setFrame:CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)];
}


- (void)setOnInnerTintColor:(UIColor *)onInnerTintColor{
    _onInnerTintColor = onInnerTintColor;
    _onInnerView.backgroundColor = _onInnerTintColor;
}

- (void)setOnTextColor:(UIColor *)onTextColor{
    _onTextColor = onTextColor;
    _titleLabel.highlightedTextColor = onTextColor;
}

- (void)setOnTintColor:(UIColor *)onTintColor{
    _onTintColor = onTintColor;
    _onView.backgroundColor = _onTintColor;
}

- (void)setOffInnerTintColor:(UIColor *)offInnerTintColor{
    _offInnerTintColor = offInnerTintColor;
    _offInnerView.backgroundColor = _offInnerTintColor;
}

- (void)setOffTextColor:(UIColor *)offTextColor{
    _offTextColor = offTextColor;
    _titleLabel.textColor = offTextColor;
}

- (void)setOffTintColor:(UIColor *)offTintColor{
    _offTintColor = offTintColor;
}

- (void)setOffImage:(UIImage *)offImage{
    _offImage = offImage;
    _imageView.image = offImage;
}

- (void)setOnImage:(UIImage *)onImage{
    _onImage = onImage;
    _imageView.highlightedImage = onImage;
}

- (CGFloat)height{
    return 30;
}

- (CGFloat)width{
    return self.frame.size.width;
}

@end
