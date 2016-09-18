//
//  RegisterViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserModel.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStyleGrouped]) {
        [self.tableView setTag:0];
        self.sectionHeaderTitle = @[@"账号信息", @"个人信息"];
        self.sectionFooterTitle = @[@"这些信息将用于您账户登录", @"这些信息将在一些比赛中作为实名验证信息"];
        self.userInfoTitle = [@[
                                [@[@"用户名", @"密码", @"重复密码", @"昵称", @"邮箱", @"座右铭"] mutableCopy],
                                [@[@"真实姓名", @"性别", @"T-Shirt大小", @"电话", @"学校", @"学院", @"年级", @"学号"] mutableCopy]
                                ] mutableCopy];
        self.userInfoKey = [@[
                              [@[@"userName", @"password", @"passwordRepeat", @"nickName", @"email", @"motto"] mutableCopy],
                              [@[@"name", @"sex", @"size", @"phone", @"school", @"departmentId", @"grade", @"studentId"] mutableCopy]
                              ] mutableCopy];
        self.userInfoInput = [[NSMutableArray alloc] init];
        for(NSInteger section = 0; section < self.sectionHeaderTitle.count; section++) {
            NSMutableArray<RegisterTableViewCell*>* currentRow = [[NSMutableArray alloc] init];
            for(NSInteger row = 0; row < self.userInfoKey[section].count; row++) {
                BOOL isPassword = NO;
                if(section == 0 && (row == 1 || row == 2)) { // password || passwordRepeat
                    isPassword = YES;
                }
                RegisterTableViewCell* cell;
                if(section == 1 && row == 1) { // sex
                    cell = [[RegisterTableViewCell alloc] initWithRatioTitle:self.userInfoTitle[section][row]
                                                         withPropertyDataKey:@"sex"];
                }
                else if(section == 1 && row == 2) { // size
                    cell = [[RegisterTableViewCell alloc] initWithRatioTitle:self.userInfoTitle[section][row]
                                                         withPropertyDataKey:@"size"];
                }
                else if(section == 1 && row == 5) { // departmentId
                    cell = [[RegisterTableViewCell alloc] initWithSelectTitle:self.userInfoTitle[section][row]
                                                          withPropertyDataKey:@"department"];
                }
                else if(section == 1 && row == 6) { // grade
                    cell = [[RegisterTableViewCell alloc] initWithSelectTitle:self.userInfoTitle[section][row]
                                                          withPropertyDataKey:@"grade"];
                }
                else {
                    cell = [[RegisterTableViewCell alloc] initWithTitle:self.userInfoTitle[section][row]
                                                            placeholder:self.userInfoKey[section][row]
                                                             isPassword:isPassword];
                }
                [currentRow addObject:cell];
            }
            [self.userInfoInput addObject:currentRow];
        }
        
        
        self.navigationItem.rightBarButtonItems = @[
                                                    [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(submit)]
                                                    ];
        NSDictionary* defaultSetting = @{
                                         @"departmentId": @"1",
                                         @"email": @"",
                                         @"grade": @"3",
                                         @"motto": @"",
                                         @"name": @"",
                                         @"nickName": @"",
                                         @"password": @"",
                                         @"passwordRepeat": @"",
                                         @"phone": @"",
                                         @"school": @"UESTC",
                                         @"sex": @"0",
                                         @"size": @"2",
                                         @"studentId": @"",
                                         @"userName": @""
                                         };
        [self loadData:defaultSetting];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerSucceed:) name:NOTIFICATION_USER_REGISTER_SUCCEED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerFailed:) name:NOTIFICATION_USER_REGISTER_FAILED object:nil];
    }
    return self;
}

- (void)loadData:(NSDictionary*)data {
    for(NSInteger section = 0; section < self.sectionHeaderTitle.count; section++) {
        for(NSInteger row = 0; row < self.userInfoKey[section].count; row++) {
            RegisterTableViewCell* cell = self.userInfoInput[section][row];
            NSString* value = STR([data objectForKey:self.userInfoKey[section][row]]);
            if(!value) continue; // make sure null || nil cannot be set
            if(section == 1 && (row == 1 || row == 2)) { // sex || size <ratio>
                [cell chooseItemWithValue:value];
            }
            else if(section == 1 && (row == 5 || row == 6)) { // departmentId || grade <select>
                [cell selectItemWithValue:value];
            }
            else {
                [cell.inputField setText:value];
                [cell setValue:value];
            }
        }
    }
}

- (NSDictionary*)getUserDict {
    NSMutableDictionary* user = [[NSMutableDictionary alloc] init];
    for(NSInteger section = 0; section < self.userInfoKey.count; section++) {
        for(NSInteger row = 0; row < self.userInfoKey[section].count; row++) {
            [user setObject:self.userInfoInput[section][row].value forKey:self.userInfoKey[section][row]];
        }
    }
//    NSLog(@"%@", user);
    return user;
}
- (void)submit {
    [UserModel userRegisterWithData:[self getUserDict]];
}
- (void)registerSucceed:(NSNotification*)sender {
    [Message show:@"注册成功，请登录！" withTitle:@"注册成功" callback:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)registerFailed:(NSNotification*)sender {
    [Message show:@"注册失败，请检查输入！" withTitle:@"注册失败"];
}

# pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionHeaderTitle[section];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.sectionFooterTitle[section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userInfoTitle[section].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.userInfoInput[indexPath.section][indexPath.row];
}

# pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"select %ld - %ld", (long)indexPath.section, (long)indexPath.row);
    if(tableView.tag == 0) {
        if(indexPath.section == 1 && (indexPath.row == 5 || indexPath.row == 6)) { // departmentId || grade
            self.selectPage = [[DefaultTableViewController alloc] init];
            self.selectPageParentIndexPath = indexPath;
            [self.selectPage.tableView setDataSource:self.userInfoInput[indexPath.section][indexPath.row]];
            [self.selectPage.tableView setTag:1];
            [self.selectPage.tableView setDelegate:self];
            [self.navigationController pushViewController:self.selectPage animated:YES];
            [self.selectPage.tableView reloadData];
        }
    }
    else { // tableView.tag == 1
        [self.userInfoInput[self.selectPageParentIndexPath.section][self.selectPageParentIndexPath.row] selectItem:indexPath.row];
        [self.selectPage.navigationController popViewControllerAnimated:YES];
    }
}

@end
