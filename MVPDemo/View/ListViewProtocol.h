//
//  ListViewProtocol.h
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  把ListViewController里自身处理逻辑，转移到这儿
 */
@protocol ListViewProtocol <NSObject>

- (void)startLoading;
- (void)stopLoading;
//拿到了数据之后
- (void)receivedListData:(NSArray *)data;

//跳转
- (void)go2Detail:(id)data;

@end
