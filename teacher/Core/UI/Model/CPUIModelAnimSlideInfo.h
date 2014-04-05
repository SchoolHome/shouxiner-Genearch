//
//  CPUIModelAnimSlideInfo.h
//  iCouple
//
//  Created by yl s on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUIModelAnimSlideInfo : NSObject
{
    NSNumber *_serialNum;   //int
    NSNumber *_duration;    //float
    NSString *_fileName;
    NSString *_mimeType;
}

@property (strong, nonatomic) NSNumber *serialNum;
@property (strong, nonatomic) NSNumber *duration;
@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) NSString *mimeType;

@end
