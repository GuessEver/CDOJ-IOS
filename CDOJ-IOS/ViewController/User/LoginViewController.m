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

@implementation LoginViewController

- (instancetype)init {
    if(self = [super init]) {
        [self setModalPresentationStyle:UIModalPresentationFormSheet];
        
        self.avatar = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.avatar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.avatar.layer setCornerRadius:150/2];
        [self.avatar.layer setMasksToBounds:YES];
        [self.view addSubview:self.avatar];
        
        self.usernameInput = [[UITextField alloc] init];
        [self.usernameInput setPlaceholder:@"用户名"];
        [self.usernameInput setBorderStyle:UITextBorderStyleRoundedRect];
        [self.usernameInput setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.usernameInput setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.view addSubview:self.usernameInput];
        [self.usernameInput setDelegate:self];
        
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
        
        [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@150);
            make.height.equalTo(self.avatar.mas_width);
            make.top.equalTo(self.view.mas_top).offset(50);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [self.usernameInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@250);
            make.top.equalTo(self.avatar.mas_bottom).offset(30);
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

#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self.avatar setImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_USER_INFO(self.usernameInput.text) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [self.avatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR([[responseObject objectForKey:@"user"] objectForKey:@"email"], 128)] placeholderImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        }
        else {
            [self.avatar setImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
