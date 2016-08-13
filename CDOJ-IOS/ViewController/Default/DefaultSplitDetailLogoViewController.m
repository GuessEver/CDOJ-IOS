//
//  DefaultSplitDetailLogoViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultSplitDetailLogoViewController.h"
#import "Masonry.h"
#import "ColorSchemeModel.h"

@implementation DefaultSplitDetailLogoViewController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor2];
        UIImageView* bgLogo = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [bgLogo setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [bgLogo setAlpha:0.5];
        [self.view addSubview:bgLogo];
        // imgView position constraints
        [bgLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_lessThanOrEqualTo(@150);
            make.width.mas_lessThanOrEqualTo(self.view.mas_width).multipliedBy(0.3);
            make.width.mas_lessThanOrEqualTo(self.view.mas_height).multipliedBy(0.3);
            make.height.equalTo(bgLogo.mas_width);
            make.centerY.equalTo(self.view.mas_centerY).offset(-50);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }
    return self;
}

@end
