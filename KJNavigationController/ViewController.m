//
//  ViewController.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/9/2.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+KJNavigationBar.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.title = @"firstVC";
    
    self.kj_navigationBarTintColor = [UIColor whiteColor];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    SecondViewController *vc = [SecondViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
