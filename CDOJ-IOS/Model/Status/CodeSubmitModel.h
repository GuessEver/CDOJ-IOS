//
//  CodeSubmitModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface CodeSubmitModel : DefaultModel

@property (nonatomic, strong) NSDictionary* requestBody;


- (instancetype)initWithCode:(NSString*)code withLanguageId:(NSInteger)languageId toProblem:(NSString*)problemId inContest:(NSString*)contestId;
- (void)submit;

@end
