//
//  DetailTableViewController.m
//  MVPDemo
//
//  Created by kRadius on 16/1/30.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "DetailTableViewController.h"
//Protocol
#import "DetailViewProtocol.h"
#import "DetailTableViewDataSource.h"
#import "DetailPresenter.h"

@interface DetailTableViewController () <DetailViewProtocol>

@property (strong, nonatomic) DetailTableViewDataSource *dataSource;
@property (strong, nonatomic) DetailPresenter *presenter;

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicConfig];
}

- (void)basicConfig {
    self.presenter = [[DetailPresenter alloc] init];
    
    [self.presenter configWithView:self photos:self.photos];
}

#pragma mark - Private

#pragma mark - Delegate
#pragma mark <DetailViewProtocol>

- (void)showData:(NSArray *)data {
    self.dataSource = [[DetailTableViewDataSource alloc] initWithDataSource:data];
    self.tableView.dataSource = self.dataSource;
    
    [self.tableView reloadData];
}

#pragma mark <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

@end
