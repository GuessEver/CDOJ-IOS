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

#define BAR_HEIGHT 2
#define SHADOW_OFFSET_X 0
#define SHADOW_OFFSET_Y BAR_HEIGHT
#define SHADOW_RADIUS BAR_HEIGHT
#define PROCESSINGBAR_WIDTH 20

- (instancetype)initWithParent:(__weak id)parent inView:(__weak __kindof UIView*)parentView withKeyPath:(NSString*)keyPath loadingIncreasement:(BOOL)loadingIncreasement {
    if(self = [super init]) {
        __weak typeof(self) weakSelf = self;
        [parentView addSubview:weakSelf];
        
        [self setHideAfterDone:YES];
        [self setBackgroundColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.layer setShadowOffset:CGSizeMake(SHADOW_OFFSET_X, SHADOW_OFFSET_Y)];
        [self.layer setShadowRadius:SHADOW_RADIUS];
        [self.layer setShadowColor:[ColorSchemeModel defaultColorScheme].tintColor.CGColor];
        [self.layer setShadowOpacity:0.5];
        
        // init position
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(parentView.mas_left);
            make.top.equalTo(parentView.mas_top);
            make.width.equalTo(parentView.mas_width).multipliedBy(0);
            make.height.equalTo(@(BAR_HEIGHT));
        }];
        
        // KVO
        self.progress = 0;
        [self observeProperty:@"progress" withBlock:^(__weak typeof(self) weakSelf, id oldValue, id newValue) {
            // ====== HELP ======
            // I CANNNOT use mas_updateConstraints to update it. It seems to have some problems.
            // When using mas_updateConstraints, the progress will only contain less than 0.5 instead of 1.0
            // So I can only use mas_remakeConstraints.
            // BUT using UIView animate with mas_remakeConstraints, it will render from center
            // More specifically, the animation is to spread from center
            // So I can only set centerX to parentView.mas_left, and let its length to be 2 times
            [weakSelf mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(parentView.mas_left);
                make.top.equalTo(parentView.mas_top);
                make.width.equalTo(parentView.mas_width).multipliedBy([newValue doubleValue]*2);
                make.height.equalTo(@(BAR_HEIGHT));
            }];
//            [weakSelf mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.width.equalTo(parentView.mas_width).multipliedBy([newValue doubleValue]*2);
//            }];
            [weakSelf setNeedsLayout];
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [weakSelf layoutIfNeeded];
            } completion:^(BOOL finished) {
                if([newValue doubleValue] >= 1.0 - 1e-5 && self.hideAfterDone) { // hide progressBar when done
                    [UIView animateWithDuration:0.5 animations:^{
                        [weakSelf setAlpha:0];
                    }];
                }
            }];
        }];
        [parent observeProperty:keyPath withBlock:^(__weak typeof(parent) parent, id oldValue, id newValue) {
            self.progress = MIN(1.0, MAX(self.progress, [newValue doubleValue]));
        }];
        
        // Auto increase a little progress to let user know it is loading...
        if(loadingIncreasement) {
            self.autoProgressTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(autoIncreaseProgress) userInfo:nil repeats:YES];
            [self.autoProgressTimer fire];
        }
    }
    return self;
}
- (instancetype)initWithParent:(__weak id)parent inView:(__weak __kindof UIView*)parentView withKeyPath:(NSString*)keyPath {
    if(self = [self initWithParent:parent inView:parentView withKeyPath:keyPath loadingIncreasement:YES]) {
    }
    return self;
}

- (void)setHideAfterDone:(BOOL)hideAfterDone {
    _hideAfterDone = hideAfterDone;
    if(!hideAfterDone) {
        [self setAlpha:1.0];
    }
}

- (void)autoIncreaseProgress {
    if(self.progress <= 0.92) {
        self.progress += 0.05;
    }
    else {
        [self.autoProgressTimer invalidate];
        self.autoProgressTimer = nil;
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if(!newSuperview) {
        if(self.autoProgressTimer) {
            [self.autoProgressTimer invalidate];
            self.autoProgressTimer = nil;
        }
    }
}

@end
