//
//  ProblemContentViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemContentViewController.h"
#import "StatusListViewController.h"
#import "CodeSubmitViewController.h"
#import "DefaultNavigationController.h"

@implementation ProblemContentViewController

- (instancetype)initWithProblemId:(NSString*)problemId {
    if(self = [super init]) {
        self.problemId = problemId;
        self.data = [[ProblemContentModel alloc] init];
        [self.data fetchDataWithProblemId:problemId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_PROBLEM_DATA_REFRESHED object:nil];
        [self arrangeViews];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openStatusPage) name:NOTIFICATION_STATUS_SUBMIT_SUCCEED object:nil];
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
    self.navigationItem.rightBarButtonItems = @[
                                                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(openInBrowser)],
                                                [[UIBarButtonItem alloc] initWithTitle:@"记录" style:UIBarButtonItemStylePlain target:self action:@selector(openStatusPage)],
                                                [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(openSubmitPage)]
                                                ];
    
    
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

- (void)openStatusPage {
    StatusListViewController* statusPage = [[StatusListViewController alloc] initWithProblemId:self.problemId];
    [self.navigationController pushViewController:statusPage animated:YES];
}
- (void)openSubmitPage {
    CodeSubmitViewController* submitPage = [[CodeSubmitViewController alloc] init];
    [self presentViewController:[[DefaultNavigationController alloc] initWithCancelButtonOnLeftAndRootViewController:submitPage] animated:YES completion:nil];
}
@end
