//
//  Global.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/4.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef Global_h
#define Global_h

#define INFO_DIC [[NSBundle mainBundle] infoDictionary]
#define APP_NAME [INFO_DIC objectForKey:@"CFBundleDisplayName"]
#define APP_VERSION [INFO_DIC objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD [INFO_DIC objectForKey:@"CFBundleVersion"]
#define APP_DESCRIPTION @""
#define APP_FEEDBACK @"Copyright (c) 2016 - 2017, QKTeam UESTCACM"


#endif /* Global_h */
