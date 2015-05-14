//
//  CNMutableRadioGroup.h
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CNMutableRadio.h"

typedef enum : NSUInteger {
    CNRadio,            //单选
    CNMultiselect,      //多选
} CNRadioGroupType;


@interface CNMutableRadioGroup : UIControl

@property (nonatomic) CNRadioGroupType raidoGroupType;
@property (nonatomic,strong) NSArray *choiceTitles;
@property (nonatomic,readonly) NSArray *selectedIndexs;

- (instancetype)initWithChoices:(NSArray *)choices;
@end
