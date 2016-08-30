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
#define NOTIFICATION_USER_INFO                          CONCAT( NOTIFICATION_USER,                  @"Info."        )
#define NOTIFICATION_USER_INFO_REFRESHED                CONCAT( NOTIFICATION_USER_INFO,             @"Refreshed."   )
#define NOTIFICATION_USER_BASIC                         CONCAT( NOTIFICATION_USER,                  @"Basic."       )
#define NOTIFICATION_USER_BASIC_REFRESHED               CONCAT( NOTIFICATION_USER_BASIC,            @"Refreshed."   )
#define NOTIFICATION_USER_ACHIEVEMENT                   CONCAT( NOTIFICATION_USER,                  @"Achievement." )
#define NOTIFICATION_USER_ACHIEVEMENT_REFRESHED         CONCAT( NOTIFICATION_USER_ACHIEVEMENT,      @"Refreshed."   )
#define NOTIFICATION_USER_LIST                          CONCAT( NOTIFICATION_USER,                  @"List."        )
#define NOTIFICATION_USER_LIST_REFRESHED                CONCAT( NOTIFICATION_USER_LIST,             @"Refreshed."   )

// ARTICLE
#define NOTIFICATION_ARTICLE                            CONCAT( NOTIFICATION_CENTER,                @"Article."     )
#define NOTIFICATION_ARTICLE_LIST                       CONCAT( NOTIFICATION_ARTICLE,               @"List."        )
#define NOTIFICATION_ARTICLE_LIST_REFRESHED             CONCAT( NOTIFICATION_ARTICLE_LIST,          @"Refreshed."   )
#define NOTIFICATION_ARTICLE_DATA                       CONCAT( NOTIFICATION_ARTICLE,               @"Data."        )
#define NOTIFICATION_ARTICLE_DATA_REFRESHED             CONCAT( NOTIFICATION_ARTICLE_DATA,          @"Refreshed."   )

// PROBLEM
#define NOTIFICATION_PROBLEM                            CONCAT( NOTIFICATION_CENTER,                @"Problem."     )
#define NOTIFICATION_PROBLEM_LIST                       CONCAT( NOTIFICATION_PROBLEM,               @"List."        )
#define NOTIFICATION_PROBLEM_LIST_REFRESHED             CONCAT( NOTIFICATION_PROBLEM_LIST,          @"Refreshed."   )
#define NOTIFICATION_PROBLEM_DATA                       CONCAT( NOTIFICATION_PROBLEM,               @"Data."        )
#define NOTIFICATION_PROBLEM_DATA_REFRESHED             CONCAT( NOTIFICATION_PROBLEM_DATA,          @"Refreshed."   )

// STATUS
#define NOTIFICATION_STATUS                             CONCAT( NOTIFICATION_CENTER,                @"Status."      )
#define NOTIFICATION_STATUS_LIST                        CONCAT( NOTIFICATION_STATUS,                @"List."        )
#define NOTIFICATION_STATUS_LIST_REFRESHED              CONCAT( NOTIFICATION_STATUS_LIST,           @"Refreshed."   )
#define NOTIFICATION_STATUS_DATA                        CONCAT( NOTIFICATION_STATUS,                @"Data."        )
#define NOTIFICATION_STATUS_DATA_REFRESHED              CONCAT( NOTIFICATION_STATUS_DATA,           @"Refreshed."   )
#define NOTIFICATION_STATUS_SUBMIT                      CONCAT( NOTIFICATION_STATUS,                @"Status."      )
#define NOTIFICATION_STATUS_SUBMIT_SUCCEED              CONCAT( NOTIFICATION_STATUS_DATA,           @"Succeed."     )
#define NOTIFICATION_STATUS_SUBMIT_FAILED               CONCAT( NOTIFICATION_STATUS_DATA,           @"Failed."      )

