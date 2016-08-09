//
//  ContestContentViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestContentViewController.h"
#import "Color.h"
#import "Masonry.h"

@implementation ContestContentViewController

- (instancetype)initWithContestId:(NSString*)cid {
    if(self = [super init]) {
        self.data = [[ContestContentModel alloc] init];
        [self.data fetchDataWithContestId:cid];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_CONTEST_DATA_REFRESHED object:nil];
        
        [self.view setBackgroundColor:COLOR_BACKGROUND];
        
        // Options
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
        
        
        self.webView = [[UIWebView alloc] init];
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
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.data.detail
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@", jsonString);
    self.htmlStr = [[NSString alloc] initWithData:[[[NSDataAsset alloc] initWithName:@"problemRender"] data]
                                         encoding:NSUTF8StringEncoding];
    self.htmlStr = [self.htmlStr stringByReplacingOccurrencesOfString:@"{{{replace_data_here}}}"
                                                           withString:jsonString];
    [self.webView loadHTMLString:self.htmlStr baseURL:[NSURL URLWithString:@"http://acm.uestc.edu.cn"]];
}

@end
