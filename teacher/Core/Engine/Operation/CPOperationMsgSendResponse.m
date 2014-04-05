//
//  CPOperationMsgSendResponse.m
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationMsgSendResponse.h"
#import "CPDBModelMessage.h"
#import "CPDBManagement.h"
#import "CPSystemEngine.h"
#import "CPUIModelMessage.h"
#import "CPMsgManager.h"

@implementation CPOperationMsgSendResponse
- (id) initWithMsgID:(NSNumber *)msgID andStatus:(NSNumber *)status
{
    self = [super init];
    if (self)
    {
        sentMsgID = msgID;
        sentMsgStatus = status;
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        if (!sentMsgID)
        {
            return;
        }
        CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:sentMsgID];
        if (!dbMsg||!dbMsg.msgGroupID)
        {
            return;
        }
        NSInteger sentResponseCode = [sentMsgStatus integerValue];
        NSNumber *resCode = nil;
        switch (sentResponseCode)
        {
            case MSG_SEND_RESPONSE_SUCCESS:
                resCode = [NSNumber numberWithInt:MSG_SEND_STATE_SEND_SUCESS];
                break;
            case MSG_SEND_RESPONSE_ERROR:
                resCode = [NSNumber numberWithInt:MSG_SEND_STATE_SEND_ERROR];
                break;
            default:
                break;
        }
        if (resCode)
        {
            [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID andStatus:resCode];
            [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
        }
    }
}

@end
