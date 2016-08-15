//
//  TrainingRatingListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "TrainingRatingListViewController.h"
#import "DefaultTableViewCell.h"
#import "DefaultPageController.h"
#import "TrainingRatingUserListViewController.h"

@implementation TrainingRatingListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[TrainingRatingListModel alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_TRAINING_LIST_REFRESHED object:nil];
        self.tableView.mj_footer = nil;
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TrainingRatingUserListViewController* detail = [[TrainingRatingUserListViewController alloc] initWithTrainingId:[self.data.list[indexPath.row] objectForKey:@"trainingId"]];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DefaultTableViewCell* cell = [[DefaultTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    [cell.textLabel setText:STR([self.data.list[indexPath.row] objectForKey:@"title"])];
    [cell.detailTextLabel setText:STRF(@"#%@", [self.data.list[indexPath.row] objectForKey:@"trainingId"])];
    return cell;
}

@end
