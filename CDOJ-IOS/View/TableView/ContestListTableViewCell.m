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
 * cid                             status   typeName *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.cid = [[UILabel alloc] init];
        self.title = [[UILabel alloc] init];
        self.startTime = [[UILabel alloc] init];
        self.length = [[UILabel alloc] init];
        self.status = [[UILabel alloc] init];
        self.typeName = [[UILabel alloc] init];
        
        [self.startTime setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.length setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.cid setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.status setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.typeName setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.length setTextAlignment:NSTextAlignmentRight];
        [self.status setTextAlignment:NSTextAlignmentCenter];
        [self.typeName setTextAlignment:NSTextAlignmentCenter];
        
        [self.title setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.startTime setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.length setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.cid setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.cid setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.startTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.length setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.status setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.typeName setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self.contentView addSubview:self.cid];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.startTime];
        [self.contentView addSubview:self.length];
        [self.contentView addSubview:self.status];
        [self.contentView addSubview:self.typeName];
        
        NSDictionary* views = @{@"cid":self.cid,@"title":self.title,@"startTime":self.startTime,@"length":self.length,@"status":self.status,@"typeName":self.typeName};
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title(27)][startTime][cid(15)]-5-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[startTime(length)][length]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[cid][status(60)]-5-[typeName(60)]-10-|" options:0 metrics:nil views:views]];
        [self.length mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.startTime.mas_top);
            make.height.equalTo(self.startTime.mas_height);
        }];
        [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cid.mas_top);
            make.height.equalTo(self.cid.mas_height);
        }];
        [self.typeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cid.mas_top);
            make.height.equalTo(self.cid.mas_height);
        }];
    }
    return self;
}

- (void)refreshTagColor {
    NSDictionary* tagColors = @{
                                @"Pending": COLOR_ORANGE,
                                @"Running": COLOR_RED,
                                @"Ended": COLOR_GREEN,
                                @"Public": COLOR_GREEN,
                                @"Private": COLOR_RED,
                                @"DIY": COLOR_RED,
                                @"Invited": COLOR_BLUE,
                                @"Onsite": COLOR_BLACK
                                };
    [self.status setTextColor:[tagColors objectForKey:self.status.text]];
    [self.typeName setTextColor:[tagColors objectForKey:self.typeName.text]];
}

+ (CGFloat)height {
    return 80;
}
@end
