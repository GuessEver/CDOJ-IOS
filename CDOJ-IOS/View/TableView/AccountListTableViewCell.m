//
//  AccountListTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "AccountListTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Api.h"

@implementation AccountListTableViewCell

/*****************************************************
 *  +--------+                                       *
 *  | avatar |  username                  isDefault  *
 *  +--------+                                       *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        self.username = [[UILabel alloc] init];
        self.tip = [[UILabel alloc] init];
        self.email = @"";
        self.isDefault = NO;
        self.isAdd = NO;
        
        [self.avatar.layer setCornerRadius:25];
        [self.tip setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        
        [self.tip setTextColor:COLOR_COMMENT];
        
        [self.avatar setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.username setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.tip setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self.tip setTextAlignment:NSTextAlignmentRight];
        
        [self.contentView addSubview:self.avatar];
        [self.contentView addSubview:self.username];
        [self.contentView addSubview:self.tip];
        
        [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@50);
            make.width.equalTo(self.avatar.mas_height);
            make.top.equalTo(self.contentView.mas_top).offset(15);
            make.left.equalTo(self.contentView.mas_left).offset(20);
        }];
        [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.avatar.mas_height);
            make.top.equalTo(self.avatar.mas_top);
            make.left.equalTo(self.avatar.mas_right).offset(20);
            make.right.equalTo(self.tip.mas_left).offset(-10);
        }];
        [self.tip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.avatar.mas_height);
            make.top.equalTo(self.avatar.mas_top);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    return self;
}

- (void)reloadData {
    if(self.isAdd) {
        [self.tip setText:@"添加新用户"];
        [self.avatar setImage:[[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.avatar setTintColor:COLOR_TITLE];
    }
    else {
        if(self.isDefault) {
            [self.tip setText:@"当前登录用户"];
        }
        [self.avatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR(self.email, 100)] placeholderImage:[UIImage imageNamed:@"logo"]];
    }
}

+ (CGFloat)height {
    return 80;
}
@end
