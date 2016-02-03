//
//  DetailViewProtocol.h
//  MVPDemo
//
//  Created by kRadius on 16/1/30.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DetailViewProtocol <NSObject>

//拿到了数据之后
- (void)showData:(NSArray *)data;

@end
