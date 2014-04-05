//
//  CPUIModelPetMagicAnim.h
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPUIModelPetConst.h"
#import "CPUIModelAnimSlideInfo.h"
#import "CPUIModelAudioSlideInfo.h"

@class CPDBModelPetData;

@interface CPUIModelPetMagicAnim : NSObject

+ (CPUIModelPetMagicAnim *)initFromProto:(CPDBModelPetData *)proto;
//private.
+ (CPUIModelPetMagicAnim *)initFromConfig:(NSString *)fname;

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

- (NSUInteger)audioSlideCount;
- (NSArray *)allAudioSlide;         //array elem : CPUIModelAudioSlideInfo

//invalid mtd.
- (void)markResDLDStatus:(PetResDownloadStatus) status;

@end
