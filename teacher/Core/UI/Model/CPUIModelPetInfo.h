//
//  CPUIModelPetInfo.h
//  iCouple
//
//  Created by yl s on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPDBModelPetInfo;
@class CPUIModelPetElemInfo;

@interface CPUIModelPetInfo : NSObject

+ (CPUIModelPetInfo *)initFromProto:(CPDBModelPetInfo *)proto;

- (NSString *)petID;
- (CPUIModelPetElemInfo *)petElemOfResID:(NSString *)resID;

@end
