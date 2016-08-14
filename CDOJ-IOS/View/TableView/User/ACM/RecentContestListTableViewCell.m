//
//  RecentContestListTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "RecentContestListTableViewCell.h"

@implementation RecentContestListTableViewCell

/*****************************************************
 * name                                              *
 * startTime                                      oj *
 * dayOfWeek                                  access *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        self.name = [[UILabel alloc] init];
        self.startTime = [[UILabel alloc] init];
        self.oj = [[UILabel alloc] init];
        self.dayOfWeek = [[UILabel alloc] init];
        self.access = [[UILabel alloc] init];
        
        [self.startTime setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.oj setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.dayOfWeek setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.access setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.oj setTextAlignment:NSTextAlignmentRight];
        [self.access setTextAlignment:NSTextAlignmentCenter];
        
        [self.name setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.startTime setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.oj setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.dayOfWeek setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.startTime];
        [self.contentView addSubview:self.oj];
        [self.contentView addSubview:self.dayOfWeek];
        [self.contentView addSubview:self.access];
        
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@30);
        }];
        [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.name.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.oj.mas_left);
            make.width.equalTo(self.oj.mas_width);
        }];
        [self.oj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.startTime.mas_top);
            make.left.equalTo(self.startTime.mas_right);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(self.startTime.mas_height);
        }];
        [self.dayOfWeek mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.startTime.mas_bottom);
            make.height.equalTo(@15);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
        }];
        [self.access mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.dayOfWeek.mas_top);
            make.left.equalTo(self.dayOfWeek.mas_right).offset(5);
            make.height.equalTo(self.dayOfWeek.mas_height);
            make.width.equalTo(@60);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    return self;
}

- (void)refreshTagColor {
    NSDictionary* tagColors = [ColorSchemeModel defaultColorScheme].contestTagColors;
    [self.access setTextColor:[tagColors objectForKey:self.access.text]];
}

+ (CGFloat)height {
    return 80;
}

@end
