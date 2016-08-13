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
        
        [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.content setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.updateTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.author setTranslatesAutoresizingMaskIntoConstraints:NO];
        
// Just for test here
//        [self.title setBackgroundColor:[UIColor purpleColor]];
//        [self.content setBackgroundColor:[UIColor blueColor]];
//        [self.updateTime setBackgroundColor:[UIColor redColor]];
//        [self.author setBackgroundColor:[UIColor grayColor]];
        
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.updateTime];
        [self.contentView addSubview:self.author];
        
        NSDictionary* views = @{@"title":self.title, @"content":self.content, @"updateTime":self.updateTime, @"author":self.author};
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title(27)][content][updateTime(15)]-5-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[content]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[updateTime(author)][author]-10-|" options:0 metrics:nil views:views]];
        [self.author mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.updateTime.mas_top);
            make.height.equalTo(self.updateTime.mas_height);
        }];
    }
    return self;
}

+ (CGFloat)height {
    return 80;
}

@end
