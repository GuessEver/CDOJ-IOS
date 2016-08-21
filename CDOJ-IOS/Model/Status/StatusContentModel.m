//
//  StatusContentModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "StatusContentModel.h"

@implementation StatusContentModel

- (instancetype)init {
    if (self = [super init]) {
        self.content = @"";
    }
    return self;
}

- (void)fetchDataWithStatusId:(NSString *)statusId {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_STATUS_INFO(statusId) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            NSString* codeContent = STR([responseObject objectForKey:@"code"]);
            if([responseObject objectForKey:@"compileInfo"]) {
                codeContent = STRF(@"/* Compile Info\n"
                                   "%@\n"
                                   " */\n"
                                   "%@"
                                   , [responseObject objectForKey:@"compileInfo"]
                                   , codeContent);
            }
            self.content = codeContent;
        }
        else {
            self.content = STR([responseObject objectForKey:@"error_msg"]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_STATUS_DATA_REFRESHED object:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
