//
//  ContestListTableViewCell.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestListTableViewCell.h"
#import "Color.h"

@implementation ContestListTableViewCell

/*****************************************************
 * title                                             *
 * startTime                                  length *
 * contestId                       status   typeName *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.contestId = [[UILabel alloc] init];
        self.title = [[UILabel alloc] init];
        self.startTime = [[UILabel alloc] init];
        self.length = [[UILabel alloc] init];
        self.status = [[UILabel alloc] init];
        self.typeName = [[UILabel alloc] init];
        
        [self.startTime setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.length setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.contestId setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.status setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.typeName setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.length setTextAlignment:NSTextAlignmentRight];
        [self.status setTextAlignment:NSTextAlignmentCenter];
        [self.typeName setTextAlignment:NSTextAlignmentCenter];
        
        [self.title setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.startTime setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.length setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.contestId setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.contentView addSubview:self.contestId];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.startTime];
        [self.contentView addSubview:self.length];
        [self.contentView addSubview:self.status];
        [self.contentView addSubview:self.typeName];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@27);
        }];
        [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.length.mas_left);
            make.width.equalTo(self.length.mas_width);
        }];
        [self.length mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.startTime.mas_top);
            make.left.equalTo(self.startTime.mas_right);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(self.startTime.mas_height);
        }];
        [self.contestId mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.startTime.mas_bottom);
            make.height.equalTo(@15);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
        }];
        [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contestId.mas_top);
            make.left.equalTo(self.contestId.mas_right);
            make.height.equalTo(self.contestId.mas_height);
            make.width.equalTo(@60);
        }];
        [self.typeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contestId.mas_top);
            make.left.equalTo(self.status.mas_right).offset(5);
            make.height.equalTo(self.contestId.mas_height);
            make.width.equalTo(@60);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    return self;
}

- (void)refreshTagColor {
    NSDictionary* tagColors = [ColorSchemeModel defaultColorScheme].contestTagColors;
    [self.status setTextColor:[tagColors objectForKey:self.status.text]];
    [self.typeName setTextColor:[tagColors objectForKey:self.typeName.text]];
}

+ (CGFloat)height {
    return 80;
}
@end
