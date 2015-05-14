//
//  CNMutableRadioGroup.m
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//

#import "CNMutableRadioGroup.h"

@implementation CNMutableRadioGroup
{
    NSMutableArray *_radios;
}

- (instancetype)initWithChoices:(NSArray *)choices{
    if (self = [super init]) {
        self.choiceTitles = choices;
        [self setupRadios];
    }
    return self;
}

- (void)setupRadios{
    CGFloat startY = 5.0f;
    CGFloat minWidth = 100.0f;
    for (int i = 0 ; i < self.choiceTitles.count; i++) {
        CNMutableRadio *radio = [[CNMutableRadio alloc] init];
        [radio setTitle:self.choiceTitles[i]];
        [radio setY:startY];
        radio.tag = i;
        [radio addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:radio];
        startY = startY + 30 + 5;
        minWidth = MAX(minWidth, radio.width);
    }
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, minWidth, startY)];
}

- (void)buttonClick:(CNMutableRadio *)radio{
    if (self.raidoGroupType == CNRadio) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[CNMutableRadio class]] && radio != view) {
                [(CNMutableRadio *)view setOn:NO];
            }
        }
    }
    [radio setOn:!radio.on];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


#pragma mark - getters and setters

- (void)setChoiceTitles:(NSArray *)choiceTitles{
    _choiceTitles = [choiceTitles copy];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self setupRadios];
}

- (NSArray *)selectedIndexs{
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[CNMutableRadio class]]) {
            if ([(CNMutableRadio*)view on]) {
                [mutableArray addObject:@(view.tag)];
            }
        }
    }
    
    return [NSArray arrayWithArray:mutableArray];
}

@end

