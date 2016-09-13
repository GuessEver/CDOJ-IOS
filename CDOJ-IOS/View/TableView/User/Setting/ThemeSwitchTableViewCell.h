//
//  ThemeSwitchTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/13.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@interface ThemeSwitchTableViewCell : DefaultTableViewCell

@property (nonatomic, strong) UIView* colorView;
@property (nonatomic, strong) UILabel* themeName;


- (void)setWithColorScheme:(ColorSchemeModel*)colorScheme;
+ (CGFloat)height;

@end
