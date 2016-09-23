//
//  StatusListTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "StatusListTableViewCell.h"

@implementation StatusListTableViewCell

/*****************************************************
 * result                                   codeInfo *
 * userName                     timeCost  memoryCost *
 * statusId                               submitTime *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.result = [[UILabel alloc] init];
        self.username = [[UILabel alloc] init];
        self.timeCost = [[UILabel alloc] init];
        self.memoryCost = [[UILabel alloc] init];
        self.codeInfo = [[UILabel alloc] init];
        self.statusId = [[UILabel alloc] init];
        self.submitTime = [[UILabel alloc] init];
        
        [self.username setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.timeCost setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.memoryCost setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.statusId setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.submitTime setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.codeInfo setTextAlignment:NSTextAlignmentRight];
        [self.timeCost setTextAlignment:NSTextAlignmentCenter];
        [self.memoryCost setTextAlignment:NSTextAlignmentCenter];
        [self.submitTime setTextAlignment:NSTextAlignmentRight];
        
        [self.codeInfo setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.username setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.timeCost setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.memoryCost setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.statusId setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.submitTime setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.contentView addSubview:self.result];
        [self.contentView addSubview:self.username];
        [self.contentView addSubview:self.timeCost];
        [self.contentView addSubview:self.memoryCost];
        [self.contentView addSubview:self.codeInfo];
        [self.contentView addSubview:self.statusId];
        [self.contentView addSubview:self.submitTime];
        
        [self.result mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.height.equalTo(@30);
        }];
        [self.codeInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.result.mas_top);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(self.result.mas_width);
            make.height.equalTo(self.result.mas_height);
        }];
        [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.result.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
        }];
        [self.timeCost mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_top);
            make.left.equalTo(self.username.mas_right);
            make.height.equalTo(self.username.mas_height);
            make.width.equalTo(@60);
        }];
        [self.memoryCost mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_top);
            make.left.equalTo(self.timeCost.mas_right).offset(5);
            make.height.equalTo(self.username.mas_height);
            make.width.equalTo(@60);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
        [self.statusId mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.submitTime.mas_left);
            make.width.equalTo(self.submitTime.mas_width);
            make.height.equalTo(@15);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [self.submitTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.statusId.mas_top);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(self.statusId.mas_height);
        }];
    }
    return self;
}

- (void)setResultId:(NSString*)resultId {
    if([resultId isEqualToString:@"0"] || [resultId isEqualToString:@"1"]
       || [resultId isEqualToString:@"16"] || [resultId isEqualToString:@"17"] || [resultId isEqualToString:@"18"]) {
        _resultId = resultId;
    }
    else {
        _resultId = @"-1";
    }    
}

- (void)refreshTagColor {
    NSDictionary* tagColors = [ColorSchemeModel defaultColorScheme].tagColors;
    [self.result setTextColor:[tagColors objectForKey:self.resultId]];
}

+ (CGFloat)height {
    return 80;
}

@end
