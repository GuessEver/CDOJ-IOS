//
//  TrainingRatingUserListTableViewCell.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "TrainingRatingUserListTableViewCell.h"

/*****************************************************
 * name                                              *
 * rank          volatility            currentRating *
 *****************************************************/

@implementation TrainingRatingUserListTableViewCell

- (instancetype)init {
    if(self = [super init]) {
        self.name = [[UILabel alloc] init];
        self.rank = [[UILabel alloc] init];
        self.volatility = [[UILabel alloc] init];
        self.currentRating = [[UILabel alloc] init];
        
        [self.rank setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.volatility setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.currentRating setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        
        [self.volatility setTextAlignment:NSTextAlignmentCenter];
        [self.currentRating setTextAlignment:NSTextAlignmentRight];
        
        [self.name setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.rank setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.currentRating setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.volatility setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.rank];
        [self.contentView addSubview:self.currentRating];
        [self.contentView addSubview:self.volatility];
        
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@30);
        }];
        [self.rank mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.name.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.height.equalTo(@25);
        }];
        [self.volatility mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.rank.mas_top);
            make.left.equalTo(self.rank.mas_right);
            make.height.equalTo(self.rank.mas_height);
            make.width.equalTo(self.rank.mas_width);
        }];
        [self.currentRating mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.rank.mas_top);
            make.left.equalTo(self.volatility.mas_right);
            make.height.equalTo(self.rank.mas_height);
            make.width.equalTo(self.rank.mas_width);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    return self;
}

+ (CGFloat)height {
    return 65;
}

@end
