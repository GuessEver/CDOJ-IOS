//
//  DefaultWebView.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Webkit/Webkit.h>

@interface DefaultWebView : WKWebView <WKNavigationDelegate>

@property (nonatomic, strong) NSString* htmlStr;


- (void)loadWithData:(NSDictionary*)data andRenderName:(NSString*)render;

@end
