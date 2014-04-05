//
//  CPOperationMsgUpdate.h
//  iCouple
//
//  Created by yong wei on 12-5-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"
typedef enum
{
    MSG_UPDATE_TYPE_DN_RES =1,
    MSG_UPDATE_TYPE_MARK_READED =2,
    MSG_UPDATE_TYPE_AUDIO_READED =3,
    MSG_UPDATE_TYPE_SYS_REQ_ACTION =4,
}MsgUpdateType;

@class CPUIModelMessage;
@class CPUIModelMessageGroup;
@interface CPOperationMsgUpdate : CPOperation
{
    CPUIModelMessage *uiMsgUpdate;
    CPUIModelMessageGroup *uiMsgGroupUpdate;
    NSInteger updateType;
    NSInteger reqActionType;
}
- (id) initWithMsg:(CPUIModelMessage *)uiMsg andType:(NSInteger)type;
- (id) initWithMsgGroup:(CPUIModelMessageGroup *)uiMsgGroup;
- (id) initWithMsg:(CPUIModelMessage *)uiMsg andType:(NSInteger)type andActionType:(NSInteger)actionType;
@end
