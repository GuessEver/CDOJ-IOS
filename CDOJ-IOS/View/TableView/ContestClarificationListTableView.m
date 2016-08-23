//
//  ContestClarificationListTableView.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestClarificationListTableView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Api.h"

@implementation ContestClarificationListTableView

/*****************************************************
 *  +--------+  username                  submitTime *
 *  | avatar |  content                              *
 *  +--------+                                       *
 *****************************************************/


- (instancetype)init {
    if(self = [super init]) {
        self.avatar = [[UIImageView alloc] init];
        self.username = [[UILabel alloc] init];
        self.submitTime = [[UILabel alloc] init];
        self.content = [[UILabel alloc] init];
        
        [self.avatar.layer setCornerRadius:40/2];
        [self.avatar.layer setMasksToBounds:YES];
        [self.content setNumberOfLines:0];
        
        [self.username setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.submitTime setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.content setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        
        [self.submitTime setTextAlignment:NSTextAlignmentRight];
        
        [self.username setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.submitTime setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.content setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        
        [self.contentView addSubview:self.avatar];
        [self.contentView addSubview:self.username];
        [self.contentView addSubview:self.submitTime];
        [self.contentView addSubview:self.content];
        
        [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.width.equalTo(@40);
            make.height.equalTo(self.avatar.mas_width);
        }];
        [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatar.mas_right).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.width.equalTo(self.submitTime.mas_width);
            make.height.equalTo(@15);
        }];
        [self.submitTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.username.mas_right);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.username.mas_top);
            make.height.equalTo(self.username.mas_height);
        }];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_bottom);
            make.left.equalTo(self.username.mas_left);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
    }
    return self;
}

- (void)loadAvatarWithUserEmail:(NSString*)email {
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR(email, 100)] placeholderImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.avatar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
}

+ (CGFloat)height {
    return 80;
}

@end
