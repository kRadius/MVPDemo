//
//  ListPresenter.m
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "ListPresenter.h"
#import "ListModel.h"

@implementation ListPresenter

@synthesize view;
@synthesize manager;


#pragma mark - <Presenter Protocol>
- (void)configWithView:(id<ListViewProtocol> )aView dataManager:(id<ListDataManagerProtocol>)aManager {
    
    self.view = aView;
    self.manager = aManager;
    
    [self fetchAndUpdate];
}

//点击事件
- (void)listItemClicked:(NSInteger)index {
    NSLog(@"我点击了cell");
    NSArray *photos = [self.manager.dataArray[index] valueForKey:@"photos"];
    [self.view go2Detail:photos];
}

- (void)refreshItemClicked:(id)sender {
    NSLog(@"刷新");
    [self fetchAndUpdate];
}

#pragma mark - Private
- (void)fetchAndUpdate {
    [self.view startLoading];
    //获取数据
    [self.manager fetchSuccess:^(NSArray *listData) {
        [self.view stopLoading];
        
        NSMutableArray *dataM = [[NSMutableArray alloc] init];
        [listData enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ListModel *model = [[ListModel alloc] init];
            [model setValuesForKeysWithDictionary:obj];
            [dataM addObject:model];
        }];
        [self.view receivedListData:dataM];
        
    } failed:^(NSError *error) {
        [self.view stopLoading];
        NSLog(@"error = %@",error.localizedDescription);
    }];
}

@end
