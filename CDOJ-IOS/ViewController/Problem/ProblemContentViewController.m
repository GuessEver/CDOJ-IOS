//
//  ProblemContentViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemContentViewController.h"
#import "Color.h"
#import "Masonry.h"

@implementation ProblemContentViewController

- (instancetype)initWithProblemId:(NSString*)pid {
    if(self = [super init]) {
        self.data = [[ProblemContentModel alloc] init];
        [self.data fetchDataWithProblemId:pid];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_PROBLEM_DATA_REFRESHED object:nil];
        [self arrangeViews];
    }
    return self;
}

- (instancetype)initWithProblemContent:(NSDictionary*)data {
    if(self = [super init]) {
        self.data = [[ProblemContentModel alloc] init];
        self.data.content = data;
        [self arrangeViews];
        [self refreshData];
    }
    return self;
}

- (void)arrangeViews {
    [self.view setBackgroundColor:COLOR_BACKGROUND];
    
    // Options
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    
    
    self.webView = [[DefaultWebView alloc] init];
    [self.webView setBackgroundColor:COLOR_BACKGROUND];
    [self.webView setOpaque:NO];
    [self.view addSubview:self.webView];
    // self.webView Constraints
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height);
    }];
}

- (void)refreshData {
    [self.webView loadWithData:self.data.content andRenderName:@"problemRender"];
}

@end
