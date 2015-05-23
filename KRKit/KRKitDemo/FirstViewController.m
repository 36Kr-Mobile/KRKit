//
//  FirstViewController.m
//  KRKitDemo
//
//  Created by aidenluo on 5/23/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KRImageLabelView *view = [KRImageLabelView new];
    view.text = @"hello";
    [view kr_markBorderWithRandomColor];
    [self.view addSubview:view];
    view.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
