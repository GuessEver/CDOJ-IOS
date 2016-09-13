//
//  UserInfoEditViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/13.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTableViewCell.h"
#import "UserModel.h"

@interface UserInfoEditViewController : RegisterViewController

@property (nonatomic, strong) UserModel* user;

@end
