
//
//  ListDataManagerProtocol.h
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ListDataManagerProtocol <NSObject>

@property (strong, nonatomic) NSArray *dataArray;

- (void)fetchSuccess:(void (^)(NSArray *success))success failed:(void (^)(NSError *error))error;

@end
