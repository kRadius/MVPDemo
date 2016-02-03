//
//  ListTableViewDataSource.h
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ListTableViewDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic, readonly) NSArray *dataSource;

//展示数据需要数据源
- (instancetype)initWithListData:(NSArray *)dataSource;

@end
