//
//  StatusListTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface StatusListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) NSString* resultId;
@property (nonatomic, strong) UILabel* result;
@property (nonatomic, strong) UILabel* username;
@property (nonatomic, strong) UILabel* timeCost;
@property (nonatomic, strong) UILabel* memoryCost;
@property (nonatomic, strong) UILabel* codeInfo;
@property (nonatomic, strong) UILabel* statusId;
@property (nonatomic, strong) UILabel* submitTime;


- (void)refreshTagColor;
+ (CGFloat)height;

@end
