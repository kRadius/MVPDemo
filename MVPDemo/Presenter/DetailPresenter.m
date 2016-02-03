//
//  DetailPresenter.m
//  MVPDemo
//
//  Created by kRadius on 16/1/31.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "DetailPresenter.h"


@implementation DetailPresenter

@synthesize view;
@synthesize photos;

- (void)configWithView:(id<DetailViewProtocol>)aView photos:(NSArray *)aPhotos{
    self.view = aView;
    self.photos = aPhotos;
    
    [self.view showData:aPhotos];
}

@end
