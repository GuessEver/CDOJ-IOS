//
//  DefaultSplitDetailLogoViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultSplitDetailLogoViewController.h"
#import "Masonry.h"
#import "Color.h"

@implementation DefaultSplitDetailLogoViewController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:COLOR_BACKGROUND];
        UIImageView* bgLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        [bgLogo setAlpha:0.5];
        [self.view addSubview:bgLogo];
        // imgView position constraints
        [bgLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view.mas_centerY).offset(-50);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }
    return self;
}

@end
