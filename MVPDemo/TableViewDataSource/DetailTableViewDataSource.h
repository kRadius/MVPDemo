//
//  DetailTableViewDataSource.h
//  MVPDemo
//
//  Created by kRadius on 16/1/30.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DetailTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic, readonly) NSArray *dataSource;

- (instancetype)initWithDataSource:(NSArray *)dataSouce;

@end
