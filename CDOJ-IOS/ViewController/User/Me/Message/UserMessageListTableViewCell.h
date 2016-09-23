//
//  UserMessageListTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface UserMessageListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) NSString* senderEmail;
@property (nonatomic, strong) NSString* receiverEmail;
@property (nonatomic, strong) UIImageView* senderAvatar;
@property (nonatomic, strong) UIImageView* receiverAvatar;
@property (nonatomic, strong) UILabel* senderUsername;
@property (nonatomic, strong) UILabel* receiverUsername;
@property (nonatomic, strong) UILabel* connectArrow;
@property (nonatomic, strong) UILabel* content;
@property (nonatomic, strong) UILabel* time;

- (void)loadAvatar;
+ (CGFloat)height;

@end
