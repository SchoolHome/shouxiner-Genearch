//
//  CPPTModelContactInfos.m
//  iCouple
//
//  Created by yl s on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelContactInfos.h"
#import "CPPTModelContact.h"

#define K_CONTACTINFO_KEY_PRIMARY           @"list"

#define K_CONTACTINFO_VALUE_NULL            @""

@interface CPPTModelContactInfos (/*Private Methods*/)
{
//    NSMutableArray *contactInfosArray_;
}

//@property (strong, nonatomic) NSMutableArray* contactInfosArray;

@end

@implementation CPPTModelContactInfos

- (id)init
{
	if ((self = [super init]))
	{   
//        self.contactInfosArray = [[NSMutableArray alloc] init];
	}
    
	return self;
}

//@synthesize contactInfosArray = contactInfosArray_;
@synthesize contactList = contactList_;

+ (CPPTModelContactInfos *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelContactInfos *contactInfos = nil;
    
    if(jsonDict)
    {
        contactInfos = [[CPPTModelContactInfos alloc] init];
        if(contactInfos)
        {
            NSMutableArray *contactInfosArray = [[NSMutableArray alloc] init];
            
            NSArray *contactArray = [jsonDict objectForKey:K_CONTACTINFO_KEY_PRIMARY];
            for(NSDictionary *dict in contactArray)
            {
                CPPTModelContact *contact = [CPPTModelContact fromJsonDict:dict];
                [contactInfosArray addObject:contact];
            }
            
            contactInfos.contactList = contactInfosArray;
        }
    }
    
    return contactInfos;
}

- (NSMutableDictionary *) toJsonDict
{
    if(!self.contactList)
    {
        CPLogWarn(@"invalid contact infos!!!");
        return nil;
    }
    
    NSMutableArray *contactArray = [[NSMutableArray alloc] init];
    
    for(CPPTModelContact* contact in self.contactList)
    {
        [contactArray addObject:[contact toJsonDict]];
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:contactArray forKey:K_CONTACTINFO_KEY_PRIMARY];
    
    return dict;
}

@end






