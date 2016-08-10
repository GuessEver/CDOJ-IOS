//
//  LoginViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"

@interface LoginViewController : DefaultViewController

@property (nonatomic, strong) UIImageView* logoView;
@property (nonatomic, strong) UITextField* usernameInput;
@property (nonatomic, strong) UITextField* passwordInput;
@property (nonatomic, strong) UIButton* loginBtn;

@end
