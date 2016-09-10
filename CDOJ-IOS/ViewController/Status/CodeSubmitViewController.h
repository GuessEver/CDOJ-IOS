//
//  CodeSubmitViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultCodeViewController.h"
#import "CodeSubmitModel.h"

@interface CodeSubmitViewController : DefaultCodeViewController

@property (nonatomic, strong) NSString* problemId;
@property (nonatomic, strong) NSString* contestId;
@property (nonatomic, strong) NSArray<NSString*>* languages;
@property (nonatomic, strong) UISegmentedControl* languageChooser;
@property (nonatomic, strong) CodeSubmitModel* codeSubmitter;

@end
