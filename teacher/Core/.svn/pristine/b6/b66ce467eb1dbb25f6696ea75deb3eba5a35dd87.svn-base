//
//  CPOperationUserInfoUpdate.m
//  iCouple
//
//  Created by yong wei on 12-5-16.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationUserInfoUpdate.h"
#import "CPDBModelUserInfo.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPPTModelUserProfile.h"
#import "CPResManager.h"
#import "ModelConvertUtils.h"
#import "CPDBModelUserInfoData.h"
#import "CPUserManager.h"
#import "CPMsgManager.h"
@implementation CPOperationUserInfoUpdate


- (id) initWithInfo:(CPDBModelUserInfo *)userInfo withUserName:(NSString *)uName
{
    self = [super init];
    if (self)
    {
        dbUserInfo = userInfo;
        userName = uName;
        updateType = UPDATE_USER_TYPE_DEFAULT;
    }
    return self;
}
- (id) initWithObj:(NSObject *)obj withUserName:(NSString *)uName
{
    self = [super init];
    if (self)
    {
        userObj = obj;
        userName = uName;
        updateType = UPDATE_USER_TYPE_PROTOCOL;
    }
    return self;
}
- (id) initWithUserInfoData:(CPDBModelUserInfoData *)userInfoData withUserName:(NSString *)uName
{
    self = [super init];
    if (self)
    {
        dbUserData = userInfoData;
        userName = uName;
        updateType = UPDATE_USER_TYPE_INFO_DATA;
    }
    return self;
}
-(void)refresshUserDataWithDbUser:(CPDBModelUserInfo *)userInfo
{
    [[[CPSystemEngine sharedInstance] dbManagement] refreshUserCachedWithUser:userInfo];
    [[[CPSystemEngine sharedInstance] userManager] refreshUserInfosCachedUiWithUser:userInfo];
    [[[CPSystemEngine sharedInstance] userManager] refreshCoupleModelWithUser:userInfo];
    
    [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupWithUserInfo:userInfo];
    [[[CPSystemEngine sharedInstance] msgManager] refreshCurrentMsgGroupWithUserInfo:userInfo];
    [[[CPSystemEngine sharedInstance] msgManager] refreshCoupleMsgGroupWithUserInfo:userInfo];
}
-(void)updateUser
{
    //需要重置好友的couple数据
        
    CPDBModelUserInfo *oldDbUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] getUserInfoByCachedWithName:userName];
    if (oldDbUserInfo&&oldDbUserInfo.userInfoID&&![oldDbUserInfo isSysUser])
    {
        [oldDbUserInfo setNickName:dbUserInfo.nickName];
        [oldDbUserInfo setSex:dbUserInfo.sex];
        [oldDbUserInfo setLifeStatus:dbUserInfo.lifeStatus];
        [oldDbUserInfo setHasBaby:dbUserInfo.hasBaby];
        [oldDbUserInfo setSingleTime:dbUserInfo.singleTime];
        [oldDbUserInfo setCoupleNickName:dbUserInfo.coupleNickName];
        [oldDbUserInfo setCoupleAccount:dbUserInfo.coupleAccount];
        [[[CPSystemEngine sharedInstance] dbManagement] updateUserInfoWithID:oldDbUserInfo.userInfoID
                                                                         obj:oldDbUserInfo];
        CPDBModelUserInfo *newDbUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] findUserInfoWithID:oldDbUserInfo.userInfoID];
        [self refresshUserDataWithDbUser:newDbUserInfo];
    }
}

