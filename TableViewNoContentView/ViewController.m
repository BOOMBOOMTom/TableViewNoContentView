//
//  ViewController.m
//  TableViewNoContentView
//
//  Created by 蔡强 on 2017/4/26.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "MyTableView.h"
#import "UIView+frameAdjust.h"
#import "NoContentView.h"
#import "SVProgressHUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) MyTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //------- 创建naviView -------//
    UIView *naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    [self.view addSubview:naviView];
    naviView.backgroundColor = [UIColor redColor];
    
    UIButton *titleButton = [[UIButton alloc]initWithFrame:CGRectMake(120, 20, self.view.width - 240, 44)];
    [naviView addSubview:titleButton];
    [titleButton setTitle:@"点击移除占位图" forState:UIControlStateNormal];
    titleButton.backgroundColor = [UIColor redColor];
    [titleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleButtonClicked) forControlEvents:UIControlEventTouchDown];
    [titleButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    // 左边的按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(20, 20, 100, 44);
    [naviView addSubview:leftButton];
    [leftButton setTitle:@"显示无网占位图" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchDown];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    
    // 右边的button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(self.view.width - 120, 20, 100, 44);
    [naviView addSubview:rightButton];
    [rightButton setTitle:@"无订单占位图" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchDown];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    
    
    //------- 创建tableView -------//
    self.tableView = [[MyTableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor yellowColor];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    [SVProgressHUD setMinimumDismissTimeInterval:1];
}

#pragma mark - 左边的按钮点击
/** 左边的按钮点击 */
- (void)leftButtonClicked{
    // 展示无数据占位图
    [self.tableView showEmptyViewWithType:NoContentTypeNetwork];
    // 无数据占位图点击的回调
    self.tableView.noContentViewTapedBlock = ^{
        [SVProgressHUD showSuccessWithStatus:@"没网"];
    };
}

#pragma mark - 右边的按钮点击
/** 右边的按钮点击 */
- (void)rightButtonClicked{
    // 展示无数据占位图
    [self.tableView showEmptyViewWithType:NoContentTypeOrder];
    // 无数据占位图点击的回调
    self.tableView.noContentViewTapedBlock = ^{
        [SVProgressHUD showSuccessWithStatus:@"订单 木有"];
    };
}

#pragma mark - 中间的按钮点击
/** 中间的按钮点击 */
- (void)titleButtonClicked{
    // 移除无数据占位图
    [self.tableView removeEmptyView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

@end
