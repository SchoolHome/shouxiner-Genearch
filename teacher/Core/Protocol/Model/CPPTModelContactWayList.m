//
//  CPPTModelContactWayList.m
//  iCouple
//
//  Created by yl s on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelContactWayList.h"
#import "CPPTModelContactWay.h"

#define K_CONTACTWAYLIST_KEY_PRIMARY                @"list"
#define K_CONTACTWAYLIST_VALUE_NULL                 @""

//@interface CPPTModelContactWayList(/*Private API*/)
//{
//    NSMutableArray *contactWayList_;
//}
//
//@property (strong, nonatomic) NSMutableArray *contactWayList;
//
//@end

@implementation CPPTModelContactWayList

@synthesize contactWayList = contactWayList_;

- (NSMutableDictionary *)toJsonDict
{
    //    NSAssert(phoneNum,@"phoneNum must not be null!");
    
    NSMutableArray *contactWayArray = [[NSMutableArray alloc] init];
    
    for(CPPTModelContactWay* cway in self.contactWayList)
    {
        [contactWayArray addObject:[cway toJsonDict]];
    }
    
    NSMutableDictionary *contactWayListDict = [NSMutableDictionary dictionary];
    [contactWayListDict setObject:contactWayArray forKey:K_CONTACTWAYLIST_KEY_PRIMARY];
    
    return contactWayListDict;
}

@end
