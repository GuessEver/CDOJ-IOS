//
//  ArticleListModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ArticleListModel.h"

@implementation ArticleListModel

- (instancetype)init {
    if(self = [super init]) {
        self.requestUrl = API_ARTICLE_LIST;
    }
    return self;
}

- (instancetype)initWithNoticeList {
    if(self = [self init]) {
        self.requestBody = [@{@"currentPage":@"1",@"type":@"0",@"orderFields":@"order",@"orderAsc":@"true"} mutableCopy];
    }
    return self;
}
- (instancetype)initWithBlogListWithUsername:(NSString*)username {
    if(self = [self init]) {
        self.requestBody = [@{@"currentPage":@"1",@"orderFields":@"order",@"orderAsc":@"true"} mutableCopy];
    }
    return self;
}
- (instancetype)initWithCommentListInContest:(NSString*)contestId {
    if(self = [self init]) {
        self.requestBody = [@{@"currentPage":@"1",@"orderFields":@"order",@"orderAsc":@"true"} mutableCopy];
    }
    return self;
}

- (void)fetchDataOnPage:(NSInteger)page {
    [self.requestBody setObject:STRF(@"%ld", (long)page) forKey:@"currentPage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:self.requestUrl parameters:self.requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.hasData = YES;
            self.pageInfo = [responseObject objectForKey:@"pageInfo"];
            [self.list addObjectsFromArray:[responseObject objectForKey:@"list"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NOTICE_LIST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
