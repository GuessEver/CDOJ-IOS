//
//  FeedbackViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/11.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "FeedbackViewController.h"
#import <PgySDK/PgyManager.h>

@implementation FeedbackViewController

- (instancetype)init {
    if(self = [super init]) {
        self.intro = [[UILabel alloc] init];
        [self.intro setText:@"如果您有任何意见或建议，都请第一时间告诉我们，谢谢！"];
        [self.intro setNumberOfLines:0];
        [self.view addSubview:self.intro];
        
        self.how = [[UILabel alloc] init];
        [self.how setText:@"在任何界面三指滑动即可调出截图反馈页面，也可直接点击下面按钮反馈"];
        [self.how setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        [self.how setTextColor:COLOR_COMMENT];
        [self.how setNumberOfLines:0];
        [self.view addSubview:self.how];
        
        self.feedbackBtn = [[UIButton alloc] init];
        [self.feedbackBtn.layer setCornerRadius:5];
        [self.feedbackBtn setTitle:@"反馈" forState:UIControlStateNormal];
        [self.feedbackBtn setBackgroundColor:COLOR_TITLE];
        [self.feedbackBtn addTarget:self action:@selector(showFeedback) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.feedbackBtn];
        
        [self.intro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(20);
            make.left.equalTo(self.view.mas_left).offset(50);
            make.right.equalTo(self.view.mas_right).offset(-50);
        }];
        [self.how mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.intro.mas_bottom).offset(30);
            make.left.equalTo(self.view.mas_left).offset(50);
            make.right.equalTo(self.view.mas_right).offset(-50);
        }];
        [self.feedbackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.how.mas_bottom).offset(10);
            make.left.equalTo(self.view.mas_left).offset(50);
            make.right.equalTo(self.view.mas_right).offset(-50);
        }];
    }
    return self;
}

- (void)showFeedback {
    [[PgyManager sharedPgyManager] showFeedbackView];
}

@end
