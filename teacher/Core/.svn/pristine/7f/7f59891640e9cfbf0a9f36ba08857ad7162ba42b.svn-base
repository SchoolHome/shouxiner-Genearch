//
//  CPOperationResUploadResponse.m
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationResUploadResponse.h"
#import "CPDBModelResource.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPMsgManager.h"
#import "CPResManager.h"
#import "CPHttpEngine.h"
#import "CoreUtils.h"
#import "CPDBModelResource.h"
#import "CPUserManager.h"
#import "CPUIModelPersonalInfo.h"
#import "CPUIModelMessage.h"
@implementation CPOperationResUploadResponse

- (id) initWithResID:(NSNumber *)localResID andResCode:(NSNumber *)resCode res_url:(NSString *)resUrl andTimeStamp:(NSString *)timeStamp
{
    self = [super init];
    if (self)
    {
        resUploadID = localResID;
        resUploadUrl = resUrl;
        updateTimeStamp = timeStamp;
        resultCode = resCode;
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        CPLogInfo(@"resultCode is %@,resUploadID is %@,resUploadUrl is %@",resultCode,resUploadID,resUploadUrl);
        if (![resultCode integerValue]==RES_CODE_SUCESS)
        {
            [[[CPSystemEngine sharedInstance] resManager] removeUploadResWithResID:resUploadID];
            CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance] dbManagement] getResWithID:resUploadID];
            NSInteger dbResObjType = [dbRes.objType integerValue];
            switch (dbResObjType)
            {
                case RESOURCE_FILE_CP_TYPE_MSG:
                    [[[CPSystemEngine sharedInstance] msgManager] removeWillSendXmppMsg:dbRes.objID];
                    CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:dbRes.objID];
                    if (dbMsg.msgGroupID)
                    {
                        [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID 
                                                                                  andStatus:[NSNumber numberWithInt:MSG_SEND_STATE_SEND_ERROR]];
                        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
                    }
                    break;
            }
            return;
        }
        BOOL isMark = YES;
        if ([CoreUtils stringIsNotNull:resUploadUrl])
        {
            CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance] dbManagement] getResWithID:resUploadID];
            CPLogInfo(@"dbRes.objType is %@,dbRes.type is %@",dbRes.objType,dbRes.type);
            NSInteger dbResObjType = [dbRes.objType integerValue];
            switch (dbResObjType)
            {
                case RESOURCE_FILE_CP_TYPE_MSG:
                {
                    NSRange jpgRange = [resUploadUrl rangeOfString:@".jpg"];
                    if (jpgRange.length>1&&[dbRes isVideoMsg])
                    {
                        if ([CoreUtils stringIsNotNull:resUploadUrl])
                        {
                            CPDBModelResource *dbResThub = [[CPDBModelResource alloc] init];
                            NSRange mp4Range = [dbRes.fileName rangeOfString:@"."];
                            NSString *fileUUID = @"";
                            if (mp4Range.length>0)
                            {
                                fileUUID = [dbRes.fileName substringToIndex:mp4Range.location];
                            }
                            [dbResThub setFileName:[NSString stringWithFormat:@"%@.jpg",fileUUID]];
                            [dbResThub setFilePrefix:dbRes.filePrefix];
                            [dbResThub setType:[NSNumber numberWithInt:RESOURCE_FILE_TYPE_MSG_IMG]];
                            [dbResThub setMark:[NSNumber numberWithInt:MARK_DEFAULT]];
                            [dbResThub setServerUrl:resUploadUrl];
                            [dbResThub setMimeType:@"image/jpeg"];
                            [dbResThub setObjType:[NSNumber numberWithInt:RESOURCE_FILE_CP_TYPE_MSG]];
                            [dbResThub setObjID:dbRes.objID];
                            [[[CPSystemEngine sharedInstance] dbManagement] insertResource:dbResThub];
                            
                        }

                        
                        NSString *resPath = [[[CPSystemEngine sharedInstance] resManager] getResourcePathWithResID:dbRes.resID];
                        [[[CPSystemEngine sharedInstance] msgManager] updateXmppMsgWithThub:resUploadUrl andMsgID:dbRes.objID];
                        CPLogInfo(@"resUploadUrl is %@,obj id is %@",resUploadUrl,dbRes.objID);
                        [[[CPSystemEngine sharedInstance] resManager] uploadResourceOf:dbRes.resID 
                                                                      resrouceCategory:dbRes.type
                                                                              fromFile:resPath
                                                                              mimeType:dbRes.mimeType];
                        isMark = NO;
                    }else 
                    {
                        ///如果文件的大小有问题，则。。。
                        if ([dbRes isVideoMsg]&&(!dbRes.fileSize||[dbRes.fileSize intValue]==0))
                        {
                            NSString *filePath = [[[CPSystemEngine sharedInstance] resManager] getResourcePathWithRes:dbRes];
                            NSNumber *fileSize = [CoreUtils getFileSizeWithName:filePath];
                            [[[CPSystemEngine sharedInstance] msgManager] updateXmppMsgWithFileSize:fileSize andMsgID:dbRes.objID];
                            [dbRes setFileSize:fileSize];
                            [[[CPSystemEngine sharedInstance] dbManagement] updateResourceWithID:dbRes.resID obj:dbRes];
                        }
                        if ([dbRes isAudioMsg]&&(!dbRes.mediaTime||[dbRes.mediaTime integerValue]==0))
                        {
                            NSString *filePath = [[[CPSystemEngine sharedInstance] resManager] getResourcePathWithRes:dbRes];
                            NSNumber *mediaTime = [CoreUtils getMediaTimeWithUrl:[NSURL URLWithString:filePath]];
                            [[[CPSystemEngine sharedInstance] msgManager] updateXmppMsgWithMediaTime:mediaTime andMsgID:dbRes.objID];
                            [dbRes setMediaTime:mediaTime];
                            [[[CPSystemEngine sharedInstance] dbManagement] updateResourceWithID:dbRes.resID obj:dbRes];
                        }
                        [[[CPSystemEngine sharedInstance] msgManager] sendMsgByWillCachedWithID:dbRes.objID resUrl:resUploadUrl];
                    }
                }
                    break;
                case RESOURCE_FILE_CP_TYPE_HEADER:
                    break;
                case RESOURCE_FILE_CP_TYPE_SELF_RECENT:
                    [[[CPSystemEngine sharedInstance] userManager] updateMyRecentInfoWithContent:resUploadUrl
                                                                                         andType:PERSONAL_RECENT_TYPE_AUDIO];
                    break;
                default:
                    break;
            }
            if (isMark)
            {
                [[[CPSystemEngine sharedInstance] dbManagement] updateResourceWithID:resUploadID url:resUploadUrl];
            }
        }
        else 
        {
            [[[CPSystemEngine sharedInstance] dbManagement] updateResourceUploadedWithID:resUploadID];
        }
    }
}
@end
