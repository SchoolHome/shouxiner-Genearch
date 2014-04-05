//
//  CPPTModelAddFriendResult.h
//  iCouple
//
//  Created by yl s on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPTModelInviteFriendResult : NSObject

@property (strong, nonatomic) NSNumber *isUSer;
@property (strong, nonatomic) NSString *icon;

+ (CPPTModelInviteFriendResult *)fromJsonDict:(NSDictionary *)jsonDict;

@end
