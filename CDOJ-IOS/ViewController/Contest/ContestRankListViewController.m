//
//  ContestRankListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestRankListViewController.h"
#import "ContestRankListTableViewCell.h"

@interface ContestRankListViewController ()

@end

@implementation ContestRankListViewController

- (instancetype)initWithContestId:(NSString*)contestId {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[ContestRankListModel alloc] initWithContestId:contestId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_CONTEST_RANKLIST_REFRESHED object:nil];
        [self.tableView.mj_header beginRefreshing];
        self.tableView.mj_footer = nil;
    }
    return self;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ContestRankListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContestRankListTableViewCell* cell = [[ContestRankListTableViewCell alloc] init];
    [cell.username setText:STR([self.data.list[indexPath.row] objectForKey:@"name"])];
    [cell.nickname setText:STR([self.data.list[indexPath.row] objectForKey:@"nickName"])];
    [cell.rank setText:STRF(@"Rank %@", [self.data.list[indexPath.row] objectForKey:@"rank"])];
    [cell.statistics setText:STRF(@"solved/tried: %@/%@", [self.data.list[indexPath.row] objectForKey:@"solved"], [self.data.list[indexPath.row] objectForKey:@"tried"])];
    [cell.penalty setText:STRF(@"Penalty: %@", getTimeLengthString3(STRF(@"%ld", (long)[[self.data.list[indexPath.row] objectForKey:@"penalty"] integerValue] * 1000)))];
    [cell loadAvatarWithUserEmail:STR([self.data.list[indexPath.row] objectForKey:@"email"])];
    [cell loadProblemStatusWithData:[self.data.list[indexPath.row] objectForKey:@"itemList"]];
    return cell;
}

@end
