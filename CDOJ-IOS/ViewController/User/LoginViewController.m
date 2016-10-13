//
//  LoginViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "LoginViewController.h"
#import "Security.h"
#import "UserModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RegisterViewController.h"

@implementation LoginViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.content = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        self.avatar = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.avatar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.avatar.layer setCornerRadius:150/2];
        [self.avatar.layer setMasksToBounds:YES];
        [self.content addSubview:self.avatar];
        
        self.usernameInput = [[UITextField alloc] init];
        [self.usernameInput setPlaceholder:@"用户名"];
        [self.usernameInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.usernameInput setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.usernameInput setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.content addSubview:self.usernameInput];
        [self.usernameInput setDelegate:self];
        
        self.passwordInput = [[UITextField alloc] init];
        [self.passwordInput setPlaceholder:@"密码"];
        [self.passwordInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.passwordInput setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.passwordInput setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.passwordInput setSecureTextEntry:YES];
        [self.content addSubview:self.passwordInput];
        
        self.loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.loginBtn.layer setCornerRadius:5];
        [self.loginBtn.layer setMasksToBounds:YES];
        [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [self.loginBtn setTitleColor:[ColorSchemeModel defaultColorScheme].backgroundColor1 forState:UIControlStateNormal];
        [self.loginBtn setBackgroundColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [self.content addSubview:self.loginBtn];
        
        self.registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.registerBtn.layer setCornerRadius:5];
        [self.registerBtn.layer setMasksToBounds:YES];
        [self.registerBtn setTitle:@"还没账号？点此注册" forState:UIControlStateNormal];
        [self.registerBtn setTitleColor:[ColorSchemeModel defaultColorScheme].tintColor forState:UIControlStateNormal];
        [self.registerBtn addTarget:self action:@selector(openRegisterPage) forControlEvents:UIControlEventTouchUpInside];
        [self.content addSubview:self.registerBtn];
        
        [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@150);
            make.height.equalTo(self.avatar.mas_width);
            make.top.equalTo(self.content.mas_top).offset(50);
            make.centerX.equalTo(self.content.mas_centerX);
        }];
        [self.usernameInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@250);
            make.top.equalTo(self.avatar.mas_bottom).offset(30);
            make.centerX.equalTo(self.content.mas_centerX);
        }];
        [self.passwordInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.usernameInput.mas_width);
            make.top.equalTo(self.usernameInput.mas_bottom).offset(10);
            make.centerX.equalTo(self.content.mas_centerX);
        }];
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.usernameInput.mas_width);
            make.top.equalTo(self.passwordInput.mas_bottom).offset(10);
            make.centerX.equalTo(self.content.mas_centerX);
        }];
        [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.loginBtn.mas_width);
            make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
            make.centerX.equalTo(self.content.mas_centerX);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSucceed) name:NOTIFICATION_USER_SIGN_IN object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginFailed) name:NOTIFICATION_USER_SIGN_OUT object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadAvatar) name:NOTIFICATION_USER_INFO_REFRESHED object:nil];
    }
    return self;
}

- (void)openRegisterPage {
    RegisterViewController* registerPage = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerPage animated:YES];
}

- (void)login {
    NSDictionary* user = @{
                           @"username": self.usernameInput.text,
                           @"password": sha1(self.passwordInput.text)
                           };
    [UserModel userLoginWithUser:user];
}
- (void)cancel {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)loginSucceed {
    [self cancel];
}
- (void)loginFailed {
    [Message show:@"用户名与密码不匹配，请重新输入！" withTitle:@"登录失败"];
}

- (void)reloadAvatar {
    if([self.user.basicInfo objectForKey:@"email"]) {
        [self.avatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR([self.user.basicInfo objectForKey:@"email"], 128)] placeholderImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    }
    else {
        [self.avatar setImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    }
}

#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self.avatar setImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.user = [[UserModel alloc] init];
    if([self.usernameInput.text isEqualToString:@""]) {
        [self reloadAvatar];
    }
    else {
        [self.user setUsername:self.usernameInput.text];
        [self.user fetchInfoData];
    }
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.content;
}

@end
