//
//  CPPTModelGetUsersResultList.m
//  iCouple
//
//  Created by yl s on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelGetUsersResultList.h"

#import "CPPTModelGetUsersResult.h"

#define K_GET_USERS_RESULT_LIST_KEY_LIST          @"list"

@implementation CPPTModelGetUsersResultList

@synthesize resutlList = _resultList;

+ (CPPTModelGetUsersResultList *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelGetUsersResultList *result = nil;
    
    if(jsonDict)
    {
        result = [[CPPTModelGetUsersResultList alloc] init];
        if(result)
        {
            NSMutableArray *urAry = [[NSMutableArray alloc] init];
            NSArray * contactArray = [jsonDict objectForKey:K_GET_USERS_RESULT_LIST_KEY_LIST];
            for(NSDictionary *dict in contactArray)
            {
                CPPTModelGetUsersResult *ur = [CPPTModelGetUsersResult fromJsonDict:dict];
                [urAry addObject:ur];
            }
            
            result.resutlList = urAry;
        }
    }
    
    return result;
}

@end
