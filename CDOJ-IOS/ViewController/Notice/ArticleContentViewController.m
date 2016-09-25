//
//  ArticleContentViewController.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ArticleContentViewController.h"

@implementation ArticleContentViewController

- (instancetype)initWithArticleId:(NSString*)articleId {
    if(self = [super init]) {
        self.data = [[ArticleContentModel alloc] init];
        [self.data fetchDataWithArticleId:articleId];
        [self loadWebActionBarButtonsWithUrl:STRF(@"%@/#/article/show/%@", APIURL, articleId)];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_ARTICLE_DATA_REFRESHED object:nil];
        
        
        self.webView = [[DefaultWebView alloc] init];
        [self.view addSubview:self.webView];
        // self.webView Constraints
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.top.equalTo(self.view.mas_top);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    return self;
}

- (void)refreshData {
    [self.webView loadWithData:self.data.content andRenderName:@"articleRender"];
}

@end
