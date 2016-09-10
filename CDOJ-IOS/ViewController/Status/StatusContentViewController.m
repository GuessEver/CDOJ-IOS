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
        
        [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top);
            make.left.equalTo(self.view.mas_left);
            make.width.equalTo(self.view.mas_width);
            make.bottom.equalTo(self.copyright.mas_top);
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
