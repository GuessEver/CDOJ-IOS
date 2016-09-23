//
//  ContestRankListTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestRankListTableViewCell.h"
#import "Api.h"
#import <SDWebImage/UIImageView+WebCache.h>

/*****************************************************
 *  +--------+  username                   | rank |  *
 *  | avatar |  nickname                   +------+  *
 *  +--------+              statistics       penalty *
 * problemStatus                                     *
 *****************************************************/

@implementation ContestRankListTableViewCell

- (instancetype)init {
    if(self = [super init]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        self.avatar = [[UIImageView alloc] init];
        self.username = [[UILabel alloc] init];
        self.nickname = [[UILabel alloc] init];
        self.rank = [[UILabel alloc] init];
        self.statistics = [[UILabel alloc] init];
        self.penalty = [[UILabel alloc] init];
        self.problemStatus = [[UIView alloc] init];
        
        [self.avatar.layer setCornerRadius:40/2];
        [self.avatar.layer setMasksToBounds:YES];
        
        [self.nickname setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.statistics setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.penalty setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.rank setTextAlignment:NSTextAlignmentRight];
        [self.statistics setTextAlignment:NSTextAlignmentRight];
        [self.penalty setTextAlignment:NSTextAlignmentRight];
        
        [self.username setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.nickname setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.rank setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.statistics setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.penalty setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.contentView addSubview:self.avatar];
        [self.contentView addSubview:self.username];
        [self.contentView addSubview:self.nickname];
        [self.contentView addSubview:self.rank];
        [self.contentView addSubview:self.statistics];
        [self.contentView addSubview:self.penalty];
        [self.contentView addSubview:self.problemStatus];
        
        [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.width.equalTo(@40);
            make.height.equalTo(self.avatar.mas_width);
        }];
        [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatar.mas_right).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.height.equalTo(@30);
        }];
        [self.nickname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_bottom);
            make.left.equalTo(self.username.mas_left);
            make.width.equalTo(self.username.mas_width);
        }];
        [self.rank mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_top);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(self.username.mas_width);
            make.bottom.equalTo(self.statistics.mas_top);
        }];
        [self.statistics mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nickname.mas_bottom);
            make.height.equalTo(@15);
            make.left.equalTo(self.avatar.mas_right).offset(20);
        }];
        [self.penalty mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.statistics.mas_top);
            make.left.equalTo(self.statistics.mas_right);
            make.width.equalTo(self.statistics.mas_width);
            make.height.equalTo(self.statistics.mas_height);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
        [self.problemStatus mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.statistics.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@15);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
    }
    return self;
}

- (void)loadAvatarWithUserEmail:(NSString*)email {
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:API_AVATAR(email, 100)] placeholderImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.avatar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
}
- (void)loadProblemStatusWithData:(NSArray<NSDictionary*>*)problems {
    self.problems = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i < problems.count; i++) {
        [self.problems addObject:[[UILabel alloc] init]];
        [self.problems[i] setText:STRF(@"%c", (char)('A' + i))];
        [self.problems[i] setTextAlignment:NSTextAlignmentCenter];
        [self.problems[i] setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        if([[problems[i] objectForKey:@"firstBlood"] boolValue]) {
            [self.problems[i] setBackgroundColor:[[ColorSchemeModel defaultColorScheme].tagColors objectForKey:@"firstBlood"]];
        }
        else if([[problems[i] objectForKey:@"solved"] boolValue]) {
            [self.problems[i] setBackgroundColor:[[ColorSchemeModel defaultColorScheme].tagColors objectForKey:@"solved"]];
        }
        else if([[problems[i] objectForKey:@"tried"] integerValue] > 0) {
            [self.problems[i] setBackgroundColor:[[ColorSchemeModel defaultColorScheme].tagColors objectForKey:@"tried"]];
        }
        [self.problemStatus addSubview:self.problems[i]];
        [self.problems[i] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.problemStatus.mas_top);
            if(i == 0) {
                make.left.equalTo(self.problemStatus.mas_left);
            }
            else {
                make.left.equalTo(self.problems[i-1].mas_right).offset(5);
            }
            make.width.equalTo(self.problems[i].mas_height);
            make.bottom.equalTo(self.problemStatus.mas_bottom);
        }];
    }
}

+ (CGFloat)height {
    return 95;
}

@end