-(void)main
{
    @autoreleasepool 
    {
        switch (updateType)
        {
            case UPDATE_USER_TYPE_DEFAULT:
                [self updateUser];
                break;
            case UPDATE_USER_TYPE_PROTOCOL:
            {
                CPPTModelUserProfile *ptUserProfile = (CPPTModelUserProfile *)userObj;
                CPDBModelUserInfo *oldDbUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] getUserInfoByCachedWithName:userName];
                if (oldDbUserInfo&&oldDbUserInfo.userInfoID)
                {
                    CPDBModelUserInfo *dbResponseUserInfo = [ModelConvertUtils ptUserProfileToDbUserInfo:ptUserProfile];
                    if (ptUserProfile.icon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByUserImgWithUrl:ptUserProfile.icon
                                                                                      andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_HEADER] 
                                                                                        andUserID:oldDbUserInfo.userInfoID];
                    }
                    if (ptUserProfile.backgroundIcon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByUserImgWithUrl:ptUserProfile.backgroundIcon
                                                                                      andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_BG]andUserID:oldDbUserInfo.userInfoID];
                    }
                    if (ptUserProfile.couple_icon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByUserImgWithUrl:ptUserProfile.couple_icon
                                                                                      andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_COUPLE]
                                                                                        andUserID:oldDbUserInfo.userInfoID];
                    }
                    if (ptUserProfile.babyIcon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByUserImgWithUrl:ptUserProfile.babyIcon
                                                                                      andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_BABY]
                                                                                        andUserID:oldDbUserInfo.userInfoID];
                    }
                    dbUserInfo = dbResponseUserInfo;
                    NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
                    [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
                    [self updateUser];
                }
                else
                {
                    if (ptUserProfile.icon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByTempHeaderWithServerUrl:ptUserProfile.icon];
                    }
                    if (ptUserProfile.backgroundIcon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByTempHeaderWithServerUrl:ptUserProfile.backgroundIcon];
                    }
                    if (ptUserProfile.couple_icon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByTempHeaderWithServerUrl:ptUserProfile.couple_icon];
                    }
                    if (ptUserProfile.babyIcon)
                    {
                        [[[CPSystemEngine sharedInstance] resManager] addResourceByTempHeaderWithServerUrl:ptUserProfile.babyIcon];
                    }
                    NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
                    [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
                }
            }
                break;
            case UPDATE_USER_TYPE_INFO_DATA:
            {
                CPDBModelUserInfo *oldDbUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] getUserInfoByCachedWithName:userName];
                if (oldDbUserInfo&&oldDbUserInfo.userInfoID)
                {
                    CPDBModelUserInfoData *oldUserData = [[[CPSystemEngine sharedInstance] dbManagement] findUserInfoDataWithUserID:oldDbUserInfo.userInfoID andClassify:dbUserData.dataClassify];
                    if ([dbUserData.dataType integerValue]==DATA_TYPE_AUDIO)
                    {
                        NSNumber *dbResID = [[[CPSystemEngine sharedInstance] resManager] addResourceByUserRecentWithUrl:dbUserData.dataContent andDataType:[NSNumber numberWithInt:RESOURCE_FILE_TYPE_SELF_RECENT] andUserID:oldDbUserInfo.userInfoID];
                        if (dbResID)
                        {
                            [dbUserData setResourceID:dbResID];
                            NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
                            [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
                        }
                    }
                    if (oldUserData)
                    {
                        [oldUserData setDataType:dbUserData.dataType];
                        [oldUserData setDataContent:dbUserData.dataContent];
                        [oldUserData setResourceID:dbUserData.resourceID];
                        [[[CPSystemEngine sharedInstance] dbManagement] updateUserInfoDataWithID:oldUserData.userInfoDataID
                                                                                             obj:oldUserData];
                    }else 
                    {
                        [dbUserData setUserInfoID:oldDbUserInfo.userInfoID];
                        [[[CPSystemEngine sharedInstance] dbManagement] insertUserInfoData:dbUserData];
                    }
                    CPDBModelUserInfo *newDbUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] findUserInfoWithID:oldDbUserInfo.userInfoID];
                    [self refresshUserDataWithDbUser:newDbUserInfo];
                }
            }
                break;
            default:
                break;
        }
    }
}

@end
