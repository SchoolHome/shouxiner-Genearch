//
//  CPPTModelGroupInfoList.m
//  iCouple
//
//  Created by yl s on 12-6-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelGroupInfoList.h"
#import "CPPTModelGroupInfo.h"

#define K_GROUP_INFO_LIST_KEY_GROUPS          @"groups"

@implementation CPPTModelGroupInfoList

@synthesize groupInfos = _groupInfos;

+ (CPPTModelGroupInfoList *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelGroupInfoList *groupInfoList = nil;
    
    if(jsonDict)
    {
        groupInfoList = [[CPPTModelGroupInfoList alloc] init];
        if(groupInfoList)
        {
            NSMutableArray *groupInfos = [[NSMutableArray alloc] init];
            
            NSArray* groupInfosArray = [jsonDict objectForKey:K_GROUP_INFO_LIST_KEY_GROUPS];
            for(NSDictionary *dict in groupInfosArray)
            {
                CPPTModelGroupInfo *gInfo = [CPPTModelGroupInfo fromJsonDict:dict];
                [groupInfos addObject:gInfo];
            }
            
            groupInfoList.groupInfos = groupInfos;
        }
    }
    
    return groupInfoList;
}

@end
