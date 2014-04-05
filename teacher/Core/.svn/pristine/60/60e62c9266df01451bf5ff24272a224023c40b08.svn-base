//
//  CPPTModelBindCoupleResult.m
//  iCouple
//
//  Created by yl s on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelBindCoupleResult.h"

#import "JSONKit.h"

#define K_ISUSER         @"isUser"
#define K_ICON          @"icon"

@implementation CPPTModelBindCoupleResult

@synthesize isUser = isUser_;
@synthesize icon = icon_;

+ (CPPTModelBindCoupleResult *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelBindCoupleResult *result = nil;
    
    if(jsonDict)
    {
        result = [[CPPTModelBindCoupleResult alloc] init];
        if(result)
        {
            result.isUser = [jsonDict objectForKey:K_ISUSER];
            result.icon = [jsonDict objectForKey:K_ICON];
        }
    }
    
    return result;
}

@end
