//
//  DetailTableViewDataSource.m
//  MVPDemo
//
//  Created by kRadius on 16/1/30.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "DetailTableViewDataSource.h"
#import "DetailCell.h"
#import "UIImageView+WebCache.h"

static NSString * const reuseIde = @"DetailCell";

@implementation DetailTableViewDataSource

- (instancetype)initWithDataSource:(NSArray *)dataSouce {
    if (self) {
        _dataSource = dataSouce;
    }
    return self;
}

#pragma mark 

- (instancetype)initWithListData:(NSArray *)dataSource {
    if (self = [super init]) {
        _dataSource = dataSource;
    }
    return self;
}

#pragma mark - <UITableView DataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (DetailCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIde forIndexPath:indexPath];
    NSURL *url = self.dataSource[indexPath.row][@"url"];

    [cell.largeImageView sd_setImageWithURL:url];
    return cell;
}

@end
