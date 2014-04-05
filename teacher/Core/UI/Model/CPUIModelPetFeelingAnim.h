//
//  CPUIModelPetFeelingAnim.h
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPUIModelPetConst.h"
#import "CPUIModelAnimSlideInfo.h"
#import "CPUIModelAudioSlideInfo.h"

#define PET_FEELING_TYPE_LOVE           @"love"
#define PET_FEELING_TYPE_HAPPY          @"happy"
#define PET_FEELING_TYPE_SAD            @"sad"

typedef enum
{
    FeelingCategoryUnknown = 0,
    FeelingCategoryLove = 1,
    FeelingCategoryhappy = 2,
    FeelingCategorySad = 3,
}FeelingCategory;

@class CPDBModelPetData;

@interface CPUIModelPetFeelingAnim : NSObject

+ (CPUIModelPetFeelingAnim *)initFromProto:(CPDBModelPetData *)proto;

- (NSString *)name;
- (NSString *)resourceID;
- (NSString *)petID;
- (NSString *)thumbNail;
- (FeelingCategory)category;
- (NSNumber *)size;

- (NSString *)senderDesc;
- (NSString *)receiverDesc;

- (NSNumber *)width;
- (NSNumber *)height;

- (BOOL)isAvailable;

- (NSInteger)downloadStatus; //enum: PetResDownloadStatus

- (NSUInteger)animSlideCount;
- (NSArray *)allAnimSlides;          //array elem : CPUIModelAnimSlideInfo

- (NSUInteger)audioSlideCount;
- (NSArray *)allAudioSlide;         //array elem : CPUIModelAudioSlideInfo

//invalid mtd.
- (void)markResDLDStatus:(PetResDownloadStatus) status;

@end
