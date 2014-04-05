//
//  CPOperationMsgDel.m
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationMsgDel.h"
#import "CPSystemEngine.h"
#import "CPMsgManager.h"
#import "CPDBModelMessage.h"
#import "CPDBModelMessageGroup.h"
#import "CPDBManagement.h"
#import "CPUIModelMessage.h"
@implementation CPOperationMsgDel
- (id) initWithWillMsgIDs:(NSArray *)msgIDs
{
    self = [super init];
    if (self)
    {
        willSendMsgIDs = msgIDs;
    }
    return self;
}

-(void)main
{
    @autoreleasepool 
    {
        for(NSNumber *msgID in willSendMsgIDs)
        {
            CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:msgID];
            if (dbMsg.msgGroupID)
            {
                [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID 
                                                                          andStatus:[NSNumber numberWithInt:MSG_SEND_STATE_SEND_ERROR]];
                [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
            }
        }
    }
}

@end
