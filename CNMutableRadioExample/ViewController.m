//
//  ViewController.m
//  CNMutableRadioExample
//
//  Created by shscce on 15/5/12.
//  Copyright (c) 2015年 shscce. All rights reserved.
//

#define array @[@"测试1",@"测试2",@"非常测试3",@"特殊测试52343但是你姐夫那几份是否",@"简单测试"]


#import "ViewController.h"

#import "CNMutableRadioGroup.h"

@interface ViewController ()
{
    CALayer *layer;
    UIView *testView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CNMutableRadioGroup *group = [[CNMutableRadioGroup alloc] initWithChoices:array];
//    group.raidoType = CNMultiselect;
    [group addTarget:self action:@selector(groupValueChanged:) forControlEvents:UIControlEventValueChanged];
    [group setFrame:CGRectMake(0, 100, group.frame.size.width, group.frame.size.height)];
    [self.view addSubview:group];
    
    
    layer = [CALayer layer];
    layer.frame = CGRectMake(200, 200, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    
    testView = [[UIView alloc] initWithFrame:CGRectMake(150, 320, 100, 100)];
    testView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)groupValueChanged:(CNMutableRadioGroup *)radioGroup{
    NSLog(@"this is current selected indexs: %@",radioGroup.selectedIndexs);
    if (radioGroup.selectedIndexs.count%2 == 0) {
        layer.bounds = CGRectZero;
        [UIView animateWithDuration:.5 animations:^{
            testView.bounds = CGRectZero;
        }];
    }else{
        layer.bounds = CGRectMake(0, 0, 100, 100);
        [UIView animateWithDuration:.5 animations:^{
            testView.bounds = CGRectMake(0, 0, 100, 100);
        }];
    }
}

@end
