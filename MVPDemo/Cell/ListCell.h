//
//  ListCell.h
//  MVPDemo
//
//  Created by kRadius on 16/1/29.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
