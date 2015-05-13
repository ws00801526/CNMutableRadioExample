//
//  CNMutableRadio.h
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNMutableRadio : UIControl

@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIColor *onTintColor;
@property (nonatomic,strong) UIColor *offTintColor;
@property (nonatomic,strong) UIColor *onTextColor;
@property (nonatomic,strong) UIColor *offTextColor;
@property (nonatomic) BOOL on;
@property (nonatomic,readonly) CGFloat height;
@property (nonatomic,readonly) CGFloat width;
@property (nonatomic) CGFloat y;

@end
