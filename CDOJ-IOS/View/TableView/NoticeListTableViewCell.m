//
//  NoticeListTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeListTableViewCell.h"

@implementation NoticeListTableViewCell

/*****************************************************
 * title                                             *
 * contet                                            *
 * updateTime                                 author *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.title = [[UILabel alloc] init];
        self.content = [[UILabel alloc] init];
        self.updateTime = [[UILabel alloc] init];
        self.author = [[UILabel alloc] init];
        
//        [self.title setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        [self.content setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.updateTime setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.author setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.author setTextAlignment:NSTextAlignmentRight];
        
        [self.title setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.content setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.updateTime setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.author setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
// Just for test here
//        [self.title setBackgroundColor:[UIColor purpleColor]];
//        [self.content setBackgroundColor:[UIColor blueColor]];
//        [self.updateTime setBackgroundColor:[UIColor redColor]];
//        [self.author setBackgroundColor:[UIColor grayColor]];
        
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.updateTime];
        [self.contentView addSubview:self.author];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@27);
        }];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
        [self.updateTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.content.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.height.equalTo(@15);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.width.equalTo(self.author.mas_width);
        }];
        [self.author mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.updateTime.mas_top);
            make.left.equalTo(self.updateTime.mas_right);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(self.updateTime.mas_height);
        }];
    }
    return self;
}

+ (CGFloat)height {
    return 80;
}

@end
