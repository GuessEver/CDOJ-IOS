//
//  AccountListTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface AccountListTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UIImageView* avatar;
@property (nonatomic, strong) UILabel* username;
@property (nonatomic, strong) UILabel* tip;
@property (nonatomic, strong) NSString* email;
@property BOOL isDefault;
@property BOOL isAdd;

+ (CGFloat)height;
- (void)reloadData;

@end
