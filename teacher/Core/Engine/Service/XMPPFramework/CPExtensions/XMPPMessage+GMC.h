//
//  XMPPMessage+GMC.h
//  iCouple
//
//  Created by yl s on 12-5-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPPMessage.h"

@interface XMPPMessage (XMPPMessage_GMC)

- (BOOL)isGMCMessage;
- (BOOL)isGMCMessageWithBody;

@end
