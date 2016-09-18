//
//  DefaultViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "String.h"

@implementation DefaultViewController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
    }
    return self;
}

- (void)loadWebActionBarButtonsWithUrl:(NSString*)url {
    self.url = url;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActions:)];
}
- (void)showActions:(UIBarButtonItem*)sender {
    UIAlertController* alertController = [[UIAlertController alloc] init];
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
