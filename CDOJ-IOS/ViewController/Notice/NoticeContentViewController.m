//
//  NoticeContentViewController.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeContentViewController.h"
#import "Color.h"
#import "Masonry.h"

@implementation NoticeContentViewController

- (instancetype)initWithArticleId:(NSString*)aid {
    if(self = [super init]) {
        self.data = [[NoticeContentModel alloc] init];
        [self.data fetchDataWithArticleId:aid];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_NOTICE_DATA_REFRESHED object:nil];
        
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
    return self;
}

- (void)refreshData {
    [self.webView loadWithData:self.data.content andRenderName:@"articleRender"];
}

@end
