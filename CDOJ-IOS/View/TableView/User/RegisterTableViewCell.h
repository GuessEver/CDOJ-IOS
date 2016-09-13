//
//  RegisterTableViewCell.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"
#import "DefaultTextField.h"

@interface RegisterTableViewCell : DefaultTableViewCell <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UILabel* title;
@property (nonatomic, strong) NSString* value;

- (instancetype)initWithTitle:(NSString*)title;

// text
@property (nonatomic, strong) DefaultTextField* inputField;
- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder isPassword:(BOOL)isPassword;

@property (nonatomic, strong) NSMutableArray<NSString*>* labels;
@property (nonatomic, strong) NSMutableArray<NSString*>* values;
// ratio
@property (nonatomic, strong) UISegmentedControl* ratioField;
- (instancetype)initWithRatioTitle:(NSString*)title withPropertyDataKey:(NSString*)propertyKey;
- (void)chooseItemWithValue:(NSString*)value;

// select
@property (nonatomic, strong) UILabel* selectedLabel;
- (void)selectItem:(NSInteger)row;
- (void)selectItemWithValue:(NSString*)value;
- (instancetype)initWithSelectTitle:(NSString*)title withPropertyDataKey:(NSString*)propertyKey;

@end
