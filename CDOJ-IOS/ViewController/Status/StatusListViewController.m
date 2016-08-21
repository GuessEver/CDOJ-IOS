//
//  StatusListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "StatusListViewController.h"
#import "StatusListTableViewCell.h"
#import "StatusContentViewController.h"

@interface StatusListViewController ()

@end

@implementation StatusListViewController

- (instancetype)initWithProblemId:(NSString*)problemId {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[StatusListModel alloc] initWithProblemId:problemId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_STATUS_LIST_REFRESHED object:nil];
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}
- (instancetype)initWithContestId:(NSString*)contestId {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[StatusListModel alloc] initWithContestId:contestId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_STATUS_LIST_REFRESHED object:nil];
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [StatusListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusContentViewController* codePage = [[StatusContentViewController alloc] initWithStatusId:STR([self.data.list[indexPath.row] objectForKey:@"statusId"]) andLanguageSuffix:STR([self.data.list[indexPath.row] objectForKey:@"language"])];
    [self.navigationController pushViewController:codePage animated:YES];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusListTableViewCell* cell = [[StatusListTableViewCell alloc] init];
    [cell setResultId:STR([self.data.list[indexPath.row] objectForKey:@"returnTypeId"])];
    [cell.result setText:STR([self.data.list[indexPath.row] objectForKey:@"returnType"])];
    [cell.username setText:STR([self.data.list[indexPath.row] objectForKey:@"userName"])];
    if([STR([self.data.list[indexPath.row] objectForKey:@"returnTypeId"]) isEqualToString:@"1"]) {
        [cell.timeCost setText:STRF(@"%@MS", [self.data.list[indexPath.row] objectForKey:@"timeCost"])];
        [cell.memoryCost setText:STRF(@"%@KB", [self.data.list[indexPath.row] objectForKey:@"memoryCost"])];
    }
    [cell.codeInfo setText:STRF(@"%@ - %@B", [self.data.list[indexPath.row] objectForKey:@"language"], [self.data.list[indexPath.row] objectForKey:@"length"])];
    [cell.statusId setText:STRF(@"#%@", [self.data.list[indexPath.row] objectForKey:@"statusId"])];
    [cell.submitTime setText:getTimeString(STR([self.data.list[indexPath.row] objectForKey:@"time"]))];
    [cell refreshTagColor];
    return cell;
}

@end
