//
//  ListPresenterProtocol.h
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>
//View
#import "ListViewProtocol.h"
//Model
#import "ListDataManagerProtocol.h"

@protocol ListPresenterProtocol <NSObject>

//处理ViewControll自身的逻辑
@property (weak, nonatomic) id<ListViewProtocol> view;
//还要有一个和数据打交道的变量
@property (weak, nonatomic) id<ListDataManagerProtocol> manager;

//还可以定义一些UI的Action
- (void)listItemClicked:(NSInteger)index;

- (void)refreshItemClicked:(id)sender;

//初始化这俩，并不是自个的实例化方法
- (void)configWithView:(id<ListViewProtocol>)aView dataManager:(id<ListDataManagerProtocol>)aManager;

@end
