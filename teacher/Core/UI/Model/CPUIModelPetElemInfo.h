//
//  CPUIModelPetElemInfo.h
//  iCouple
//
//  Created by yl s on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUIModelPetElemInfo : NSObject

@property (strong, nonatomic) NSString *elemID;
@property (strong, nonatomic) NSString *elemName;
@property (strong, nonatomic) NSString *elemPetResID;
@property (strong, nonatomic) NSNumber *elemType;   //PetDataType
@property (strong, nonatomic) NSNumber *elemSize;
@property (strong, nonatomic) NSNumber *elemCategory; //only used by feeling
@property (strong, nonatomic) NSString *elemThumb;
@property (strong, nonatomic) NSString *elemRemoteURL;

@end
