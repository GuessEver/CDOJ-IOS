//
//  StatusContentViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "CodeEditorView.h"
#import "StatusContentModel.h"

@interface StatusContentViewController : DefaultViewController

@property (nonatomic, strong) CodeEditorView* codeView;
@property (nonatomic, strong) StatusContentModel* data;


- (instancetype)initWithStatusId:(NSString*)statusId andLanguageSuffix:(NSString*)suffix;

@end
