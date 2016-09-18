//
//  UserInfoEditViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/13.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserInfoEditViewController.h"
#import "LocalDataModel.h"

@interface UserInfoEditViewController ()

@end

@implementation UserInfoEditViewController

- (instancetype)init {
    if(self = [super init]) {
        self.userInfoTitle[0][0] = @"原密码";
        self.userInfoTitle[0][1] = @"新密码";
        self.userInfoTitle[0][2] = @"重复新密码";
        self.userInfoKey[0][0] = @"oldPassword";
        self.userInfoKey[0][1] = @"不修改则留空";
        self.userInfoKey[0][2] = @"newPasswordRepeat";
        for(NSInteger section = 0; section < 1; section++) {
            for(NSInteger row = 0; row < 3; row++) {
                self.userInfoInput[section][row] = [[RegisterTableViewCell alloc] initWithTitle:self.userInfoTitle[section][row]
                                                                                    placeholder:self.userInfoKey[section][row]
                                                                                     isPassword:YES];
            }
        }
        [self.tableView reloadData];
        
        self.navigationItem.rightBarButtonItems = @[
                                                    [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(submit)]
                                                    ];
        self.user = [[UserModel alloc] init];
        [self.user setUsername:[LocalDataModel getDefaultUsername]];
        [self.user fetchBasicData];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDataLoaded) name:NOTIFICATION_USER_BASIC_REFRESHED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifySucceed:) name:NOTIFICATION_USER_MODIFY_SUCCEED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyFailed:) name:NOTIFICATION_USER_MODIFY_FAILED object:nil];
    }
    return self;
}

- (void)userDataLoaded {
    [self loadData:self.user.basicInfo];
}

- (void)submit {
    NSMutableDictionary* user = [[self getUserDict] mutableCopy];
    if([[user objectForKey:@"newPassword"] isEqualToString:@""] || [[user objectForKey:@"newPassword"] isEqualToString:sha1(@"")]) {
        [user setObject:[user objectForKey:@"oldPassword"] forKey:@"newPassword"];
        [user setObject:[user objectForKey:@"oldPassword"] forKey:@"newPasswordRepeat"];
    }
    [user setObject:self.user.username forKey:@"userName"];
    NSLog(@"%@", user);
    [UserModel userModifyWithData:user];
}
- (void)modifySucceed:(NSNotification*)sender {
    [Message show:@"修改个人信息成功" withTitle:@"修改成功" callback:^{
        [UserModel userLoginWithDefaultUser];
    }];
}
- (void)modifyFailed:(NSNotification*)sender {
    [Message show:@"修改个人信息失败，请检查输入！" withTitle:@"修改失败"];
}

@end
