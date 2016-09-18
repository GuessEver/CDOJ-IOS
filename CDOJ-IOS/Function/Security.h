//
//  Security.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/4.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Security : NSObject

NSString* sha1(NSString* input);
NSString* md5(NSString* str);
NSString* base64Encode(NSString* str);
NSString* base64EncodeUrlsafe(NSString* str);


@end
