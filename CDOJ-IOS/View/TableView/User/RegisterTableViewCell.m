//
//  RegisterTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "RegisterTableViewCell.h"
#import "Security.h"
#import "Macro.h"

@implementation RegisterTableViewCell

/*****************************************************
 * title                                  inputField *
 *****************************************************/

- (instancetype)initWithTitle:(NSString*)title {
    if(self = [super init]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.value = @"";
        self.title = [[UILabel alloc] init];
        [self.title setText:title];
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.contentView.mas_height);
            make.left.equalTo(self.contentView.mas_left).offset(20);
//            make.width.equalTo(self.contentView.mas_width).multipliedBy(0.5).offset(-20);
        }];
    }
    return self;
}

#pragma mark text
- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder isPassword:(BOOL)isPassword {
    if(self = [self initWithTitle:title]) {
        self.inputField = [[DefaultTextField alloc] initWithPlaceholder:placeholder isPassword:isPassword withBorder:NO];
        [self.inputField setTextAlignment:NSTextAlignmentRight];
        [self.inputField setDelegate:self];
        [self.contentView addSubview:self.inputField];
        [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.contentView.mas_height);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.left.equalTo(self.title.mas_right).offset(20);
//            make.width.equalTo(self.contentView.mas_width).multipliedBy(0.5).offset(-20);
        }];
    }
    return self;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString* text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(self.inputField.isSecureTextEntry) {
        self.value = sha1(text);
    }
    else {
        self.value = text;
    }
    return YES;
}

#pragma mark radio
- (instancetype)initWithRatioTitle:(NSString*)title withPropertyDataKey:(NSString*)propertyKey {
    if(self = [self initWithTitle:title]) {
        [self initLabelsAndValuesWithPropertyDataKey:propertyKey];
        self.ratioField = [[UISegmentedControl alloc] initWithItems:self.labels];
        [self.ratioField setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.ratioField addTarget:self action:@selector(chooseItem:) forControlEvents:UIControlEventValueChanged];
        if(self.labels.count > 0) {
            [self.ratioField setSelectedSegmentIndex:0];
            [self chooseItem:self.ratioField];
        }
        [self.contentView addSubview:self.ratioField];
        [self.ratioField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    return self;
}
- (void)chooseItem:(UISegmentedControl*)sender {
    self.value = STR(self.values[sender.selectedSegmentIndex]);
}
- (void)chooseItemWithValue:(NSString*)value {
    NSInteger i = [self getItemIndexWithValue:value];
    self.value = self.values[i];
    [self.ratioField setSelectedSegmentIndex:i];
}

#pragma mark select
- (instancetype)initWithSelectTitle:(NSString*)title withPropertyDataKey:(NSString*)propertyKey {
    if(self = [self initWithTitle:title]) {
        [self initLabelsAndValuesWithPropertyDataKey:propertyKey];
        self.selectedLabel = [[UILabel alloc] init];
        [self.selectedLabel setTextAlignment:NSTextAlignmentRight];
        [self.selectedLabel setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [self.contentView addSubview:self.selectedLabel];
        [self.selectedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.contentView.mas_height);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.width.equalTo(self.contentView.mas_width).multipliedBy(0.5).offset(-20);
        }];
        if(self.labels.count > 0) {
            self.value = self.values[0];
            [self.selectedLabel setText:self.labels[0]];
        }
    }
    return self;
}
- (void)selectItem:(NSInteger)row {
//    NSLog(@"%@\n%@\nrow = %ld", self.values, self.labels, (long)row);
    self.value = self.values[row];
    [self.selectedLabel setText:self.labels[row]];
}
- (void)selectItemWithValue:(NSString*)value {
    NSInteger i = [self getItemIndexWithValue:value];
    self.value = STR(self.values[i]);
    [self selectItem:i];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.labels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.textLabel setText:self.labels[indexPath.row]];
    if([self.values[indexPath.row] isEqualToString:self.value]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    return cell;
}

#pragma mark radio & select
- (void)initLabelsAndValuesWithPropertyDataKey:(NSString*)propertyKey {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"globalData" ofType:@"plist"];
    NSDictionary* data = [[NSDictionary dictionaryWithContentsOfFile:path] objectForKey:propertyKey];
    self.values = [[NSMutableArray alloc] init];
    self.labels = [[NSMutableArray alloc] init];
    for (NSString* key in data) {
        [self.values addObject:key];
    }
    [self.values sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber* o1 = @([obj1 integerValue]);
        NSNumber* o2 = @([obj2 integerValue]);
        return [o1 compare:o2];// == NSOrderedAscending ? NSOrderedAscending : NSOrderedDescending;
    }];
    for(NSInteger i = 0; i < self.values.count; i++) {
        [self.labels addObject:[data objectForKey:self.values[i]]];
    }
}
- (NSInteger)getItemIndexWithValue:(NSString*)value {
    for(NSInteger i = 0; i < self.values.count; i++) {
        if([self.values[i] isEqualToString:value]) {
            return i;
        }
    }
    return 0;
}
@end
