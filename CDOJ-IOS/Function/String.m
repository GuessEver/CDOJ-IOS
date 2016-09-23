//
//  String.m
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "String.h"

@implementation String

+ (NSString*)replaceString:(NSString*)str withRegexPattern:(NSString*)pattern toTarget:(NSString*)target {
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    return [regex stringByReplacingMatchesInString:str options:0 range:NSMakeRange(0, str.length) withTemplate:target];
}

NSString* convertToBriefContent(NSString* str) {
    // replace extra line break (\n) due to markdown
    str = [String replaceString:str withRegexPattern:@"(\n)(\n)+" toTarget:@"\n"];
    
    // replace picture (markdown) to a simple tag
    str = [String replaceString:str withRegexPattern:@"!\\[.*?\\]\\(.*?\\)" toTarget:@"[图片]"];
    // replace picture (html) to a simple tag
    str = [String replaceString:str withRegexPattern:@"<img.*?>" toTarget:@"[图片]"];
    
    // link (markdown)
    str = [String replaceString:str withRegexPattern:@"\\[(.*?)\\]\\(.*?\\)" toTarget:@"$1"];
    // link (html)
    str = [String replaceString:str withRegexPattern:@"<a.*?>(.*?)</a>" toTarget:@"$1"];
    
    // mathjax marks
    str = [String replaceString:str withRegexPattern:@"\\$\\$?(.*?)\\$\\$?" toTarget:@"$1"];
    
    // remove code(markdown) marks
    str = [String replaceString:str withRegexPattern:@"`(``)?" toTarget:@""];
    
    // replace H* titles mark
    str = [String replaceString:str withRegexPattern:@"^(#)+( )*" toTarget:@""];
    // remove all html tags
    str = [String replaceString:str withRegexPattern:@"<.*?>" toTarget:@""];
    return str;
}

@end
