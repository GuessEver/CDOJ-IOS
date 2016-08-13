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
 * pid                                  solved/tried *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        self.pid = [[UILabel alloc] init];
        self.title = [[UILabel alloc] init];
        self.source = [[UILabel alloc] init];
        self.statistics = [[UILabel alloc] init];
        
        [self.pid setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        [self.source setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-1]];
        [self.statistics setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]-3]];
        
        [self.statistics setTextAlignment:NSTextAlignmentRight];
        
        [self.pid setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.title setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.source setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.statistics setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        
        [self.pid setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.source setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.statistics setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self.contentView addSubview:self.pid];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.source];
        [self.contentView addSubview:self.statistics];
        
        NSDictionary* views = @{@"pid":self.pid,@"title":self.title,@"source":self.source,@"statistics":self.statistics};
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title(27)][source][pid(15)]-5-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[source]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[pid(statistics)][statistics]-10-|" options:0 metrics:nil views:views]];
        [self.statistics mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pid.mas_top);
            make.height.equalTo(self.pid.mas_height);
        }];
    }
    return self;
}

+ (CGFloat)height {
    return 80;
}

@end
