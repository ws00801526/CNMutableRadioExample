//
//  CNMutableRadioGroup.h
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CNRadio,
    CNMultiselect,
} CNRadioType;

@interface CNMutableRadioGroup : UIControl

@property (nonatomic) CNRadioType raidoType;
@property (nonatomic,strong) NSArray *choiceTitles;
@property (nonatomic,readonly) NSArray *selectedIndexs;

- (instancetype)initWithChoices:(NSArray *)choices;
@end
