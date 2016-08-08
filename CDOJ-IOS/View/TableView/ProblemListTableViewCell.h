//
//  ProblemListTableViewCell.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface ProblemListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UILabel* pid;
@property (nonatomic, strong) UILabel* title;
@property (nonatomic, strong) UILabel* source;
@property (nonatomic, strong) UILabel* statistics;


+ (CGFloat)height;

@end
