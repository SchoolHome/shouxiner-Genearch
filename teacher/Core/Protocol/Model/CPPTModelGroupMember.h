//
//  CPPTModelGroupMember.h
//  iCouple
//
//  Created by yl s on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPTModelGroupMember : NSObject
{
    NSString *_jid;
    NSString *_nickName;
    NSString *_icon;
}

@property (strong, nonatomic) NSString *jid;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *icon;

+ (CPPTModelGroupMember *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@end
