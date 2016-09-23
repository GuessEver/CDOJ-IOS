//
//  DefaultWebView.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultWebView.h"
#import "Api.h"
#import "ColorSchemeModel.h"
#import "HTTP.h"
#import "MTKObserving.h"
#import "Masonry.h"

@implementation DefaultWebView

- (instancetype)init {
    if(self = [super init]) {
        [self setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor2];
        [self setOpaque:NO];
        [self setNavigationDelegate:self];
        
        self.progressBar = [[UIView alloc] init];
        [self.progressBar setBackgroundColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self addSubview:self.progressBar];
        [self.progressBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.mas_top);
            make.width.equalTo(self.mas_width).multipliedBy(0);
            make.height.equalTo(@3);
        }];
    }
    return self;
}

- (void)loadWithData:(NSDictionary*)data andRenderName:(NSString*)render {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    // NSLog(@"%@", jsonString);
    
//    self.htmlStr = [[NSString alloc] initWithData:[[[NSDataAsset alloc] initWithName:render] data] encoding:NSUTF8StringEncoding];
    self.htmlStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:render ofType:@"html" inDirectory:@"Resource/HTML5/"]
                                             encoding:NSUTF8StringEncoding
                                                error:nil];
    
    self.htmlStr = [self.htmlStr stringByReplacingOccurrencesOfString:@"{{{replace_data_here}}}"
                                                           withString:jsonString];
    self.htmlStr = [self.htmlStr stringByReplacingOccurrencesOfString:@"{{{replace_color_here}}}"
                                                           withString:[ColorSchemeModel hexCodeFromUIColor:[ColorSchemeModel defaultColorScheme].tintColor]];
//    NSLog(@"%@", self.htmlStr);
    [self loadHTMLString:self.htmlStr baseURL:BASEURL];

    [self observeProperty:@keypath(self.estimatedProgress) withBlock:^(__weak typeof(self) self, id oldValue, id newValue) {
        [self.progressBar mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.mas_top);
            make.width.equalTo(self.mas_width).multipliedBy(self.estimatedProgress);
            make.height.equalTo(@3);
        }];
        if(self.estimatedProgress >= 1.0 - 1e-5) { // done
            [UIView animateWithDuration:0.5 animations:^{
                [self.progressBar setAlpha:0];
            }];
        }
    }];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if(navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        if([HTTP openURLWithBrowser:navigationAction.request]) {
            if([[UIApplication sharedApplication]canOpenURL:navigationAction.request.URL]) {
                [[UIApplication sharedApplication]openURL:navigationAction.request.URL];
            }
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
