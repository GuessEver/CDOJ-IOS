//
//  ContestClarificationListTableView.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface ContestClarificationListTableView : DefaultTableViewCell

@property (nonatomic, strong) UIImageView* avatar;
@property (nonatomic, strong) UILabel* username;
@property (nonatomic, strong) UILabel* submitTime;
@property (nonatomic, strong) UILabel* content;

+ (CGFloat)height;
- (void)loadAvatarWithUserEmail:(NSString*)email;

@end
