//
//  String.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/13.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef String_h
#define String_h

#define STRF(format, ...) [NSString stringWithFormat:format, __VA_ARGS__]
#define STR(str) STRF(@"%@", str)
#define CONCAT(str1, str2) STRF(@"%@%@", str1, str2)

#endif /* String_h */
