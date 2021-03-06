//
//  HTTP.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/5.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "HTTP.h"
#import "Macro.h"

@implementation HTTP

NSMutableDictionary* checkQuery(NSArray<NSString*>* querys, NSArray<NSString*>* args) {
    if(querys.count != args.count) return [[NSMutableDictionary alloc] init];
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc] init];
    for(int i = 0; i < querys.count; ++i) {
        NSString* query = STR([querys objectAtIndex:i]);
        NSString* arg = STR([args objectAtIndex:i]);
        if([arg characterAtIndex:0] == '{' && [arg characterAtIndex:arg.length - 1] == '}') {
            [parameters setObject:query forKey:[arg substringWithRange:NSMakeRange(1, arg.length - 2)]];
        }
        else if(![query isEqualToString:arg]) {
            return [[NSMutableDictionary alloc] init];
        }
    }
    return parameters;
}

// determine how to jump page when requesting an url
+ (BOOL)openURLWithBrowser:(NSURLRequest*)request {
    if(![request.URL.host isEqualToString:@"acm.uestc.edu.cn"]) {
        return YES;
    }
    NSString* url = STR(request.URL);
    NSString* baseURL = @"http://acm.uestc.edu.cn/#/";
    if(url.length > baseURL.length && [[url substringToIndex:baseURL.length] isEqualToString:baseURL]) {
        NSArray<NSString*>* querys = [[url substringFromIndex:baseURL.length] componentsSeparatedByString:@"/"];
        NSMutableDictionary* parameters;
        if((parameters = checkQuery(querys, @[@"article", @"show", @"{articleId}"])).count == 1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_NOTICE object:nil userInfo:@{@"articleId":STR([parameters objectForKey:@"articleId"])}];
        }
        else if((parameters = checkQuery(querys, @[@"problem", @"show", @"{problemId}"])).count == 1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SKIP_PROBLEM object:nil userInfo:@{@"problemId":STR([parameters objectForKey:@"problemId"])}];
        }
        else if((parameters = checkQuery(querys, @[@"contest", @"show", @"{contestId}"])).count == 1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SKIP_CONTEST object:nil userInfo:@{@"contestId":STR([parameters objectForKey:@"contestId"]),@"action":@"enter"}];
        }
        else if((parameters = checkQuery(querys, @[@"contest", @"register", @"{contestId}"])).count == 1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SKIP_CONTEST object:nil userInfo:@{@"contestId":STR([parameters objectForKey:@"contestId"]),@"action":@"register"}];
        }
    }
    return NO;
}

@end
