//
//  ContestListTableViewCell.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface ContestListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UILabel* contestId;
@property (nonatomic, strong) UILabel* title;
@property (nonatomic, strong) UILabel* startTime;
@property (nonatomic, strong) UILabel* length;
@property (nonatomic, strong) UILabel* status;
@property (nonatomic, strong) UILabel* typeName;

- (void)refreshTagColor;
+ (CGFloat)height;

@end
