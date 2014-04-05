//
//  CPPTModelSearchResultUserInfo.h
//  iCouple
//
//  Created by yl s on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONKit.h"

@interface CPPTModelSearchResultUserInfo : NSObject
{    
    NSString *uName_;       
    NSString *nickName_;     
    NSNumber *gender_;       
    NSString *icon_;
    NSNumber *relationShip_;  
}

@property (strong, nonatomic) NSString *uName;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSNumber *gender;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSNumber *relationShip;

+ (CPPTModelSearchResultUserInfo *)fromJsonString:(NSString *)jsonStr;
+ (CPPTModelSearchResultUserInfo *)fromJsonDict:(NSDictionary *)jsonDict;

@end
