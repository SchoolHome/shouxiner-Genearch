//
//  CPPTModelGroupInfo.h
//  iCouple
//
//  Created by yl s on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPTModelGroupInfo : NSObject
{
    NSString *_jid;
    NSString *_name;
    NSString *_ownerJID;
    
    NSArray *_memberList;   //element type: CPPTModelGroupMember.
}

@property (strong, nonatomic) NSString *jid;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *ownerJID;

@property (strong, nonatomic) NSArray *memberList;

+ (CPPTModelGroupInfo *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@end
