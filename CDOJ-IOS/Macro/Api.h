//
//  Api.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/4.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef Api_h
#define Api_h
#import "Security.h"
#import "String.h"

#define API_AVATAR(email, size) STRF(@"http://cdn.v2ex.com/gravatar/%@.jpg?s=%ld&&d=retro", md5(STR(email)), (long)size)

// Base URL
#define APIURL @"http://qscoj.cn"
#define BASEURL [NSURL URLWithString:APIURL]

// recentContest
#define API_RECENTCONTEST                   CONCAT( APIURL,                                         @"/recentContest"   )

#define API_GLOBAL                          APIURL
#define API_USER                            CONCAT( APIURL,                                         @"/user"            )
#define API_ARTICLE                         CONCAT( APIURL,                                         @"/article"         )
#define API_CONTEST                         CONCAT( APIURL,                                         @"/contest"         )
#define API_PROBLEM                         CONCAT( APIURL,                                         @"/problem"         )
#define API_STATUS                          CONCAT( APIURL,                                         @"/status"          )
#define API_TRAINING                        CONCAT( APIURL,                                         @"/training"        )
#define API_MESSAGE                         CONCAT( APIURL,                                         @"/message"        )

// Global
#define API_GLOBAL_USERDATA                 CONCAT( API_GLOBAL,                                     @"/data"            )
#define API_GLOBAL_SITEDATA                 CONCAT( API_GLOBAL,                                     @"/globalData"      )

// User
#define API_USER_LOGIN                      CONCAT( API_USER,                                       @"/login"           )
#define API_USER_LOGOUT                     CONCAT( API_USER,                                       @"/logout"          )
#define API_USER_REGISTER                   CONCAT( API_USER,                                       @"/register"        )
#define API_USER_MODIFY                     CONCAT( API_USER,                                       @"/edit"            )
#define API_USER_CENTERDATA(username)       CONCAT( CONCAT( API_USER,       @"/userCenterData/" ),  username            )
#define API_USER_PROFILE(username)          CONCAT( CONCAT( API_USER,       @"/profile/"        ),  username            )
#define API_USER_INFO(username)             CONCAT( CONCAT( API_USER,       @"/typeAheadItem/"  ),  username            )

// Article
#define API_ARTICLE_LIST                    CONCAT( API_ARTICLE,                                    @"/search"          )
#define API_ARTICLE_DATA(id)                CONCAT( CONCAT( API_ARTICLE,    @"/data/"           ),  id                  )
#define API_ARTICLE_EDIT                    CONCAT( API_ARTICLE,                                    @"/edit"            )

// Contest
#define API_CONTEST_CLARIFICATION           CONCAT( API_ARTICLE,                                    @"/commentSearch"   )
#define API_CONTEST_LIST                    CONCAT( API_CONTEST,                                    @"/search"          )
#define API_CONTEST_DATA(id)                CONCAT( CONCAT( API_CONTEST,    @"/data/"           ),  id                  )
#define API_CONTEST_LOGIN                   CONCAT( API_CONTEST,                                    @"/loginContest"    )
#define API_CONTEST_RANKLIST(id)            CONCAT( CONCAT( API_CONTEST,    @"/rankList/"       ),  id                  )

// Problem
#define API_PROBLEM_LIST                    CONCAT( API_PROBLEM,                                    @"/search"          )
#define API_PROBLEM_DATA(id)                CONCAT( CONCAT( API_PROBLEM,    @"/data/"           ),  id                  )
#define API_STATUS_SUBMIT                   CONCAT( API_STATUS,                                     @"/submit"          )

// Status
#define API_STATUS_LIST                     CONCAT( API_STATUS,                                     @"/search"          )
#define API_STATUS_INFO(id)                 CONCAT( CONCAT( API_STATUS,     @"/info/"           ),  id                  )

// Training
#define API_TRAINING_LIST                   CONCAT( API_TRAINING,                                   @"/search"          )
#define API_TRAINING_INFO(id)               CONCAT( CONCAT( API_TRAINING,   @"/data/"           ),  id                  )
#define API_TRAINING_CONTEST(id)            CONCAT( CONCAT( API_TRAINING,   @"/searchTrainingContest/"),    id          )
#define API_TRAINING_USER(id)               CONCAT( CONCAT( API_TRAINING,   @"/searchTrainingUser/"),       id          )

// Message
#define API_MESSAGE_LIST                    CONCAT( API_MESSAGE,                                    @"/search"          )
#define API_MESSAGE_DATA(id)                CONCAT( CONCAT( API_MESSAGE,    @"/fetch/"          ),  id                  )


#endif /* Api_h */
