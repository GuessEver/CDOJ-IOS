//
//  DefaultPageController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultPageController.h"

@implementation DefaultPageController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor2];
        [self setBarStyle:TYPagerBarStyleProgressView];
        [self setContentTopEdging:40];
        [self setCellWidth:90];
        [self setSelectedTextColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self setProgressColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self setPagerBarColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
        [self setDataSource:self];
        [self setDelegate:self];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
    }
    return self;
}

- (void)loadWebActionBarButtonsWithUrl:(NSString*)url {
    self.url = url;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActions:)];
}
- (void)showActions:(UIBarButtonItem*)sender {
    UIAlertController* alertController = [[UIAlertController alloc] init];
    [alertController addAction:[UIAlertAction actionWithTitle:@"复制原网站链接" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIPasteboard generalPasteboard] setString:self.url];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"浏览器打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openInBrowser];
    }]];
    UIPopoverPresentationController* popoverController = alertController.popoverPresentationController;
    if(popoverController) {
        [popoverController setBarButtonItem:sender];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)openInBrowser {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.url]];
}

@end
