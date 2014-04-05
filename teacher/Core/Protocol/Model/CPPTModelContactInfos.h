//
//  CPPTModelContactInfos.h
//  iCouple
//
//  Created by yl s on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPTModelContactInfos : NSObject
{
    NSArray *contactList_;
}

+ (CPPTModelContactInfos *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@property (strong, nonatomic) NSArray *contactList; //element type: CPPTModelContact.

@end
