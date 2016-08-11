//
//  Notification.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef Notification_h
#define Notification_h


#define NOTIFICATION_CENTER @"Notification"

// ERROR
#define NOTIFICATION_HTTPERROR [NOTIFICATION_CENTER stringByAppendingString:@"Error."]

#define NOTIFICATION_SITE [NOTIFICATION_CENTER stringByAppendingString:@"Site."]
#define NOTIFICATION_SITE_SESSION [NOTIFICATION_SITE stringByAppendingString:@"Session."]
#define NOTIFICATION_SITE_SESSION_REFRESHED [NOTIFICATION_SITE_SESSION stringByAppendingString:@"Refreshed."]
#define NOTIFICATION_SITE_SESSION_FETCHDATA [NOTIFICATION_SITE_SESSION stringByAppendingString:@"FetchData."]

#define NOTIFICATION_USER [NOTIFICATION_CENTER stringByAppendingString:@"User."]
#define NOTIFICATION_USER_SIGN [NOTIFICATION_USER stringByAppendingString:@"Sign."]
#define NOTIFICATION_USER_SIGN_IN [NOTIFICATION_USER_SIGN stringByAppendingString:@"In."]
#define NOTIFICATION_USER_SIGN_OUT [NOTIFICATION_USER_SIGN stringByAppendingString:@"Out."]
#define NOTIFICATION_USER_DATA [NOTIFICATION_USER stringByAppendingString:@"Data."]
#define NOTIFICATION_USER_DATA_REFRESHED [NOTIFICATION_USER_DATA stringByAppendingString:@"Refreshed."]
#define NOTIFICATION_USER_LIST [NOTIFICATION_USER stringByAppendingString:@"List."]
#define NOTIFICATION_USER_LIST_REFRESHED [NOTIFICATION_USER_LIST stringByAppendingString:@"Refreshed."]

#define NOTIFICATION_NOTICE [NOTIFICATION_CENTER stringByAppendingString:@"Notice."]
#define NOTIFICATION_NOTICE_LIST [NOTIFICATION_NOTICE stringByAppendingString:@"List."]
#define NOTIFICATION_NOTICE_LIST_REFRESHED [NOTIFICATION_NOTICE_LIST stringByAppendingString:@"Refreshed."]
#define NOTIFICATION_NOTICE_DATA [NOTIFICATION_NOTICE stringByAppendingString:@"Data."]
#define NOTIFICATION_NOTICE_DATA_REFRESHED [NOTIFICATION_NOTICE_DATA stringByAppendingString:@"Refreshed."]

#define NOTIFICATION_PROBLEM [NOTIFICATION_CENTER stringByAppendingString:@"Problem."]
#define NOTIFICATION_PROBLEM_LIST [NOTIFICATION_PROBLEM stringByAppendingString:@"List."]
#define NOTIFICATION_PROBLEM_LIST_REFRESHED [NOTIFICATION_PROBLEM_LIST stringByAppendingString:@"Refreshed."]
#define NOTIFICATION_PROBLEM_DATA [NOTIFICATION_PROBLEM stringByAppendingString:@"Data."]
#define NOTIFICATION_PROBLEM_DATA_REFRESHED [NOTIFICATION_PROBLEM_DATA stringByAppendingString:@"Refreshed."]

#define NOTIFICATION_CONTEST [NOTIFICATION_CENTER stringByAppendingString:@"Contest."]
#define NOTIFICATION_CONTEST_LIST [NOTIFICATION_CONTEST stringByAppendingString:@"List."]
#define NOTIFICATION_CONTEST_LIST_REFRESHED [NOTIFICATION_CONTEST_LIST stringByAppendingString:@"Refreshed."]
#define NOTIFICATION_CONTEST_DATA [NOTIFICATION_CONTEST stringByAppendingString:@"Data."]
#define NOTIFICATION_CONTEST_DATA_REFRESHED [NOTIFICATION_CONTEST_DATA stringByAppendingString:@"Refreshed."]
#define NOTIFICATION_CONTEST_LOGIN [NOTIFICATION_CONTEST stringByAppendingString:@"Login."]
#define NOTIFICATION_CONTEST_LOGIN_SUCCEED [NOTIFICATION_CONTEST_LOGIN stringByAppendingString:@"Succeed."]
#define NOTIFICATION_CONTEST_LOGIN_NEED [NOTIFICATION_CONTEST_LOGIN stringByAppendingString:@"Need."]
#define NOTIFICATION_CONTEST_LOGIN_NEED_PASSWORD [NOTIFICATION_CONTEST_LOGIN_NEED stringByAppendingString:@"Password."]
#define NOTIFICATION_CONTEST_LOGIN_NEED_REGISTER [NOTIFICATION_CONTEST_LOGIN_NEED stringByAppendingString:@"Register."]
#define NOTIFICATION_CONTEST_LOGIN_NEED_PERMISSION [NOTIFICATION_CONTEST_LOGIN_NEED stringByAppendingString:@"Permission."]


#endif /* Notification_h */
