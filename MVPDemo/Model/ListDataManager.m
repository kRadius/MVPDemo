//
//  ListDataManager.m
//  MVPDemo
//
//  Created by kRadius on 16/1/27.
//  Copyright © 2016年 kRadius. All rights reserved.
//

#import "ListDataManager.h"

static NSString *urlString = @"http://www.haixiuzu.com/app/shy/topic/get/v2/list?_ver=110&_token=255919d99d249207760bc66659c240fe&_did=410C70B7-DF80-4766-8510-4E5FAED40E36&_type=iPhone&_net=-1&_time=1454074776&_from=AppStore&start=0";

//    http://www.haixiuzu.com/app/shy/topic/get/v2/list?_ver=110&_token=9aa3b64785a5f7f86f036f85fe0183fb&_did=410C70B7-DF80-4766-8510-4E5FAED40E36&_type=iPhone&_net=-1&_time=1454074889&_from=AppStore&start=0


@implementation ListDataManager

@synthesize dataArray;

- (void)fetchSuccess:(void (^)(NSArray *success))success failed:(void (^)(NSError *error))error {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
#pragma clang diagnostic ignored "-Wdeprecated"
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            error(connectionError);
            return;
        }
        NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"data = %@",responseData);
        self.dataArray = [responseData valueForKey:@"topics"];
        success(self.dataArray);
        
    }];
}
@end