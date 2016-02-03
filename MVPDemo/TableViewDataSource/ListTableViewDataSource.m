//
//  ListTableViewDataSource.m
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "ListModel.h"
#import "ListCell.h"

#import "UIImageView+WebCache.h"

static NSString * const reuserIde = @"ListCell";

@implementation ListTableViewDataSource

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

- (ListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIde forIndexPath:indexPath];
    ListModel *model = self.dataSource[indexPath.row];
    cell.titleLabel.text = model.title;
    if (model.photos.count) {
        NSURL *url = [NSURL URLWithString:[[model.photos firstObject] valueForKey:@"url"]];
        [cell.largeImageView sd_setImageWithURL:url];
    } else {
        cell.largeImageView.image = nil;
    }
    return cell;
}

@end
