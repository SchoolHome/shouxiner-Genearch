//
//  CPOperationResDownloadResponse.m
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationResDownloadResponse.h"
#import "CPDBModelResource.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPUIModelMessage.h"
#import "CPMsgManager.h"
#import "CPUIModelManagement.h"
#import "CoreUtils.h"
#import "CPResManager.h"
@implementation CPOperationResDownloadResponse
- (id) initWithResID:(NSNumber *)localResID andResCode:(NSNumber *)resCode andTimeStamp:(NSString *)timeStamp andTmpFilePath:(NSString *)filePath
{
    self = [super init];
    if (self)
    {
        resDownloadID = localResID;
        resultCode = resCode;
        updatetTimeStamp = timeStamp;
        tmpFilePath = filePath;
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance] dbManagement] getResWithID:resDownloadID];
        if ([resultCode integerValue]==RES_CODE_SUCESS)
        {
            NSString *newFilePath = [[[CPSystemEngine sharedInstance] resManager] getResourcePathWithRes:dbRes];
            if ([CoreUtils stringIsNotNull:tmpFilePath]&&newFilePath)
            {
                [CoreUtils moveFileWithSrcPath:tmpFilePath andDstPath:newFilePath];
                [[[CPSystemEngine sharedInstance] dbManagement] updateResourceDownloadedWithID:resDownloadID];
                NSNumber *updateDateTime = [CoreUtils getLongFormatWithDateString:updatetTimeStamp];
                [[[CPSystemEngine sharedInstance] dbManagement] updateResourceUpdateTimeWithID:resDownloadID andTime:updateDateTime];
            }
        }
            
        NSInteger dbResObjType = [dbRes.objType integerValue];
//        NSInteger dbResType = [dbRes.type integerValue];
        switch (dbResObjType)
        {
            case RESOURCE_FILE_CP_TYPE_MSG:
//                [[CPSystemEngine sharedInstance] updateTagByMsgGroupList];
            {
                CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:dbRes.objID];
                if ([dbMsg.contentType integerValue]==MSG_CONTENT_TYPE_VIDEO&&[dbRes isImgMsg])
                {
                    if ([resultCode integerValue]==RES_CODE_SUCESS)
                    {
                        [[CPSystemEngine sharedInstance] updateTagByMsgGroupOnly];
                    }
                }
                else
                {
                    CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:dbRes.objID];
                    if (dbMsg.msgGroupID)
                    {
                        if ([resultCode integerValue]==RES_CODE_SUCESS)
                        {
                            [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID andStatus:[NSNumber numberWithInt:MSG_SEND_STATE_DOWN_SUCESS]];
                        }
                        else 
                        {
                            [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID andStatus:[NSNumber numberWithInt:MSG_SEND_STATE_DOWN_ERROR]];
                        }
                        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
//                        [[CPSystemEngine sharedInstance] updateTagByMsgGroupMsgReload];
                    }
                }
            }
                break;
            case RESOURCE_FILE_CP_TYPE_HEADER:
                if ([resultCode integerValue]==RES_CODE_SUCESS)
                {
                    [[CPSystemEngine sharedInstance] updateTagByUsersHeaderImgWithUserID:dbRes.objID];
                    [[CPSystemEngine sharedInstance] updateTagByMsgGroupList];
                }
                break;
            case RESOURCE_FILE_CP_TYPE_TEMP_IMG:
            {
                NSMutableDictionary *resDic = [[NSMutableDictionary alloc] init];
                CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance] dbManagement] findResourceWithID:resDownloadID];
                if (dbRes.serverUrl)
                {
                    [resDic setObject:dbRes.serverUrl forKey:resource_server_url];
                }
                [[CPSystemEngine sharedInstance] updateTagByGetTempResServerUrlWithDic:resDic];

            }
                break;
            case RESOURCE_FILE_CP_TYPE_GROUPP_MEM_HEADER:
                break;
            case RESOURCE_FILE_CP_TYPE_SELF_HEADER:
            case RESOURCE_FILE_CP_TYPE_SELF_BG:
            case RESOURCE_FILE_CP_TYPE_SELF_BABY:
            case RESOURCE_FILE_CP_TYPE_SELF_COUPLE:
                [[CPSystemEngine sharedInstance] updateTagByPersonalInfo];
                break;
            default:
                break;
        }

    }
}

@end
