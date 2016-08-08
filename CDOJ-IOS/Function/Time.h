//
//  Time.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject

NSString* getTimeString(NSString* timeStamp);
NSString* getTimeLengthString(NSString* timeStamp);
NSString* getTimeLengthString2(NSString* timeStamp);

@end