// CONTEST
#define NOTIFICATION_CONTEST                            CONCAT( NOTIFICATION_CENTER,                @"Contest."     )
#define NOTIFICATION_CONTEST_LIST                       CONCAT( NOTIFICATION_CONTEST,               @"List."        )
#define NOTIFICATION_CONTEST_LIST_REFRESHED             CONCAT( NOTIFICATION_CONTEST_LIST,          @"Refreshed."   )
#define NOTIFICATION_CONTEST_RANKLIST                   CONCAT( NOTIFICATION_CONTEST,               @"RankList."    )
#define NOTIFICATION_CONTEST_RANKLIST_REFRESHED         CONCAT( NOTIFICATION_CONTEST_RANKLIST,      @"Refreshed."   )
#define NOTIFICATION_CONTEST_DATA                       CONCAT( NOTIFICATION_CONTEST,               @"Data."        )
#define NOTIFICATION_CONTEST_DATA_REFRESHED             CONCAT( NOTIFICATION_CONTEST_DATA,          @"Refreshed."   )
#define NOTIFICATION_CONTEST_LOGIN                      CONCAT( NOTIFICATION_CONTEST,               @"Login."       )
#define NOTIFICATION_CONTEST_LOGIN_SUCCEED              CONCAT( NOTIFICATION_CONTEST_LOGIN,         @"Succeed."     )
#define NOTIFICATION_CONTEST_LOGIN_NEED                 CONCAT( NOTIFICATION_CONTEST_LOGIN,         @"Need."        )
#define NOTIFICATION_CONTEST_LOGIN_NEED_PASSWORD        CONCAT( NOTIFICATION_CONTEST_LOGIN_NEED,    @"Password."    )
#define NOTIFICATION_CONTEST_LOGIN_NEED_REGISTER        CONCAT( NOTIFICATION_CONTEST_LOGIN_NEED,    @"Register."    )
#define NOTIFICATION_CONTEST_LOGIN_NEED_PERMISSION      CONCAT( NOTIFICATION_CONTEST_LOGIN_NEED,    @"Permission."  )

// RecentContestList
#define NOTIFICATION_RECENTCONTEST                      CONCAT( NOTIFICATION_CENTER,                @"Recent."      )
#define NOTIFICATION_RECENTCONTEST_REFRESHED            CONCAT( NOTIFICATION_RECENTCONTEST,         @"Refreshed."   )

// Training
#define NOTIFICATION_TRAINING                           CONCAT( NOTIFICATION_CENTER,                @"Training."    )
#define NOTIFICATION_TRAINING_LIST                      CONCAT( NOTIFICATION_TRAINING,              @"List."        )
#define NOTIFICATION_TRAINING_LIST_REFRESHED            CONCAT( NOTIFICATION_TRAINING_LIST,         @"Refreshed."   )
#define NOTIFICATION_TRAINING_INFO                      CONCAT( NOTIFICATION_TRAINING,              @"Info."        )
#define NOTIFICATION_TRAINING_INFO_REFRESHED            CONCAT( NOTIFICATION_TRAINING_INFO,         @"Refreshed."   )
#define NOTIFICATION_TRAINING_USER                      CONCAT( NOTIFICATION_TRAINING,              @"User."        )
#define NOTIFICATION_TRAINING_USER_REFRESHED            CONCAT( NOTIFICATION_TRAINING_USER,         @"Refreshed."   )
#define NOTIFICATION_TRAINING_CONTEST                   CONCAT( NOTIFICATION_TRAINING,              @"Contest."     )
#define NOTIFICATION_TRAINING_CONTEST_REFRESHED         CONCAT( NOTIFICATION_TRAINING_CONTEST,      @"Refreshed."   )
#define NOTIFICATION_TRAINING_GRAPH                     CONCAT( NOTIFICATION_TRAINING,              @"Graph."       )
#define NOTIFICATION_TRAINING_GRAPH_REFRESHED           CONCAT( NOTIFICATION_TRAINING_GRAPH,        @"Refreshed."   )


#endif /* Notification_h */
