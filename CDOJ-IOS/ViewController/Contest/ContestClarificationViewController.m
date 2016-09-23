//
//  ContestClarificationViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestClarificationViewController.h"
#import "ArticleContentViewController.h"
#import "ContestClarificationListTableView.h"

@interface ContestClarificationViewController ()

@end

@implementation ContestClarificationViewController

- (instancetype)initWithContestId:(NSString*)contestId {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[ArticleListModel alloc] initWithCommentListInContest:contestId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_ARTICLE_LIST_REFRESHED object:nil];
        // refresh data when entering
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

- (void)showArticleWithArticleId:(NSString*)articleId {
    ArticleContentViewController* article = [[ArticleContentViewController alloc] initWithArticleId:articleId];
    [self.navigationController pushViewController:article animated:YES];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ContestClarificationListTableView height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showArticleWithArticleId:STR([self.data.list[indexPath.row] objectForKey:@"articleId"])];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContestClarificationListTableView* cell = [[ContestClarificationListTableView alloc] init];
    [cell.username setText:STR([self.data.list[indexPath.row] objectForKey:@"ownerName"])];
    [cell.submitTime setText:getTimeString(STR([self.data.list[indexPath.row] objectForKey:@"time"]))];
    [cell.content setText:convertToBriefContent(STR([self.data.list[indexPath.row] objectForKey:@"content"]))];
    [cell loadAvatarWithUserEmail:STR([self.data.list[indexPath.row] objectForKey:@"ownerEmail"])];
    return cell;
}

@end
