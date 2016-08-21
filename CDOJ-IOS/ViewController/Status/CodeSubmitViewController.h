//
//  CodeSubmitViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "CodeEditorView.h"
#import "CodeSubmitModel.h"

@interface CodeSubmitViewController : DefaultViewController

@property (nonatomic, strong) NSString* problemId;
@property (nonatomic, strong) NSString* contestId;
@property (nonatomic, strong) NSArray<NSString*>* languages;
@property (nonatomic, strong) UISegmentedControl* languageChooser;
@property (nonatomic, strong) CodeEditorView* codeView;
@property (nonatomic, strong) CodeSubmitModel* codeSubmitter;

@end
