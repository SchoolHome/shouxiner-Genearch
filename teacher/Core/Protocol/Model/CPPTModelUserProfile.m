//
//  CPPTModelUserProfile.m
//  iCouple
//
//  Created by yl s on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelUserProfile.h"

#define K_USER_PROFILE_KEY_UNAME                @"uname"
#define K_USER_PROFILE_KEY_NICKNAME             @"nickname"
#define K_USER_PROFILE_KEY_BACKGROUND           @"background"
#define K_USER_PROFILE_KEY_GENDER               @"gender"
#define K_USER_PROFILE_KEY_ICON                 @"icon"
#define K_USER_PROFILE_KEY_BABYICON             @"babyIcon"
#define K_USER_PROFILE_KEY_LIFESTATUS           @"lifestatus"

#define K_USER_PROFILE_KEY_COUPLE               @"couple"
#define K_USER_PROFILE_KEY_COUPLE_UNAME         @"uname"
#define K_USER_PROFILE_KEY_COUPLE_NICKNAME      @"nickname"
#define K_USER_PROFILE_KEY_COUPLE_ICON          @"icon"

#define K_USER_PROFILE_KEY_RELATION_DATE        @"relationDate"
#define K_USER_PROFILE_KEY_HIDEBABY             @"hidebaby"

//only avalaible in user profile( N/A in self proifle)
#define K_USER_PROFILE_KEY_RELATION             @"relation"

#define K_USER_PROFILE_VALUE_NULL               @""

@implementation CPPTModelUserProfile

@synthesize uName = _uName;
@synthesize nickName = _nickName;
@synthesize backgroundIcon = _backgroundIcon;
@synthesize gender = _gender;
@synthesize icon = _icon;
@synthesize babyIcon = _babyIcon;
@synthesize lifeStatus = _lifeStatus;
@synthesize couple_uName = _couple_uName;
@synthesize couple_nickName = _couple_nickName;
@synthesize couple_icon = _couple_icon;
@synthesize relationDate = _relationDate;
@synthesize hideBaby = _hideBaby;
@synthesize relation = _relation;

+ (CPPTModelUserProfile *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelUserProfile *profile = nil;
    
    if(jsonDict)
    {
        profile = [[CPPTModelUserProfile alloc] init];
        if(profile)
        {
            profile.uName = [jsonDict objectForKey:@"uid"];
            profile.nickName = [jsonDict objectForKey:@"username"];
            profile.backgroundIcon = [jsonDict objectForKey:K_USER_PROFILE_KEY_BACKGROUND];
            profile.gender = [jsonDict objectForKey:K_USER_PROFILE_KEY_GENDER];
            profile.icon = [jsonDict objectForKey:@"avatar"];
            profile.babyIcon = [jsonDict objectForKey:K_USER_PROFILE_KEY_BABYICON];
            profile.lifeStatus = [jsonDict objectForKey:K_USER_PROFILE_KEY_LIFESTATUS];
            profile.relationDate = [jsonDict objectForKey:K_USER_PROFILE_KEY_RELATION_DATE];
            profile.hideBaby = [jsonDict objectForKey:K_USER_PROFILE_KEY_HIDEBABY];
            profile.relation = [jsonDict objectForKey:K_USER_PROFILE_KEY_RELATION];
            
            NSDictionary *dict = [jsonDict objectForKey:K_USER_PROFILE_KEY_COUPLE];
            if(dict&& (id)dict != [NSNull null])
            {
                profile.couple_uName = [dict objectForKey:K_USER_PROFILE_KEY_COUPLE_UNAME];
                profile.couple_nickName = [dict objectForKey:K_USER_PROFILE_KEY_NICKNAME];
                profile.couple_icon = [dict objectForKey:K_USER_PROFILE_KEY_COUPLE_ICON];
            }
        }
    }
    
    return profile;
}

- (NSMutableDictionary *)toJsonDict
{
    return nil;
}

@end
