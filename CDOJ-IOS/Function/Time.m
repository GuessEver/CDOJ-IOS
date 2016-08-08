//
//  Time.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "Time.h"

@implementation Time

NSString* getTimeString(NSString* timeStamp) {
    NSString* timeStamp10 = [[NSString stringWithString:timeStamp] substringToIndex:10];
    NSDate* stamp = [NSDate dateWithTimeIntervalSince1970:[timeStamp10 intValue]];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:stamp];
}
NSString* getTimeLengthString(NSString* timeStamp) {
    NSInteger seconds = [timeStamp integerValue] / 1000;
    NSInteger minutes = seconds / 60;
    NSInteger hours = minutes / 60;
    NSInteger days = hours / 24;
    hours %= 24; minutes %= 60; seconds %= 60;
    NSString* str = @"";
    if(days > 0) {
        str = [NSString stringWithFormat:@"%@%ld %@ ", str, days, days == 1 ? @"day" : @"days"];
    }
    if(hours > 0) {
        str = [NSString stringWithFormat:@"%@%ld %@ ", str, hours, hours == 1 ? @"hour" : @"hours"];
    }
    if(minutes > 0) {
        str = [NSString stringWithFormat:@"%@%ld %@ ", str, minutes, minutes == 1 ? @"minute" : @"minutes"];
    }
    if(seconds > 0) {
        str = [NSString stringWithFormat:@"%@%ld %@ ", str, seconds, seconds == 1 ? @"second" : @"seconds"];
    }
    return str;
}

NSString* getTimeLengthString2(NSString* timeStamp) {
    NSInteger seconds = [timeStamp integerValue] / 1000;
    NSInteger minutes = seconds / 60;
    NSInteger hours = minutes / 60;
    NSInteger days = hours / 24;
    hours %= 24; minutes %= 60; seconds %= 60;
    NSString* str = @"";
    if(days > 0) {
        str = [NSString stringWithFormat:@"%@%ld %@ ", str, days, days == 1 ? @"day" : @"days"];
    }
    str = [NSString stringWithFormat:@"%@ %02ld:%02ld:%02ld", str, hours, minutes, seconds];
    return str;
}

@end
