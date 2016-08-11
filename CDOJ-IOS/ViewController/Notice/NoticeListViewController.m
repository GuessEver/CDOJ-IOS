//
//  NoticeListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeListViewController.h"
#import "NoticeListTableViewCell.h"
#import "Time.h"
#import "NoticeSplitDetailViewController.h"

@implementation NoticeListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"公告"];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"#" style:UIBarButtonItemStyleDone target:self action:@selector(skipArticle)];
        self.data = [[NoticeListModel alloc] init];
        [self.data fetchDataOnPage:1];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_NOTICE_LIST_REFRESHED object:nil];
    }
    return self;
}

- (void)refreshList {
//    NSLog(@"%@", self.data.pageInfo);
//    NSLog(@"%@", self.data.list);
    [self.tableView reloadData];
}

- (void)showArticleWithArticleId:(NSString*)aid {
    NoticeSplitDetailViewController* detailView = [[NoticeSplitDetailViewController alloc] initWithArticleId:aid];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}
- (void)skipArticle {
    [Message showInputBoxWithMessage:@"请输入文章/公告编号" title:@"跳转" callback:^(NSString *text) {
        [self showArticleWithArticleId:text];
    }];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NoticeListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showArticleWithArticleId:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"articleId"]]];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeListTableViewCell* cell = [[NoticeListTableViewCell alloc] init];
    [cell.title setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"title"]]];
    [cell.content setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"content"]]];
    [cell.updateTime setText:getTimeString([NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"time"]])];
    [cell.author setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"ownerName"]]];
    return cell;
}

@end
