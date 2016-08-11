//
//  NoticeContentViewController.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeContentViewController.h"

@implementation NoticeContentViewController

- (instancetype)initWithArticleId:(NSString*)aid {
    if(self = [super init]) {
        self.data = [[NoticeContentModel alloc] init];
        [self.data fetchDataWithArticleId:aid];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_NOTICE_DATA_REFRESHED object:nil];
        
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
    return self;
}

- (void)openInBrowser {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/#/article/show/%@", APIURL, [self.data.content objectForKey:@"articleId"]]];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)refreshData {
    [self.webView loadWithData:self.data.content andRenderName:@"articleRender"];
}

@end
