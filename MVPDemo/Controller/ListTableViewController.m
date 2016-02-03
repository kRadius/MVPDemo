//
//  ListTableViewController.m
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

//VC
#import "ListTableViewController.h"
#import "DetailTableViewController.h"
//Model
#import "ListDataManager.h"
//DataSource
#import "ListTableViewDataSource.h"
//Protocol
#import "ListViewProtocol.h"
//Presenter
#import "ListPresenter.h"

static NSString * const kSegueToDetail = @"go2Detail";

@interface ListTableViewController ()<UITableViewDelegate,ListViewProtocol>

//UI
@property (strong, nonatomic) UIActivityIndicatorView *activity;

@property (strong, nonatomic) ListTableViewDataSource *listDataSource;
@property (strong, nonatomic) ListPresenter *presenter;
@property (strong, nonatomic) ListDataManager *manager;

@end

@implementation ListTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private
- (void)basicConfig{
    self.presenter = [[ListPresenter alloc] init];
    self.manager = [[ListDataManager alloc] init];
    [self.presenter configWithView:self dataManager:self.manager];
    
    
}
#pragma mark - Delegate
#pragma mark <ListView Delegate>
- (void)startLoading {
    [self.activity startAnimating];
}

- (void)stopLoading {
    [self.activity stopAnimating];
}

- (void)receivedListData:(NSArray *)data {
    self.listDataSource = [[ListTableViewDataSource alloc] initWithListData:data];
    self.tableView.dataSource = self.listDataSource;
    
    [self.tableView reloadData];
}

- (void)go2Detail:(id)data{
    [self performSegueWithIdentifier:kSegueToDetail sender:data];
}

#pragma mark <UITableView Delegate>
//要是愿意，也可以把Delegate分离出去
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 230.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter listItemClicked:indexPath.row];
}
#pragma mark - Event Response
#pragma mark <IB Action>

- (IBAction)refreshItemClicked:(UIBarButtonItem *)sender {
    [self.presenter refreshItemClicked:sender];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *identifier = segue.identifier;
    if ([identifier isEqualToString:kSegueToDetail]) {
        DetailTableViewController *dest = segue.destinationViewController;
        dest.photos = sender;
    }
}

#pragma mark - Setter/Getter
- (UIActivityIndicatorView *)activity {
    if (!_activity) {
        _activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _activity.center = [UIApplication sharedApplication].keyWindow.center;
        _activity.hidesWhenStopped = YES;
        [[UIApplication sharedApplication].keyWindow addSubview:_activity];
    }
    return _activity;
}

@end
