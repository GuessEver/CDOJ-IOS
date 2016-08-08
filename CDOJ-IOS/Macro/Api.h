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

#define API_AVATAR(email, size) [NSString stringWithFormat:@"http://cdn.v2ex.com/gravatar/%@.jpg?s=%d&&d=retro", md5(email), size]

// Base URL
#define APIURL @"http://acm.uestc.edu.cn"
#define API_USER [APIURL stringByAppendingString:@"/user"]
#define API_ARTICLE [APIURL stringByAppendingString:@"/article"]
#define API_CONTEST [APIURL stringByAppendingString:@"/contest"]
#define API_PROBLEM [APIURL stringByAppendingString:@"/problem"]
#define API_STATUS [APIURL stringByAppendingString:@"/status"]
#define API_GLOBAL APIURL

// Global
#define API_GLOBAL_USERDATA [API_GLOBAL stringByAppendingString:@"/data"]
#define API_GLOBAL_SITEDATA [API_GLOBAL stringByAppendingString:@"/globalData"]

// User
#define API_USER_LOGIN [API_USER stringByAppendingString:@"/login"]
#define API_USER_LOGOUT [API_USER stringByAppendingString:@"/logout"]
#define API_USER_REGISTER [API_USER stringByAppendingString:@"/register"]
#define API_USER_CENTERDATA(username) [[API_USER stringByAppendingString:@"/userCenterData/"] stringByAppendingString:username]
#define API_USER_PROFILE(username) [[API_USER stringByAppendingString:@"/profile/"] stringByAppendingString:username]

// Article
#define API_ARTICLE_LIST [API_ARTICLE stringByAppendingString:@"/search"]
#define API_ARTICLE_DATA(id) [[API_ARTICLE stringByAppendingString:@"/data/"] stringByAppendingString:(id)]
#define API_ARTICLE_EDIT [API_ARTICLE stringByAppendingString:@"/edit"]

// Contest
#define API_CONTEST_CLARIFICATION [API_ARTICLE stringByAppendingString:@"/commentSearch"]
#define API_CONTEST_LIST [API_CONTEST stringByAppendingString:@"/search"]
#define API_CONTEST_DATA(id) [[API_CONTEST stringByAppendingString:@"/data/"] stringByAppendingString:id]
#define API_CONTEST_LOGIN [API_CONTEST stringByAppendingString:@"/loginContest"]

// Problem
#define API_PROBLEM_LIST [API_PROBLEM stringByAppendingString:@"/search"]
#define API_PROBLEM_DATA(id) [[API_PROBLEM stringByAppendingString:@"/data/"] stringByAppendingString:id]
#define API_STATUS_SUBMIT [API_STATUS stringByAppendingString:@"/submit"]

// Status
#define API_STATUS_LIST [API_STATUS stringByAppendingString:@"/search"]
#define API_STATUS_INFO(id) [[API_STATUS stringByAppendingString:@"/info/"] stringByAppendingString:id]


#endif /* Api_h */
