//
//  ThirdViewController.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/7/3.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIViewController+KJNavigationBar.h"

@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"thirdVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.kj_navigationBarTintColor = [UIColor cyanColor];
    self.kj_navigationTitleColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *title = [NSString stringWithFormat:@"navigationBar%02ld", indexPath.row];
    cell.textLabel.text = title;
    return cell;
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _tableView;
}

@end
