//
//  ContestListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestListViewController.h"
#import "ContestListTableViewCell.h"
#import "ContestSplitDetailViewController.h"
#import "Time.h"

@implementation ContestListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"比赛"];
        self.data = [[ContestListModel alloc] init];
        [self.data fetchDataOnPage:1];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_CONTEST_LIST_REFRESHED object:nil];
    }
    return self;
}

- (void)refreshList {
    //    NSLog(@"%@", self.data.pageInfo);
    //    NSLog(@"%@", self.data.list);
    [self.tableView reloadData];
}


- (void)enterContest:(NSString*)cid withType:(NSInteger)type {
    if(type == 0) { // Public
        [self loadContest:cid];
    }
    else if(type == 1) { // Private
        [Message showInputBoxWithMessage:@"" title:@"请输入密码" callback:^(NSString *text) {
            NSDictionary* requestBody = @{@"contestId":cid, @"password":sha1(text)};
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
            [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
            [manager POST:API_CONTEST_LOGIN parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
                    [self loadContest:cid];
                }
                else {
                    [self enterContest:cid withType:type];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            }];
        }];
    }
    else if(type == 3) { // Invited
        NSDictionary* requestBody = @{@"contestId":cid, @"password":sha1(@"")};
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [manager POST:API_CONTEST_LOGIN parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
                [self loadContest:cid];
            }
            else {
                [Message show:[NSString stringWithFormat:@"%@\n工程师暂时不想做，请去网页版，谢谢！", [responseObject objectForKey:@"error_msg"]] withTitle:@"Opps!"];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];
    }
    else if(type == 5) { // Onsite
        [[AFHTTPSessionManager manager] GET:API_CONTEST_DATA(cid) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
                [self loadContest:cid];
            }
            else {
                [Message show:[NSString stringWithFormat:@"%@", [responseObject objectForKey:@"error_msg"]] withTitle:@"Opps!"];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];
    }
    else { // 2 - DIY, 4 - Inherit
        [Message show:[NSString stringWithFormat:@"Type-%ld of contest-%@ cannot be found!", (long)type, cid] withTitle:@"Error!"];
    }
}
- (void)loadContest:(NSString*)cid {
    ContestSplitDetailViewController* detailView = [[ContestSplitDetailViewController alloc] initWithContestId:cid];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ContestListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cid = [NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"contestId"]];
    NSInteger type = [[self.data.list[indexPath.row] objectForKey:@"type"] integerValue];
    [self enterContest:cid withType:type];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContestListTableViewCell* cell = [[ContestListTableViewCell alloc] init];
    [cell.cid setText:[NSString stringWithFormat:@"#%@", [self.data.list[indexPath.row] objectForKey:@"contestId"]]];
    [cell.title setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"title"]]];
    [cell.startTime setText:getTimeString([NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"time"]])];
    [cell.length setText:getTimeLengthString2([NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"length"]])];
    [cell.status setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"status"]]];
    [cell.typeName setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"typeName"]]];
    [cell refreshTagColor];
    return cell;
}

@end
