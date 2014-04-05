//
//  CPPTModelUserProfile.h
//  iCouple
//
//  Created by yl s on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPTModelUserProfile : NSObject
{
    NSString *_uName;
    NSString *_nickName;
    NSString *_backgroundIcon;
    NSNumber *_gender;
    NSString *_icon;
    NSString *_babyIcon;
    NSNumber *_lifeStatus;
    NSString *_couple_uName;
    NSString *_couple_nickName;
    NSString *_couple_icon;
    NSString *_relationDate;
    NSNumber *_hideBaby; //bool
    NSNumber *_relation; //only available in user profile.
}

@property (strong, nonatomic) NSString *uName;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *backgroundIcon;
@property (strong, nonatomic) NSNumber *gender;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *babyIcon;
@property (strong, nonatomic) NSNumber *lifeStatus;
@property (strong, nonatomic) NSString *couple_uName;
@property (strong, nonatomic) NSString *couple_nickName;
@property (strong, nonatomic) NSString *couple_icon;
@property (strong, nonatomic) NSString *relationDate;
@property (strong, nonatomic) NSNumber *hideBaby;
@property (strong, nonatomic) NSNumber *relation;

+ (CPPTModelUserProfile *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@end
