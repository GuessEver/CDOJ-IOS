//
//  Security.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/4.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "Security.h"
#include <CommonCrypto/CommonDigest.h>

@implementation Security

NSString* sha1(NSString* input) {
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

NSString* md5(NSString* str) {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *hash = [NSMutableString string];
    for(int i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [hash appendFormat:@"%02x",result[i]];
    }
    return [hash lowercaseString];
}

NSString* base64Encode(NSString* str) {
    NSData* base64Data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [base64Data base64EncodedStringWithOptions:0];
}
NSString* base64EncodeUrlsafe(NSString* str) {
    NSString* strBase64 = base64Encode(str);
    return [strBase64 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}

@end
