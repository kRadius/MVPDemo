//
//  ListModel.m
//  MVPDemo
//
//  Created by kRadius on 16/1/29.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "ListModel.h"

//author =             {
//    avatar = "http://img3.douban.com/icon/up141096244-1.jpg";
//    id = 1d1r6;
//    name = partofme;
//};
//authorId = 1d1r6;
//"comments_count" = 393;
//content = "\U5c0f\U7ec4\U771f\U7684\U6ca1\U6709\U4ee5\U524d\U6c61\U4e86 kk
//\n
//\n\U58f0\U63a7\U60a3\U8005\U60f3\U8981\U798f\U5229\Ud83d\Ude0a
//\n
//\n<\U56fe\U72471>";
//created = "2016-01-25 23:49:57";
//dbtid = 83321245;
//id = 16tra;
//isAnonymity = 0;
//isDeleted = 0;
//isDouban = 1;
//isElited = 0;
//isLiked = 0;
//isLocked = 0;
//isTopped = 0;
//"like_count" = 16;
//photos =             (
//                      {
//                          id = 1czy2;
//                          seqId = 1;
//                          size =                     {
//                              height = 666;
//                              width = 500;
//                          };
//                          tag =                     {
//                              name = "";
//                              x = 50;
//                              y = 50;
//                          };
//                          url = "http://img3.doubanio.com/view/group_topic/large/public/p41717157.jpg";
//                      },
//                      {
//                          id = 1d5ce;
//                          seqId = 1;
//                          size =                     {
//                              height = 666;
//                              width = 500;
//                          };
//                          tag =                     {
//                              name = "";
//                              x = 50;
//                              y = 50;
//                          };
//                          url = "http://img3.douban.com/view/group_topic/large/public/p41851844.jpg";
//                      },
//                      {
//                          id = 1d5so;
//                          seqId = 1;
//                          size =                     {
//                              height = 666;
//                              width = 500;
//                          };
//                          tag =                     {
//                              name = "";
//                              x = 50;
//                              y = 50;
//                          };
//                          url = "http://img3.douban.com/view/group_topic/large/public/p41858431.jpg";
//                      }
//                      );
//title = "\U3010\U6652\U3011\U58f0\U63a7\U59b9";
//updated = "2016-01-29 22:47:28";
//},

@implementation ListModel

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    self.title = keyedValues[@"title"];
    self.photos = keyedValues[@"photos"];
}

@end
