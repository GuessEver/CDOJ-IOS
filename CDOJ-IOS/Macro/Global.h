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
#define APP_DESCRIPTION @"内测阶段中"
#define APP_FEEDBACK @"使用中如发现任何问题，请联系开发人员！\nQQ: 905865858\nEmail: guessever@gmail.com"

// Size
#define SIZE_PERCENT_WIDTH_NAV 0.07 // of whole page
#define SIZE_PERCENT_WIDTH_LIST 0.35 // of whole page

#define SIZE_WORD_HEIGHT_PER_LINE 30
#define SIZE_HEIGHT_TOP 40

#define FRAME_WINDOW [[UIScreen mainScreen] bounds]
#define FRAME_APP [[UIScreen mainScreen] applicationFrame]
#define FRAME_NAV CGRectMake(0, 0, FRAME_WINDOW.size.width * SIZE_PERCENT_WIDTH_NAV, FRAME_WINDOW.size.height)
// === LIST & CONTENT are in PAGE ===
#define FRAME_LIST CGRectMake(0, 0, FRAME_WINDOW.size.width * SIZE_PERCENT_WIDTH_LIST, FRAME_WINDOW.size.height)
#define FRAME_CONTENT CGRectMake(0, 20, FRAME_WINDOW.size.width - FRAME_NAV.size.width - FRAME_LIST.size.width, FRAME_WINDOW.size.height - 20)
// PAGE = LIST + CONTENT
#define FRAME_PAGE CGRectMake(FRAME_NAV.size.width, 0, FRAME_LIST.size.width + FRAME_CONTENT.size.width, FRAME_WINDOW.size.height)


#endif /* Global_h */
