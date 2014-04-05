//
//  CPOperationPersonalUpdate.m
//  iCouple
//
//  Created by yong wei on 12-3-17.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationPersonalUpdate.h"
#import "CPDBModelPersonalInfo.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPPTModelUserProfile.h"
#import "CPResManager.h"
#import "ModelConvertUtils.h"
#import "CPDBModelPersonalInfoData.h"
#import "CoreUtils.h"
#import "CPUserManager.h"
@implementation CPOperationPersonalUpdate
- (id) initWithInfo:(CPDBModelPersonalInfo *)dbPersonalInfo
{
    self = [super init];
    if (self)
    {
        updateType = UPDATE_PERSONAL_TYPE_DEFAULT;
        personalInfo = dbPersonalInfo;
    }
    return self;
}
- (id) initWithObj:(NSObject *)obj
{
    self = [super init];
    if (self)
    {
        updateType = UPDATE_PERSONAL_TYPE_PROTOCOL;
        personalObj = obj;
    }
    return self;
}
- (id) initWithPersonalInfoData:(CPDBModelPersonalInfoData *)personalInfoData
{
    self = [super init];
    if (self)
    {
        updateType = UPDATE_PERSONAL_TYPE_INFO_DATA;
        personalData = personalInfoData;
    }
    return self;
}
- (id) initWithInfo:(CPDBModelPersonalInfo *)dbPersonalInfo andType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        updateType = type;
        personalInfo = dbPersonalInfo;
    }
    return self;
}
- (id) initWithPersonalInfo:(CPUIModelPersonalInfo *)uiUpdatePersonalInfo andType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        updateType = type;
        uiPersonalInfo = uiUpdatePersonalInfo;
    }
    return self;
}
-(void)refresshPersonalData
{
    NSArray *allPersonalInfos = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPersonalInfos];
    if (allPersonalInfos&&[allPersonalInfos count]>0)
    {
        CPDBModelPersonalInfo *dbPersonal = [allPersonalInfos objectAtIndex:0];
        [[CPSystemEngine sharedInstance] initPersonalData:dbPersonal];
    }
    else 
    {
        CPLogError(@"get personal info error,is null");
    }
}
-(void)updatePersonal
{
    NSArray *oldPersonalInfos = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPersonalInfos];
    if ([oldPersonalInfos count]==0)
    {
        [[[CPSystemEngine sharedInstance] dbManagement] insertPersonalInfo:personalInfo];
    }
    else 
    {
        CPDBModelPersonalInfo *dbPersonal = [oldPersonalInfos objectAtIndex:0];
        if (dbPersonal)
        {
            [dbPersonal setNickName:personalInfo.nickName];
            [dbPersonal setName:personalInfo.name];
            [dbPersonal setLifeStatus:personalInfo.lifeStatus];
            [dbPersonal setSex:personalInfo.sex];
            [dbPersonal setSingleTime:personalInfo.singleTime];
            [dbPersonal setHasBaby:personalInfo.hasBaby];
            [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoWithID:dbPersonal.personalInfoID
                                                                                 obj:dbPersonal];
        }
        else 
        {
            [[[CPSystemEngine sharedInstance] dbManagement] deletePersonalInfos];
            [[[CPSystemEngine sharedInstance] dbManagement] insertPersonalInfo:personalInfo];
        }
    }
}
-(void)updatePersonalInfoByResponse
{
    CPPTModelUserProfile *ptUserProfile = (CPPTModelUserProfile *)personalObj;
    CPDBModelPersonalInfo *dbPersonalInfo = [ModelConvertUtils ptUserProfileToDbPersonalInfo:ptUserProfile];
    personalInfo = dbPersonalInfo;
    [self updatePersonal];
    CPDBModelResource *selfHeaderRes = [[[CPSystemEngine sharedInstance] resManager] getResPersonalDataWithCalssify:DATA_CLASSIFY_SELF_HEADER];
    if ((!selfHeaderRes||[selfHeaderRes isMarkDefault])&&ptUserProfile.icon)
    {
        [[[CPSystemEngine sharedInstance] resManager] addResourceByPersonalImgWithUrl:ptUserProfile.icon
                                                                          andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_HEADER]];
    }
    CPDBModelResource *selfBgRes = [[[CPSystemEngine sharedInstance] resManager] getResPersonalDataWithCalssify:DATA_CLASSIFY_SELF_BG];
    if ((!selfBgRes||[selfBgRes isMarkDefault])&&ptUserProfile.backgroundIcon)
    {
        [[[CPSystemEngine sharedInstance] resManager] addResourceByPersonalImgWithUrl:ptUserProfile.backgroundIcon
                                                                          andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_BG]];
    }
    CPDBModelResource *selfCoupleRes = [[[CPSystemEngine sharedInstance] resManager] getResPersonalDataWithCalssify:DATA_CLASSIFY_SELF_COUPLE];
    if ((!selfCoupleRes||[selfCoupleRes isMarkDefault])&&ptUserProfile.couple_icon)
    {
        [[[CPSystemEngine sharedInstance] resManager] addResourceByPersonalImgWithUrl:ptUserProfile.couple_icon
                                                                          andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_COUPLE]];
    }
    CPDBModelResource *selfBabyRes = [[[CPSystemEngine sharedInstance] resManager] getResPersonalDataWithCalssify:DATA_CLASSIFY_SELF_BABY];
    if ((!selfBabyRes||[selfBabyRes isMarkDefault])&&ptUserProfile.babyIcon)
    {
        [[[CPSystemEngine sharedInstance] resManager] addResourceByPersonalImgWithUrl:ptUserProfile.babyIcon
                                                                          andDataType:[NSNumber numberWithInt:DATA_CLASSIFY_SELF_BABY]];
    }

    
    NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
    [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
    [self refresshPersonalData];
    
    NSString *personalTimeStamp = [[CPSystemEngine sharedInstance] cachedPersonalTimeStamp];
    if (personalTimeStamp)
    {
        [[CPSystemEngine sharedInstance] backupSystemInfoWithMyProfileTimeStamp:personalTimeStamp];
        [[CPSystemEngine sharedInstance] setCachedPersonalTimeStamp:nil];
    }
}
-(void)updatePersonalInfoData
{
    NSArray *allPersonalInfos = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPersonalInfos];
    if (allPersonalInfos&&[allPersonalInfos count]>0)
    {
        CPDBModelPersonalInfo *dbPersonal = [allPersonalInfos objectAtIndex:0];
        CPDBModelPersonalInfoData *oldPersonalData = [[[CPSystemEngine sharedInstance] dbManagement] findPersonalInfoDataWithPersonalID:dbPersonal.personalInfoID andClassify:personalData.dataClassify];
        if ([personalData.dataType integerValue]==DATA_TYPE_AUDIO)
        {
            NSNumber *dbResID = [[[CPSystemEngine sharedInstance] resManager] addResourceByRecentWithUrl:personalData.dataContent andDataType:[NSNumber numberWithInt:RESOURCE_FILE_TYPE_SELF_RECENT]];
            if (dbResID)
            {
                [personalData setResourceID:dbResID];
                NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
                [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
            }
        }
        if (oldPersonalData)
        {
            [oldPersonalData setDataType:personalData.dataType];
            [oldPersonalData setDataContent:personalData.dataContent];
            [oldPersonalData setResourceID:personalData.resourceID];
            [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoDataWithID:oldPersonalData.personalInfoDataID
                                                                                     obj:oldPersonalData];
        }else 
        {
            [personalData setPersonalInfoID:dbPersonal.personalInfoID];
            [[[CPSystemEngine sharedInstance] dbManagement] insertPersonalInfoData:personalData];
        }
    }
    [self refresshPersonalData];
}
-(void)updatePersonalName
{
    [[CPSystemEngine sharedInstance] backupSystemInfoWithHasSavePersonalName:[NSNumber numberWithBool:NO]];
    [[[CPSystemEngine sharedInstance] userManager] updatePersonalWithNickName:uiPersonalInfo.nickName 
                                                                       andSex:uiPersonalInfo.sex
                                                                andHiddenBaby:uiPersonalInfo.hasBaby];

    NSInteger newLifeStatus = [uiPersonalInfo.lifeStatus integerValue];
    if (![uiPersonalInfo.hasBaby boolValue])
    {
        newLifeStatus +=128;
    }
    [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoWithID:uiPersonalInfo.personalInfoID
                                                                     andName:uiPersonalInfo.nickName
                                                                      andSex:uiPersonalInfo.sex
                                                               andLifeStatus:[NSNumber numberWithInt:newLifeStatus]];
    [self refresshPersonalData];
}
-(void)updatePersonalRecent
{
    CPDBModelPersonalInfoData *updatePersonalData = [[CPDBModelPersonalInfoData alloc] init];
    [updatePersonalData setUpdateTime:[CoreUtils getLongFormatWithNowDate]];
    [updatePersonalData setDataType:[NSNumber numberWithInt:uiPersonalInfo.recentType]];
    [updatePersonalData setDataContent:uiPersonalInfo.recentContent];
    [updatePersonalData setDataClassify:[NSNumber numberWithInt:DATA_CLASSIFY_RECENT]];
    
    if (uiPersonalInfo.recentType==PERSONAL_RECENT_TYPE_TEXT) 
    {
        [[[CPSystemEngine sharedInstance] userManager] updateMyRecentInfoWithContent:uiPersonalInfo.recentContent
                                                                             andType:uiPersonalInfo.recentType];
    }

    NSArray *allPersonalInfos = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPersonalInfos];
    if (allPersonalInfos&&[allPersonalInfos count]>0)
    {
        CPDBModelPersonalInfo *dbPersonal = [allPersonalInfos objectAtIndex:0];
        CPDBModelPersonalInfoData *oldPersonalData = [[[CPSystemEngine sharedInstance] dbManagement] findPersonalInfoDataWithPersonalID:dbPersonal.personalInfoID andClassify:updatePersonalData.dataClassify];
        if ([updatePersonalData.dataType integerValue]==DATA_TYPE_AUDIO)
        {
            NSNumber *dbResID = [[[CPSystemEngine sharedInstance] resManager] addResourceByRecentWithFilePath:updatePersonalData.dataContent andDataType:[NSNumber numberWithInt:RESOURCE_FILE_TYPE_SELF_RECENT]];
            if (dbResID)
            {
                [updatePersonalData setResourceID:dbResID];
                NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
                [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
            }
        }
        if (oldPersonalData)
        {
            [oldPersonalData setDataType:updatePersonalData.dataType];
            [oldPersonalData setDataContent:updatePersonalData.dataContent];
            [oldPersonalData setResourceID:updatePersonalData.resourceID];
            [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoDataWithID:oldPersonalData.personalInfoDataID
                                                                                     obj:oldPersonalData];
        }else 
        {
            [updatePersonalData setPersonalInfoID:dbPersonal.personalInfoID];
            [[[CPSystemEngine sharedInstance] dbManagement] insertPersonalInfoData:updatePersonalData];
        }
    }
    [self refresshPersonalData];
}
-(void)updatePersonalBaby
{
    [[[CPSystemEngine sharedInstance] userManager] removeBaby];

    [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoWithID:uiPersonalInfo.personalInfoID
                                                                  andHasBaby:uiPersonalInfo.hasBaby];
    [self refresshPersonalData];
}
-(void)updatePersonalSingleTime
{
    NSInteger lifestatus = [uiPersonalInfo.lifeStatus integerValue];
    NSNumber *relationType = [NSNumber numberWithInt:0];
    switch (lifestatus)
    {
        case PERSONAL_LIFE_STATUS_DEFAULT:
        case PERSONAL_LIFE_STATUS_SINGLE:
            break;
        case PERSONAL_LIFE_STATUS_CURSE:
            relationType = [NSNumber numberWithInt:1];
            break;
        case PERSONAL_LIFE_STATUS_COUPLE:
            relationType = [NSNumber numberWithInt:2];
            break;
        case PERSONAL_LIFE_STATUS_COUPLE_MARRIED:
        case PERSONAL_LIFE_STATUS_HAS_BABY:
            relationType = [NSNumber numberWithInt:3];
            break;
            
        default:
            break;
    }
    [[[CPSystemEngine sharedInstance] userManager] setSingleTimeWithDate:[CoreUtils getDateFormatWithLong:uiPersonalInfo.singleTime]
                                                         andRelationType:relationType];
    
    [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoWithID:uiPersonalInfo.personalInfoID
                                                               andSingleTime:uiPersonalInfo.singleTime];
    [self refresshPersonalData];
}

-(void)main
{
    @autoreleasepool 
    {
        switch (updateType)
        {
            case UPDATE_PERSONAL_TYPE_DEFAULT:
                [self updatePersonal];
                [self refresshPersonalData];
                break;
            case UPDATE_PERSONAL_TYPE_PROTOCOL:
                [self updatePersonalInfoByResponse];
                break;
            case UPDATE_PERSONAL_TYPE_INFO_DATA:
                [self updatePersonalInfoData];
                break;
            case UPDATE_PERSONAL_TYPE_NAME:
                [self updatePersonalName];
                break;
            case UPDATE_PERSONAL_TYPE_RECENT:
                [self updatePersonalRecent];
                break;
            case UPDATE_PERSONAL_TYPE_SINGLE_TIME:
                [self updatePersonalSingleTime];
                break;
            case UPDATE_PERSONAL_TYPE_BABY:
                [self updatePersonalBaby];
                break;
            default:
                break;
        }
    }
}

@end
