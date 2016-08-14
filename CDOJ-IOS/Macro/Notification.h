//
//  Notification.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef Notification_h
#define Notification_h

#import "String.h"

#define NOTIFICATION_CENTER @"Notification."

// SKIP
#define NOTIFICATION_SKIP                               CONCAT( NOTIFICATION_CENTER,                @"Skip."        )
#define NOTIFICATION_SKIP_NOTICE                        CONCAT( NOTIFICATION_SKIP,                  @"Notice."      )
#define NOTIFICATION_SKIP_PROBLEM                       CONCAT( NOTIFICATION_SKIP,                  @"Problem."     )
#define NOTIFICATION_SKIP_CONTEST                       CONCAT( NOTIFICATION_SKIP,                  @"Contest."     )

// SHOW
#define NOTIFICATION_SHOW                               CONCAT( NOTIFICATION_CENTER,                @"Show."        )
#define NOTIFICATION_SHOW_NOTICE                        CONCAT( NOTIFICATION_SHOW,                  @"Notice."      )
#define NOTIFICATION_SHOW_PROBLEM                       CONCAT( NOTIFICATION_SHOW,                  @"Problem."     )
#define NOTIFICATION_SHOW_CONTEST                       CONCAT( NOTIFICATION_SHOW,                  @"Contest."     )

// HTTP
#define NOTIFICATION_HTTP                               CONCAT( NOTIFICATION_CENTER,                @"Http."        )
#define NOTIFICATION_HTTP_CONNECTING                    CONCAT( NOTIFICATION_HTTP,                  @"Connecting."  )
#define NOTIFICATION_HTTP_CONNECTED                     CONCAT( NOTIFICATION_HTTP,                  @"Connected."   )
#define NOTIFICATION_HTTP_ERROR                         CONCAT( NOTIFICATION_HTTP,                  @"Error."       )

// SITE
#define NOTIFICATION_SITE                               CONCAT( NOTIFICATION_CENTER,                @"Site."        )
#define NOTIFICATION_SITE_SESSION                       CONCAT( NOTIFICATION_SITE,                  @"Session."     )
#define NOTIFICATION_SITE_SESSION_REFRESHED             CONCAT( NOTIFICATION_SITE_SESSION,          @"Refreshed."   )
#define NOTIFICATION_SITE_SESSION_FETCHDATA             CONCAT( NOTIFICATION_SITE_SESSION,          @"FetchData."   )

// USER
#define NOTIFICATION_USER                               CONCAT( NOTIFICATION_CENTER,                @"User."        )
#define NOTIFICATION_USER_SIGN                          CONCAT( NOTIFICATION_USER,                  @"Sign."        )
#define NOTIFICATION_USER_SIGN_IN                       CONCAT( NOTIFICATION_USER_SIGN,             @"In."          )
#define NOTIFICATION_USER_SIGN_OUT                      CONCAT( NOTIFICATION_USER_SIGN,             @"Out."         )
#define NOTIFICATION_USER_DATA                          CONCAT( NOTIFICATION_USER,                  @"Data."        )
#define NOTIFICATION_USER_DATA_REFRESHED                CONCAT( NOTIFICATION_USER_DATA,             @"Refreshed."   )
#define NOTIFICATION_USER_LIST                          CONCAT( NOTIFICATION_USER,                  @"List."        )
#define NOTIFICATION_USER_LIST_REFRESHED                CONCAT( NOTIFICATION_USER_LIST,             @"Refreshed."   )

// NOTICE
#define NOTIFICATION_NOTICE                             CONCAT( NOTIFICATION_CENTER,                @"Notice."      )
#define NOTIFICATION_NOTICE_LIST                        CONCAT( NOTIFICATION_NOTICE,                @"List."        )
#define NOTIFICATION_NOTICE_LIST_REFRESHED              CONCAT( NOTIFICATION_NOTICE_LIST,           @"Refreshed."   )
#define NOTIFICATION_NOTICE_DATA                        CONCAT( NOTIFICATION_NOTICE,                @"Data."        )
#define NOTIFICATION_NOTICE_DATA_REFRESHED              CONCAT( NOTIFICATION_NOTICE_DATA,           @"Refreshed."   )

// PROBLEM
#define NOTIFICATION_PROBLEM                            CONCAT( NOTIFICATION_CENTER,                @"Problem."     )
#define NOTIFICATION_PROBLEM_LIST                       CONCAT( NOTIFICATION_PROBLEM,               @"List."        )
#define NOTIFICATION_PROBLEM_LIST_REFRESHED             CONCAT( NOTIFICATION_PROBLEM_LIST,          @"Refreshed."   )
#define NOTIFICATION_PROBLEM_DATA                       CONCAT( NOTIFICATION_PROBLEM,               @"Data."        )
#define NOTIFICATION_PROBLEM_DATA_REFRESHED             CONCAT( NOTIFICATION_PROBLEM_DATA,          @"Refreshed."   )

// CONTEST
#define NOTIFICATION_CONTEST                            CONCAT( NOTIFICATION_CENTER,                @"Contest."     )
#define NOTIFICATION_CONTEST_LIST                       CONCAT( NOTIFICATION_CONTEST,               @"List."        )
#define NOTIFICATION_CONTEST_LIST_REFRESHED             CONCAT( NOTIFICATION_CONTEST_LIST,          @"Refreshed."   )
#define NOTIFICATION_CONTEST_DATA                       CONCAT( NOTIFICATION_CONTEST,               @"Data."        )
#define NOTIFICATION_CONTEST_DATA_REFRESHED             CONCAT( NOTIFICATION_CONTEST_DATA,          @"Refreshed."   )
#define NOTIFICATION_CONTEST_LOGIN                      CONCAT( NOTIFICATION_CONTEST,               @"Login."       )
#define NOTIFICATION_CONTEST_LOGIN_SUCCEED              CONCAT( NOTIFICATION_CONTEST_LOGIN,         @"Succeed."     )
#define NOTIFICATION_CONTEST_LOGIN_NEED                 CONCAT( NOTIFICATION_CONTEST_LOGIN,         @"Need."        )
#define NOTIFICATION_CONTEST_LOGIN_NEED_PASSWORD        CONCAT( NOTIFICATION_CONTEST_LOGIN_NEED,    @"Password."    )
#define NOTIFICATION_CONTEST_LOGIN_NEED_REGISTER        CONCAT( NOTIFICATION_CONTEST_LOGIN_NEED,    @"Register."    )
#define NOTIFICATION_CONTEST_LOGIN_NEED_PERMISSION      CONCAT( NOTIFICATION_CONTEST_LOGIN_NEED,    @"Permission."  )


#endif /* Notification_h */
