//
//  NoticeListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeListViewController.h"
#import "ArticleListTableViewCell.h"
#import "Time.h"
#import "NoticeSplitDetailViewController.h"

@implementation NoticeListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"公告"];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"#" style:UIBarButtonItemStyleDone target:self action:@selector(skipArticle)];
        self.data = [[ArticleListModel alloc] initWithNoticeList];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_ARTICLE_LIST_REFRESHED object:nil];
        // refresh data when entering
        [self.tableView.mj_header beginRefreshing];
        
        // skip in app
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changePage:) name:NOTIFICATION_SKIP_NOTICE object:nil];
    }
    return self;
}

- (void)showArticleWithArticleId:(NSString*)articleId {
    NoticeSplitDetailViewController* detailView = [[NoticeSplitDetailViewController alloc] initWithArticleId:articleId];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}
- (void)skipArticle {
    [Message showInputBoxWithPassword:NO message:@"请输入文章/公告编号" title:@"跳转" callback:^(NSString *text) {
//        [self showArticleWithArticleId:text];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SKIP_NOTICE object:nil userInfo:@{@"articleId":text}];
    }];
}

#pragma mark skip in app {articleId}
- (void)changePage:(NSNotification*)sender {
    [self showArticleWithArticleId:[sender.userInfo objectForKey:@"articleId"]];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ArticleListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showArticleWithArticleId:STR([self.data.list[indexPath.row] objectForKey:@"articleId"])];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleListTableViewCell* cell = [[ArticleListTableViewCell alloc] init];
    [cell.title setText:STR([self.data.list[indexPath.row] objectForKey:@"title"])];
    [cell.content setText:STR([self.data.list[indexPath.row] objectForKey:@"content"])];
    [cell.updateTime setText:getTimeString(STR([self.data.list[indexPath.row] objectForKey:@"time"]))];
    [cell.author setText:STR([self.data.list[indexPath.row] objectForKey:@"ownerName"])];
    return cell;
}

@end
