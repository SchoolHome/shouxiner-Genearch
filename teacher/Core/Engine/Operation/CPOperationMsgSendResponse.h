//
//  CPOperationMsgSendResponse.h
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"
typedef enum
{
    MSG_SEND_RESPONSE_DEFAULT = 0,
    MSG_SEND_RESPONSE_SUCCESS = 2,
    MSG_SEND_RESPONSE_ERROR = 3,
}MsgSendResponse;
@interface CPOperationMsgSendResponse : CPOperation
{
    NSNumber *sentMsgID;
    NSNumber *sentMsgStatus;
}
- (id) initWithMsgID:(NSNumber *)msgID andStatus:(NSNumber *)status;


@end
