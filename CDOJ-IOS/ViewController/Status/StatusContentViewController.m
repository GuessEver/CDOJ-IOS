//
//  StatusContentViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "StatusContentViewController.h"

@interface StatusContentViewController ()

@end

@implementation StatusContentViewController

- (instancetype)initWithStatusId:(NSString*)statusId andLanguageSuffix:(NSString*)suffix {
    if(self = [super init]) {
        self.codeView = [[CodeEditorView alloc] initWithLanguage:[CodeEditorLanguage getLanguageByFileSuffixName:suffix]];
        [self.codeView setEditable:NO];
        [self.view addSubview:self.codeView];
        
        UILabel* copyright = [[UILabel alloc] init];
        [copyright setTextAlignment:NSTextAlignmentRight];
        [copyright setText:@"Powered by Codeditor"];
        [copyright setFont:[UIFont systemFontOfSize:[UIFont systemFontSize] - 3]];
        [self.view addSubview:copyright];
        
        [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top);
            make.left.equalTo(self.view.mas_left);
            make.width.equalTo(self.view.mas_width);
            make.bottom.equalTo(copyright.mas_top);
        }];
        [copyright mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.width.equalTo(self.view.mas_width);
            make.bottom.equalTo(self.view.mas_bottom);
            make.height.equalTo(@15);
        }];
        self.data = [[StatusContentModel alloc] init];
        [self.data fetchDataWithStatusId:statusId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_STATUS_DATA_REFRESHED object:nil];
    }
    return self;
}

- (void)refreshData {
    [self.codeView loadText:self.data.content];
}

@end
