//
//  ThemeSwitchTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/13.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ThemeSwitchTableViewCell.h"

@implementation ThemeSwitchTableViewCell

/*****************************************************
 *  +--------+                                       *
 *  |  color |  themeName                  isSelect  *
 *  +--------+                                       *
 *****************************************************/

- (instancetype)init {
    if(self = [super init]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.colorView = [[UIView alloc] init];
        self.themeName = [[UILabel alloc] init];
        
        [self.colorView.layer setCornerRadius:25];
        [self.colorView.layer setMasksToBounds:YES];
        
        [self.themeName setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        
        [self.contentView addSubview:self.colorView];
        [self.contentView addSubview:self.themeName];
        [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@50);
            make.width.equalTo(self.colorView.mas_height);
            make.top.equalTo(self.contentView.mas_top).offset(15);
            make.left.equalTo(self.contentView.mas_left).offset(20);
        }];
        [self.themeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.colorView.mas_height);
            make.top.equalTo(self.colorView.mas_top);
            make.left.equalTo(self.colorView.mas_right).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    return self;
}

- (void)setWithColorScheme:(ColorSchemeModel*)colorScheme {
    [self.themeName setText:colorScheme.themeName];
    [self.colorView setBackgroundColor:colorScheme.tintColor];
}

+ (CGFloat)height {
    return 80;
}

@end
