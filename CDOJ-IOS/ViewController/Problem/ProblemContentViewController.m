//
//  ProblemContentViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemContentViewController.h"

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

- (void)openInBrowser {
    NSURL* url = [NSURL URLWithString:STRF(@"%@/#/problem/show/%@", APIURL, [self.data.content objectForKey:@"problemId"])];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)arrangeViews {
    // Options
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(openInBrowser)];
    
    
    self.webView = [[DefaultWebView alloc] init];
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
