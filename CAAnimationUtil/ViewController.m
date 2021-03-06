//
//  ViewController.m
//  CAAnimationUtil
//
//  Created by LEA on 2017/11/2.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "ViewController.h"
#import "BasicViewController.h"
#import "TransitionViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"基础动画";
    } else {
        cell.textLabel.text = @"翻页动画";
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        BasicViewController *controller = [[BasicViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        TransitionViewController *controller = [[TransitionViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
