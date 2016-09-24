//
//  ProgressBar.m
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProgressBar.h"
#import "ColorSchemeModel.h"
#import "MTKObserving.h"
#import "Masonry.h"

@implementation ProgressBar

#define BAR_HEIGHT 3
#define SHADOW_OFFSET_X 0
#define SHADOW_OFFSET_Y BAR_HEIGHT
#define SHADOW_RADIUS BAR_HEIGHT
#define PROCESSING_WIDTH 20

- (instancetype)initWithParent:(__weak id)parent inView:(__weak __kindof UIView*)parentView withKeyPath:(NSString*)keyPath {
    if(self = [super init]) {
        [self setBackgroundColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.layer setShadowOffset:CGSizeMake(SHADOW_OFFSET_X, SHADOW_OFFSET_Y)];
        [self.layer setShadowRadius:SHADOW_RADIUS];
        [self.layer setShadowColor:[ColorSchemeModel defaultColorScheme].tintColor.CGColor];
        [self.layer setShadowOpacity:0.5];
        
        // init position
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(parentView.mas_left);
            make.top.equalTo(parentView.mas_top);
            make.width.equalTo(parentView.mas_width).multipliedBy(0);
            make.height.equalTo(@(BAR_HEIGHT));
        }];
        
        // KVO
        __weak typeof(self) weakSelf = self;
        [parent observeProperty:keyPath withBlock:^(__weak typeof(parent) parent, id oldValue, id newValue) {
            [weakSelf mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(parentView.mas_left);
                make.top.equalTo(parentView.mas_top);
                make.width.equalTo(parentView.mas_width).multipliedBy([newValue doubleValue]);
                make.height.equalTo(@(BAR_HEIGHT));
            }];
            if([newValue doubleValue] >= 1.0 - 1e-5) { // done
                [UIView animateWithDuration:0.5 animations:^{
                    [weakSelf setAlpha:0];
                }];
            }
        }];
    }
    return self;
}

@end
