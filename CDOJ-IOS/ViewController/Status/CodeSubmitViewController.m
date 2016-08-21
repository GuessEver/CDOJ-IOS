//
//  CodeSubmitViewController.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "CodeSubmitViewController.h"

@interface CodeSubmitViewController ()

@end

@implementation CodeSubmitViewController

- (instancetype)init {
    if(self = [super init]) {
        self.navigationItem.rightBarButtonItems = @[
                                                    [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(submitCode)],
                                                    [[UIBarButtonItem alloc] initWithTitle:@"语言选择" style:UIBarButtonItemStyleDone target:self action:@selector(chooseLanguage)],
                                                    ];
        
        self.codeView = [[CodeEditorView alloc] init];
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
    }
    return self;
}

- (void)submitCode {
}
- (void)chooseLanguage {
}

@end
