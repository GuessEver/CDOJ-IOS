//
//  UserBlogListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserBlogListViewController.h"
#import "LocalDataModel.h"
#import "ArticleListTableViewCell.h"
#import "ArticleContentViewController.h"

@interface UserBlogListViewController ()

@end

@implementation UserBlogListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[ArticleListModel alloc] initWithBlogListWithUsername:[LocalDataModel getDefaultUsername]];
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
    [cell.content setText:convertToBriefContent(STR([self.data.list[indexPath.row] objectForKey:@"content"]))];
    [cell.updateTime setText:getTimeString(STR([self.data.list[indexPath.row] objectForKey:@"time"]))];
    [cell.author setText:STR([self.data.list[indexPath.row] objectForKey:@"ownerName"])];
    return cell;
}

@end
