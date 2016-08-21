//
//  CodeSubmitModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "CodeSubmitModel.h"

@implementation CodeSubmitModel


- (instancetype)initWithCode:(NSString*)code withLanguageId:(NSInteger)languageId toProblem:(NSString*)problemId inContest:(NSString*)contestId {
    if(self = [super init]) {
        self.requestBody = @{
                             @"codeContent": STR(code),
                             @"languageId": STRF(@"%ld", (long)languageId),
                             @"problemId": STR(problemId),
                             @"contestId": STR(contestId)
                             };
    }
    return self;
}

- (void)submit {
    NSLog(@"requestBody = %@", self.requestBody);
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_STATUS_SUBMIT parameters:self.requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_STATUS_SUBMIT_SUCCEED object:nil];
        }
        else {
            if([responseObject objectForKey:@"error_msg"]) {
                [Message show:STR([responseObject objectForKey:@"error_msg"]) withTitle:@"Opps"];
            }
            else {
                [Message show:@"提交失败" withTitle:@"Opps"];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
