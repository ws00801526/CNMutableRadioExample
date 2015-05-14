//
//  CNMutableRadio.h
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    CNRaidoNormal,
    CNRadioCustom,
} CNRadioType;

@interface CNMutableRadio : UIControl

@property (nonatomic,copy) NSString *title;

#pragma mark - 默认颜色配置
@property (nonatomic,strong) UIColor *onTintColor;
@property (nonatomic,strong) UIColor *offTintColor;
@property (nonatomic,strong) UIColor *onTextColor;
@property (nonatomic,strong) UIColor *offTextColor;
@property (nonatomic,strong) UIColor *onInnerTintColor;
@property (nonatomic,strong) UIColor *offInnerTintColor;

#pragma mark - 自定义图片显示
@property (nonatomic,strong) UIImage *onImage;
@property (nonatomic,strong) UIImage *offImage;

@property (nonatomic) BOOL on;
@property (nonatomic,readonly) CGFloat height;
@property (nonatomic,readonly) CGFloat width;
@property (nonatomic) CGFloat y;

@end
