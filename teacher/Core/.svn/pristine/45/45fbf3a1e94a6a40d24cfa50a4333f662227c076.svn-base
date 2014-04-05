//
//  CPUIModelPetActionAnim.h
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPUIModelAnimSlideInfo.h"

#define PET_ACTION_ZHALNI          @"zhanli"
#define PET_ACTION_SHUOHUA         @"shuohua"
#define PET_ACTION_TING            @"ting"
#define PET_ACTION_XXX             @"XXX"

@class CPDBModelPetData;

@interface CPUIModelPetActionAnim : NSObject

+ (CPUIModelPetActionAnim *)initFromProto:(CPDBModelPetData *)proto;

- (NSString *)name;
- (NSString *)resourceID;
- (NSString *)petID;
- (NSString *)thumbNail;
- (NSNumber *)size;

- (NSNumber *)width;
- (NSNumber *)height;

- (BOOL)isAvailable;

- (NSInteger)downloadStatus; //enum: PetResDownloadStatus

- (NSUInteger)animSlideCount;
- (NSArray *)allAnimSlides;          //array elem : CPUIModelAnimSlideInfo

@end
