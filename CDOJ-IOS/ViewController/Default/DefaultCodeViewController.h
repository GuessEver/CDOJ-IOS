//
//  DefaultCodeViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "CodeEditorView.h"
#import "Macro.h"

@interface DefaultCodeViewController : DefaultViewController

@property (nonatomic, strong) CodeEditorView* codeView;
@property (nonatomic, strong) UILabel* copyright;

@end
