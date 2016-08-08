//
//  Global.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/4.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef Global_h
#define Global_h

#define APP_NAME @"CDOJ"
#define APP_VERSION @"0.1"

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
