//
//  RecentContestListTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface RecentContestListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UILabel* name;
@property (nonatomic, strong) UILabel* startTime;
@property (nonatomic, strong) UILabel* dayOfWeek;
@property (nonatomic, strong) UILabel* oj;
@property (nonatomic, strong) UILabel* access;
@property (nonatomic, strong) NSString* link;


- (void)refreshTagColor;
+ (CGFloat)height;

@end
