//
//  CPPTModelGetUsersResult.m
//  iCouple
//
//  Created by yl s on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelGetUsersResult.h"

#define K_GET_USER_RESULT_KEY_UNAME             @"uname"
#define K_GET_USER_RESULT_KEY_PHONE_NUM         @"phnum"
#define K_GET_USER_RESULT_KEY_PHONE_AREA        @"pharea"
#define K_GET_USER_RESULT_VALUE_NULL            @""

@implementation CPPTModelGetUsersResult

@synthesize uName = _uName;
@synthesize phArea = _phArea;
@synthesize phNum = _phNum;

+ (CPPTModelGetUsersResult *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelGetUsersResult *ur = nil;
    
    if(jsonDict)
    {
        ur = [[CPPTModelGetUsersResult alloc] init];
        if(ur)
        {
            ur.uName = [jsonDict objectForKey:K_GET_USER_RESULT_KEY_UNAME];
            ur.phNum = [jsonDict objectForKey:K_GET_USER_RESULT_KEY_PHONE_NUM];
            ur.phArea = [jsonDict objectForKey:K_GET_USER_RESULT_KEY_PHONE_AREA];
        }
    }
    
    return ur;

}

@end
