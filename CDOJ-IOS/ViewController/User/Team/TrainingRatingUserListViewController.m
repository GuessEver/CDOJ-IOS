//
//  TrainingRatingUserListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "TrainingRatingUserListViewController.h"
#import "String.h"
#import "TrainingRatingUserListTableViewCell.h"

@implementation TrainingRatingUserListViewController

- (instancetype)initWithTrainingId:(NSString*)trainingId {
    if(self = [super init]) {
        self.data = [[TrainingRatingContentModel alloc] initWithTrainingId:trainingId];
        [self.data fetchUsers];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_TRAINING_USER_REFRESHED object:nil];
    }
    return self;
}

- (void)refreshData {
    [self.tableView reloadData];
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TrainingRatingUserListTableViewCell height];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.users.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrainingRatingUserListTableViewCell* cell = [[TrainingRatingUserListTableViewCell alloc] init];
    [cell.name setText:STR([self.data.users[indexPath.row] objectForKey:@"trainingUserName"])];
    [cell.rank setText:STRF(@"Rank %@", [self.data.users[indexPath.row] objectForKey:@"rank"])];
    [cell.currentRating setText:STRF(@"当前Rating: %.0f", [[self.data.users[indexPath.row] objectForKey:@"currentRating"] doubleValue])];
    [cell.volatility setText:STRF(@"Volatility: %.0f", [[self.data.users[indexPath.row] objectForKey:@"currentVolatility"] doubleValue])];
    return cell;
}

@end
