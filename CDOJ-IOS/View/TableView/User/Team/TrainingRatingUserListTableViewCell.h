//
//  TrainingRatingUserListTableViewCell.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface TrainingRatingUserListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UILabel* rank;
@property (nonatomic, strong) UILabel* name;
@property (nonatomic, strong) UILabel* currentRating;
@property (nonatomic, strong) UILabel* volatility;

+ (CGFloat)height;

@end
