//
//  AccountManageViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "AccountManageViewController.h"
#import "LocalDataModel.h"
#import "UserModel.h"
#import "LoginViewController.h"

@implementation AccountManageViewController

- (instancetype)init {
    if(self = [super init]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData)];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_USER_LIST_REFRESHED object:nil];
        [self refreshData];
    }
    return self;
}

- (void)refreshData {
    self.users = [LocalDataModel getAllLocalUsers];
    self.defaultUsername = [LocalDataModel getDefaultUsername];
    NSLog(@"de: %@", self.defaultUsername);
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == self.users.count) { // add button
        [self presentViewController:[[LoginViewController alloc] init] animated:YES completion:nil];
    }
    else {
//        [LocalDataModel setDefaultUsername:[self.users[indexPath.row] objectForKey:@"username"]];
        [UserModel userLoginWithUser:self.users[indexPath.row]];
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
        [cell.detailTextLabel setText:@"添加新用户"];
    }
    else {
        NSDictionary* user = [LocalDataModel getUserAtIndex:indexPath.row];
        [cell.textLabel setText:[user objectForKey:@"username"]];
        if([[user objectForKey:@"username"] isEqualToString:self.defaultUsername]) {
            [cell.detailTextLabel setText:@"当前登录"];
        }
    }
    return cell;
}

@end
