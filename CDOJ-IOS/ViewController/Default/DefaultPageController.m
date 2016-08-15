//
//  DefaultPageController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultPageController.h"

@implementation DefaultPageController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor2];
        [self setBarStyle:TYPagerBarStyleProgressView];
        [self setContentTopEdging:40];
        [self setCellWidth:100];
        [self setSelectedTextColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self setProgressColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self setPagerBarColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
        [self setDataSource:self];
        [self setDelegate:self];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
    }
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(MAX(70, MIN(self.view.frame.size.width, self.view.frame.size.height)/[self.dataSource numberOfControllersInPagerController]), 40);
}

@end
