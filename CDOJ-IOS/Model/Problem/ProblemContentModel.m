//
//  ProblemContentModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemContentModel.h"

@implementation ProblemContentModel

- (instancetype)init {
    if (self = [super init]) {
        self.content = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)fetchDataWithProblemId:(NSString *)pid {
    [[AFHTTPSessionManager manager] GET:API_PROBLEM_DATA(pid) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.content = [responseObject objectForKey:@"problem"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_PROBLEM_DATA_REFRESHED object:nil];
        }
        else {
            [Message show:[NSString stringWithFormat:@"没有编号为%@的题目，请检查是否正确，或者是否拥有足够权限！", pid] withTitle:@"Opps"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [Message show:@"请输入正确的题目数字编号" withTitle:@"错误！"];
    }];
}

@end
