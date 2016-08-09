//
//  AccountManageViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "AccountManageViewController.h"
#import "LocalDataModel.h"

@implementation AccountManageViewController

- (instancetype)init {
    if(self = [super init]) {
        [self refreshData];
    }
    return self;
}

- (void)refreshData {
    self.users = [LocalDataModel getAllLocalUsers];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == self.users.count) { // add button
    }
    else {
    }
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    if(indexPath.row == self.users.count) { // add button
        [cell.textLabel setText:@"+ ADD"];
        [cell.detailTextLabel setText:@"new user"];
    }
    else {
        NSDictionary* user = [LocalDataModel getUserAtIndex:indexPath.row];
        [cell.textLabel setText:[user objectForKey:@"username"]];
    }
    return cell;
}

@end
