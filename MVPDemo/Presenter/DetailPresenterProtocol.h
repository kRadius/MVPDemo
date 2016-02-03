//
//  DetailPresenterProtocol.h
//  MVPDemo
//
//  Created by kRadius on 16/1/31.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DetailViewProtocol.h"

@protocol DetailPresenterProtocol <NSObject>

//处理ViewControll自身的逻辑
@property (weak, nonatomic) id<DetailViewProtocol> view;
@property (weak, nonatomic) NSArray *photos;

//初始化，并不是自个儿的实例化方法
- (void)configWithView:(id<DetailViewProtocol>)aView photos:(NSArray *)photos;

@end
