//
//  SecondViewController.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/7/3.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+KJNavigationBar.h"
#import "ThirdViewController.h"

@interface SecondViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"sectionVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.kj_navigationBarTintColor = [UIColor cyanColor];
    self.kj_navigationBarAlpha = 0;
    
    [self.view addSubview:self.tableView];
    
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[ThirdViewController new] animated:YES];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _tableView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat distance = 600;
    
    CGFloat progress = 0;
    if (offsetY < 0) {
        progress = 0;
    } else if (progress < distance) {
        progress = offsetY / distance;
    } else {
        progress = 1;
    }
    
    if (progress > 0.5) {
        self.kj_navigationTitleColor = [UIColor whiteColor];
    } else {
        self.kj_navigationTitleColor = [UIColor blackColor];
    }
    
    self.kj_navigationBarAlpha = progress;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
