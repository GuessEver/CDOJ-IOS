//
//  String.m
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "String.h"

@implementation String

NSString* convertToBriefContent(NSString* str) {
    // replace extra line break (\n) due to markdown
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(\n)(\n)+" options:0 error:nil];
    str = [regex stringByReplacingMatchesInString:str options:0 range:NSMakeRange(0, str.length) withTemplate:@"\n"];
    // replace picture link (markdown) to a simple tag
    regex = [NSRegularExpression regularExpressionWithPattern:@"!\\[.*?\\]\\(.*?\\)" options:0 error:nil];
    str = [regex stringByReplacingMatchesInString:str options:0 range:NSMakeRange(0, str.length) withTemplate:@"[图片]"];
    // replace H* titles mark
    regex = [NSRegularExpression regularExpressionWithPattern:@"^(#)+( )*" options:0 error:nil];
    str = [regex stringByReplacingMatchesInString:str options:0 range:NSMakeRange(0, str.length) withTemplate:@""];
    return str;
}

@end
