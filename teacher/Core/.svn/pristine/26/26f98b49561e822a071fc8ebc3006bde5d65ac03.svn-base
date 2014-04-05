//
//  CPUIModelPetSmallAnim.h
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPUIModelAnimSlideInfo.h"

@class CPDBModelPetData;

@interface CPUIModelPetSmallAnim : NSObject
{
    UIImage *_defaultImg;
    NSArray *_animImgArray;
}

@property (strong, nonatomic) UIImage *defaultImg;
@property (strong, nonatomic) NSArray *animImgArray;

+ (CPUIModelPetSmallAnim *)initFromProto:(CPDBModelPetData *)proto;

- (NSString *)name;
- (NSString *)escapeChar;
- (NSString *)resourceID;
- (NSString *)thumbNail;
- (NSNumber *)size;

- (BOOL)isAvailable;

- (NSUInteger)animSlideCount;
- (NSArray *)allAnimSlides;          //array elem : CPUIModelAnimSlideInfo

@end
