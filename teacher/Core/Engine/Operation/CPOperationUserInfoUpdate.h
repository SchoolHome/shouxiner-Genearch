//
//  CPOperationUserInfoUpdate.h
//  iCouple
//
//  Created by yong wei on 12-5-16.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"
typedef enum
{
    UPDATE_USER_TYPE_DEFAULT = 0,
    UPDATE_USER_TYPE_PROTOCOL = 1,
    UPDATE_USER_TYPE_INFO_DATA = 2,
    
}UpdateUserType;
@class CPDBModelUserInfo;
@class CPDBModelUserInfoData;

@interface CPOperationUserInfoUpdate : CPOperation
{
    NSInteger updateType;
    CPDBModelUserInfo *dbUserInfo;
    NSObject *userObj;
    CPDBModelUserInfoData *dbUserData;
    NSString *userName;
}
- (id) initWithInfo:(CPDBModelUserInfo *)dbUserInfo withUserName:(NSString *)uName;
- (id) initWithObj:(NSObject *)obj withUserName:(NSString *)uName;
- (id) initWithUserInfoData:(CPDBModelUserInfoData *)userInfoData withUserName:(NSString *)uName;

@end
