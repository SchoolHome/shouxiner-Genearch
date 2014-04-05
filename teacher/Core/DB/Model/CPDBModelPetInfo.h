//
//  CPDBModelPetInfo.h
//  iCouple
//
//  Created by yl s on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPDBModelPetInfo : NSObject

@property (strong, nonatomic) NSNumber *localID;
@property (strong, nonatomic) NSString *petID;
@property (strong, nonatomic) NSString *petName;
@property (strong, nonatomic) NSNumber *isDefault;
@property (strong, nonatomic) NSString *localPath;
@property (strong, nonatomic) NSString *remoteURL;
@property (strong, nonatomic) NSNumber *mark;

@end
