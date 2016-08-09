//
//  DefaultWebView.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultWebView.h"
#import "Api.h"
#import "Color.h"

@implementation DefaultWebView

- (instancetype)init {
    if(self = [super init]) {
        [self setBackgroundColor:COLOR_BACKGROUND];
        [self setOpaque:NO];
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
    self.htmlStr = [[NSString alloc] initWithData:[[[NSDataAsset alloc] initWithName:render] data]
                                         encoding:NSUTF8StringEncoding];
    self.htmlStr = [self.htmlStr stringByReplacingOccurrencesOfString:@"{{{replace_data_here}}}"
                                                           withString:jsonString];
    [self loadHTMLString:self.htmlStr baseURL:BASEURL];
}

@end
