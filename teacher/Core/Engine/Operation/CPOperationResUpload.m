//
//  CPOperationResUpload.m
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationResUpload.h"
#import "CPDBModelResource.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPResManager.h"
#import "CPDBModelPersonalInfoData.h"
#import "CPDBModelPersonalInfo.h"
#import "CoreUtils.h"
@implementation CPOperationResUpload
- (id) initWithRes:(CPDBModelResource *)dbRes res_data:(NSData *)resData
{
    self = [super init];
    if (self)
    {
        dbResUpload = dbRes;
        resDataUpload = resData;
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
-(void)main
{
    @autoreleasepool 
    {
        NSNumber *resID = [[[CPSystemEngine sharedInstance] dbManagement] insertResource:dbResUpload];
//        [[[CPSystemEngine sharedInstance] dbManagement] initResources];
        CPDBModelPersonalInfo *personalInfo = [[[CPSystemEngine sharedInstance] dbManagement] findPersonalInfo];
        if (personalInfo&&resID)
        {
            CPDBModelPersonalInfoData *personalInfoOldData = [[[CPSystemEngine sharedInstance] dbManagement] findPersonalInfoDataWithPersonalID:personalInfo.personalInfoID andClassify:dbResUpload.objType];

            if (personalInfoOldData)
            {
                [personalInfoOldData setResourceID:resID];
                [personalInfoOldData setUpdateTime:[CoreUtils getLongFormatWithNowDate]];
                [[[CPSystemEngine sharedInstance] dbManagement] updatePersonalInfoDataWithID:personalInfoOldData.personalInfoDataID
                                                                                         obj:personalInfoOldData];
            }
            else 
            {
                CPDBModelPersonalInfoData *personalInfoData = [[CPDBModelPersonalInfoData alloc] init];
                [personalInfoData setDataType:dbResUpload.type];
                [personalInfoData setDataClassify:dbResUpload.objType];
                [personalInfoData setPersonalInfoID:personalInfo.personalInfoID];
                [personalInfoData setResourceID:resID];
                [personalInfoData setUpdateTime:[CoreUtils getLongFormatWithNowDate]];
                [[[CPSystemEngine sharedInstance] dbManagement] insertPersonalInfoData:personalInfoData];

            }
            [self refresshPersonalData];
        }
        NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
        [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
    }
}

@end
