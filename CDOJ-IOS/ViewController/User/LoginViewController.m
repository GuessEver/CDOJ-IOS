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

@implementation LoginViewController

- (instancetype)init {
    if(self = [super init]) {
        [self setModalPresentationStyle:UIModalPresentationFormSheet];
        
        self.logoView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.logoView setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
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
        [self.loginBtn.layer setMasksToBounds:YES];
        [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [self.loginBtn setBackgroundColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.loginBtn];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.cancelBtn.layer setCornerRadius:5];
        [self.cancelBtn.layer setMasksToBounds:YES];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.cancelBtn];
        
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
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.usernameInput.mas_width);
            make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSucceed) name:NOTIFICATION_USER_SIGN_IN object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginFailed) name:NOTIFICATION_USER_SIGN_OUT object:nil];
    }
    return self;
}

- (void)login {
    NSDictionary* user = @{
                           @"username": self.usernameInput.text,
                           @"password": sha1(self.passwordInput.text)
                           };
    [UserModel userLoginWithUser:user];
}
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)loginSucceed {
    [self cancel];
}
- (void)loginFailed {
    [Message show:@"用户名与密码不匹配，请重新输入！" withTitle:@"登录失败"];
}

@end
