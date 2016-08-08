//
//  NoticeListTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface NoticeListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UILabel* title;
@property (nonatomic, strong) UILabel* content;
@property (nonatomic, strong) UILabel* updateTime;
@property (nonatomic, strong) UILabel* author;


+ (CGFloat)height;

@end
