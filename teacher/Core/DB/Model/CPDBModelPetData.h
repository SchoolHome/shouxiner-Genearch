//
//  CPDBModelPetData.h
//  iCouple
//
//  Created by yl s on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPDBModelPetData : NSObject

@property (strong, nonatomic) NSNumber *localID;
@property (strong, nonatomic) NSString *dataID;
@property (strong, nonatomic) NSNumber *dataType;
@property (strong, nonatomic) NSNumber *dataSize;
@property (strong, nonatomic) NSNumber *category;   //FeelingType
@property (strong, nonatomic) NSNumber *isDefault;
//@property (strong, nonatomic) NSString *petID;
@property (strong, nonatomic) NSNumber *petID; //petLocalID
@property (strong, nonatomic) NSString *petResID; //petResID
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *thumb;
@property (strong, nonatomic) NSString *remoteURL;
@property (strong, nonatomic) NSString *localPath;
@property (strong, nonatomic) NSNumber *isAvailable;
@property (strong, nonatomic) NSNumber *mark;

@end
