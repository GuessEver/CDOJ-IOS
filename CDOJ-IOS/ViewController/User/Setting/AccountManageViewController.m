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
#import "AccountListTableViewCell.h"
#import "DefaultNavigationController.h"

@implementation AccountManageViewController

- (instancetype)init {
    if(self = [super init]) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self loadRightBarButtonItems];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_USER_LIST_REFRESHED object:nil];
        [self refreshData];
    }
    return self;
}
- (void)loadRightBarButtonItems {
    if(self.tableView.isEditing) {
        self.navigationItem.rightBarButtonItems = @[
                                                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(changeTableViewEditingStatus)]
                                                    ];
    }
    else {
        self.navigationItem.rightBarButtonItems = @[
                                                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData)],
                                                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(changeTableViewEditingStatus)]
                                                ];
    }
}

- (void)changeTableViewEditingStatus {
    [self.tableView setEditing:!self.tableView.isEditing];
    [self loadRightBarButtonItems];
}

- (void)refreshData {
    self.users = [NSMutableArray arrayWithArray:[LocalDataModel getAllLocalUsers]];
    self.defaultUsername = [LocalDataModel getDefaultUsername];
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AccountListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == self.users.count) { // add button
        [self presentViewController:[[DefaultNavigationController alloc] initWithCancelButtonOnLeftAndRootViewController:[[LoginViewController alloc] init]] animated:YES completion:nil];
//        [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
    }
    else {
//        [LocalDataModel setDefaultUsername:[self.users[indexPath.row] objectForKey:@"username"]];
        [UserModel userLoginWithUser:self.users[indexPath.row]];
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == self.users.count) { // add button
        return NO;
    }
    else {
        return YES;
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableView.editing) {
        return UITableViewCellEditingStyleDelete;
    }
    else {
        return UITableViewCellEditingStyleNone;
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // editingStyle == UITableViewCellEditingStyleDelete
    NSString* username = [self.users[indexPath.row] objectForKey:@"username"];
    [LocalDataModel deleteUserByUsername:username];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountListTableViewCell* cell = [[AccountListTableViewCell alloc] init];
    if(indexPath.row == self.users.count) { // add button
        [cell setIsAdd:YES];
    }
    else {
        NSDictionary* user = [LocalDataModel getUserAtIndex:indexPath.row];
        [cell.username setText:[user objectForKey:@"username"]];
        [cell setEmail:[user objectForKey:@"email"]];
        if([[user objectForKey:@"username"] isEqualToString:self.defaultUsername]) {
            [cell setIsDefault:YES];
        }
    }
    [cell reloadData];
    return cell;
}

@end
