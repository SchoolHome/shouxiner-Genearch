//
//  CPXmppEngine.h
//  Couple
//
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPXmppEngineObserver.h"
#import "XMPPFramework.h"

enum {
    STATE_XMPPENGINE_UNKNOWN = -1, //DO NOT USE!
    STATE_XMPPENGINE_CONNECTING = 1,
    STATE_XMPPENGINE_SOCKET_CONNECTED,
    STATE_XMPPENGINE_STREAM_CONNECTED,
    STATE_XMPPENGINE_AUTHING,
    STATE_XMPPENGINE_AUTHENTICATED, //temp state!
    STATE_XMPPENGINE_AUTHFAILED,
    STATE_XMPPENGINE_CONNECTED,
    STATE_XMPPENGINE_DISCONNECTING,
    STATE_XMPPENGINE_DISCONNECTED,
    STATE_XMPPENGINE_RECONNECTING,
};

@protocol CPXmppEngineObserver;

@interface CPXmppEngine : NSObject
{    
    //	BOOL isXmppConnected;
}

//observer
- (void) addObserver:(id<CPXmppEngineObserver>) observer;
- (void) removeObserver:(id<CPXmppEngineObserver>) observer;

//init
- (id)init;

- (void)setupStream;

- (BOOL)isDisconnected;
- (BOOL)isConnected;

//connection & disconnection.
- (BOOL)connectWithJID:(NSString *) JID Password:(NSString *) password;
- (void)disconnect;

//instant message.
- (void)sendInstantMessage:(id)msg;
//group message.
- (void)sendGroupMessage:(id)groupMsg;

- (void)manualReconnect;

@end
