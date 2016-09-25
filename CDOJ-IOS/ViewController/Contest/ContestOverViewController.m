//
//  ContestOverViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestOverViewController.h"
#import "ColorSchemeModel.h"
#import "Masonry.h"

@implementation ContestOverViewController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor2];
        
        // Options
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
        
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

- (void)loadDetailWithData:(NSDictionary*)data {
    self.data = data;
    [self.webView loadWithData:self.data andRenderName:@"contestOverviewRender"];
}

@end
