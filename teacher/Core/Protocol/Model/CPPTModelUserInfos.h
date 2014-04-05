//
//  CPPTModelUserInfos.h
//  iCouple
//
//  Created by yl s on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPTModelUserInfos : NSObject
{
    NSArray *userInfoList_;
}

+ (CPPTModelUserInfos *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@property (strong, nonatomic) NSArray *userInfoList; //element type: CPPTModelUserInfo.

@end
