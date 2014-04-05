//
//  CPOperationMsgDel.h
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"

typedef enum
{
    MSG_DEL_TYPE_DEFAULT = 0,
    MSG_DEL_TYPE_WILL_SEND = 1,
}MsgDelType;


@interface CPOperationMsgDel : CPOperation
{
    NSArray *willSendMsgIDs;
}
- (id) initWithWillMsgIDs:(NSArray *)msgIDs;
@end
