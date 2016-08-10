//
//  LoginViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "LoginViewController.h"
#import "Security.h"
#import "LocalDataModel.h"

@implementation LoginViewController

- (instancetype)init {
    if(self = [super init]) {
        [self setModalPresentationStyle:UIModalPresentationFormSheet];
        
        self.logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        [self.view addSubview:self.logoView];
        
        self.usernameInput = [[UITextField alloc] init];
        [self.usernameInput setPlaceholder:@"用户名"];
        [self.usernameInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.usernameInput setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.usernameInput setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.view addSubview:self.usernameInput];
        
        self.passwordInput = [[UITextField alloc] init];
        [self.passwordInput setPlaceholder:@"密码"];
        [self.passwordInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.passwordInput setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.passwordInput setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.passwordInput setSecureTextEntry:YES];
        [self.view addSubview:self.passwordInput];
        
        self.loginBtn = [[UIButton alloc] init];
        [self.loginBtn.layer setCornerRadius:5];
        [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [self.loginBtn setBackgroundColor:COLOR_BLUE];
        [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.loginBtn];
        
//        NSDictionary* views = @{@"logo":self.logoView,@"username":self.usernameInput,@"password":self.passwordInput};
//        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[logo(100)]-20-[username]-[password]" options:0 metrics:nil views:views]];
        [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@150);
            make.height.equalTo(self.logoView.mas_width);
            make.top.equalTo(self.view.mas_top).offset(50);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [self.usernameInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@250);
            make.top.equalTo(self.logoView.mas_bottom).offset(30);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [self.passwordInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.usernameInput.mas_width);
            make.top.equalTo(self.usernameInput.mas_bottom).offset(10);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.usernameInput.mas_width);
            make.top.equalTo(self.passwordInput.mas_bottom).offset(10);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }
    return self;
}

- (void)login {
    NSString* username = self.usernameInput.text;
    NSString* password = sha1(self.passwordInput.text);
    [LocalDataModel addUserWithUsername:username andPassword:password];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
