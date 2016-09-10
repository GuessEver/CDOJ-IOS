//
//  DefaultCodeViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultCodeViewController.h"
#import "Security.h"
#import "Message.h"

@interface DefaultCodeViewController ()

@end

@implementation DefaultCodeViewController

- (instancetype)init {
    if(self = [super init]) {
        self.copyright = [[UILabel alloc] init];
        [self.copyright setTextAlignment:NSTextAlignmentRight];
        [self.copyright setText:@"Powered by Codeditor"];
        [self.copyright setFont:[UIFont systemFontOfSize:[UIFont systemFontSize] - 3]];
        [self.view addSubview:self.copyright];
        
        [self.copyright mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.width.equalTo(self.view.mas_width).offset(-5);
            make.bottom.equalTo(self.view.mas_bottom);
            make.height.equalTo(@15);
        }];
        
        UIBarButtonItem* codeditor_item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"codeditor_bar"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStylePlain target:self action:@selector(openInCodeditor)];
        [codeditor_item setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        self.navigationItem.rightBarButtonItems = @[codeditor_item];
    }
    return self;
}

- (void)openInCodeditor {
    if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"codeditor://"]]) {
        NSURL* url = [NSURL URLWithString:@"https://itunes.apple.com/app/codeditor/id1147022827"];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
        return;
    }
    NSString* content = self.codeView.text;
    NSString* language = @"";
    switch (self.codeView.languagePattern.language) {
        case CodeEditorLanguageC:
            language = @"c";
            break;
        case CodeEditorLanguageCpp:
            language = @"cpp";
            break;
        case CodeEditorLanguageJava:
            language = @"java";
            break;
            
        default:
            language = @"txt";
            break;
    }
    NSString* filename = STRF(@"Untitled.%@", language);
    NSURL* url = [NSURL URLWithString:STRF(@"codeditor://new/%@/%@", base64(filename), base64(content))];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
