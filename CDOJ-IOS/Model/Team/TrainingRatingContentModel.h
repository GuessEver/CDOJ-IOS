//
//  TrainingRatingContentModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface TrainingRatingContentModel : DefaultModel

@property (nonatomic, strong) NSString* trainingId;
@property (nonatomic, strong) NSDictionary* basicInfo;
@property (nonatomic, strong) NSArray<NSDictionary*>* users;
@property (nonatomic, strong) NSArray<NSDictionary*>* contests;

@property (nonatomic, strong) NSMutableArray<NSNumber*>* ratingSections;
@property (nonatomic, strong) NSArray<UIColor*>* colorSections;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber*>*>* rating;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<UIColor*>*>* ratingColor;



- (instancetype)initWithTrainingId:(NSString*)trainingId;
- (void)fetchBasicInfo;
- (void)fetchUsers;
- (void)fetchContests;
- (void)processGraphData;

@end
