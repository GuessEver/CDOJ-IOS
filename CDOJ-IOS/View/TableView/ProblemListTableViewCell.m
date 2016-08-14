//
//  ProblemListTableViewCell.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemListTableViewCell.h"
@implementation ProblemListTableViewCell

/*****************************************************
 * title                                             *
 * source                                            *
 * problemId                            solved/tried *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.problemId = [[UILabel alloc] init];
        self.title = [[UILabel alloc] init];
        self.source = [[UILabel alloc] init];
        self.statistics = [[UILabel alloc] init];
        
        [self.problemId setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.source setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.statistics setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.statistics setTextAlignment:NSTextAlignmentRight];
        
        [self.problemId setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.title setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.source setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.statistics setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.contentView addSubview:self.problemId];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.source];
        [self.contentView addSubview:self.statistics];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@30);
        }];
        [self.source mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
        [self.problemId mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.source.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.height.equalTo(@15);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.width.equalTo(self.statistics.mas_width);
        }];
        [self.statistics mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.problemId.mas_top);
            make.height.equalTo(self.problemId.mas_height);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(self.problemId.mas_height);
        }];
    }
    return self;
}

+ (CGFloat)height {
    return 80;
}

@end
