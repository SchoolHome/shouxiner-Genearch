//
//  CPXmppEngineConst.h
//  iCouple
//
//  Created by yl s on 12-3-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef iCouple_CPXmppEngineConst_h
#define iCouple_CPXmppEngineConst_h

enum XMPPEngineMessageSendingState {
    
    MESSAGE_SENDING_STATE_SENDING = 1,      //
    MESSAGE_SENDING_STATE_SEND_SUCCESSFUL = 2,  //the only state we should care.
    MESSAGE_SENDING_STATE_SEND_FAILED = 3,      //N/A
};

typedef enum XMPPEngineMessageSendingState XMPPEngineMessageSendingState;

#endif
