//
//  ContestRankListTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface ContestRankListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UIImageView* avatar;
@property (nonatomic, strong) UILabel* username;
@property (nonatomic, strong) UILabel* nickname;
@property (nonatomic, strong) UILabel* rank;
@property (nonatomic, strong) UILabel* statistics;
@property (nonatomic, strong) UILabel* penalty;
@property (nonatomic, strong) UIView* problemStatus;
@property (nonatomic, strong) NSMutableArray<UILabel*>* problems;

+ (CGFloat)height;
- (void)loadAvatarWithUserEmail:(NSString*)email;
- (void)loadProblemStatusWithData:(NSArray<NSDictionary*>*)problems;


@end
