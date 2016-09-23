//
//  UserMessageListTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserMessageListTableViewCell.h"
#import "Api.h"

@implementation UserMessageListTableViewCell

/*****************************************************
 *  +---------+ +---------+  sender -> receiver      *  30
 *  | avatarA | | avatarB |  content                 *  25
 *  +---------+ +---------+  time                    *  15
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.senderAvatar = [[UIImageView alloc] init];
        self.receiverAvatar = [[UIImageView alloc] init];
        self.senderUsername = [[UILabel alloc] init];
        self.receiverUsername = [[UILabel alloc] init];
        self.content = [[UILabel alloc] init];
        self.time = [[UILabel alloc] init];
        self.connectArrow = [[UILabel alloc] init];
        
        [self.senderAvatar.layer setCornerRadius:40/2];
        [self.senderAvatar.layer setMasksToBounds:YES];
        [self.receiverAvatar.layer setCornerRadius:40/2];
        [self.receiverAvatar.layer setMasksToBounds:YES];
        
        [self.senderUsername setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.receiverUsername setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.connectArrow setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.time setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.senderUsername setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.receiverUsername setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.connectArrow setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.content setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.time setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.connectArrow setText:@"->"];
        
        [self.contentView addSubview:self.senderAvatar];
        [self.contentView addSubview:self.senderUsername];
        [self.contentView addSubview:self.receiverAvatar];
        [self.contentView addSubview:self.receiverUsername];
        [self.contentView addSubview:self.connectArrow];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.time];
        
        [self.senderAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.width.equalTo(@40);
            make.height.equalTo(self.senderAvatar.mas_width);
        }];
        [self.receiverAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.senderAvatar.mas_right).offset(20);
            make.top.equalTo(self.senderAvatar.mas_top);
            make.width.equalTo(@40);
            make.height.equalTo(self.receiverAvatar.mas_width);
        }];
        [self.senderUsername mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.receiverAvatar.mas_right).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.height.equalTo(@25);
        }];
        [self.connectArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.senderUsername.mas_right).offset(10);
            make.top.equalTo(self.senderUsername.mas_top);
            make.height.equalTo(self.senderUsername.mas_height);
        }];
        [self.receiverUsername mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.connectArrow.mas_right).offset(10);
            make.top.equalTo(self.senderUsername.mas_top);
            make.height.equalTo(self.senderUsername.mas_height);
        }];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.senderUsername.mas_bottom);
            make.left.equalTo(self.senderUsername.mas_left);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@30);
        }];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.content.mas_bottom);
            make.left.equalTo(self.content.mas_left);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
    }
    return self;
}

- (void)loadAvatar {
    [self.senderAvatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR(self.senderEmail, 100)] placeholderImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.senderAvatar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
    [self.receiverAvatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR(self.receiverEmail, 100)] placeholderImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.receiverAvatar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
}

+ (CGFloat)height {
    return 80;
}

@end
