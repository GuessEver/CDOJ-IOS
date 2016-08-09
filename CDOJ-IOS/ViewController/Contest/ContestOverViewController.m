//
//  ContestOverViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestOverViewController.h"
#import "Color.h"
#import "Masonry.h"

@implementation ContestOverViewController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:COLOR_BACKGROUND];
        
        // Options
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
        
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

- (void)loadDetailWithData:(NSDictionary*)data {
    self.data = data;
    [self.webView loadWithData:self.data andRenderName:@"contestOverviewRender"];
}

@end
