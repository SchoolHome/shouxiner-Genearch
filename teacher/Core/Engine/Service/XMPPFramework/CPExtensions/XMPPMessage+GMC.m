//
//  XMPPMessage+GMC.m
//  iCouple
//
//  Created by yl s on 12-5-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XMPPMessage+GMC.h"

#import "NSXMLElement+XMPP.h"

#import "XMPPMessage+EXT.h"
#import "XMPPMessage+SYS.h"

@implementation XMPPMessage (XMPPMessage_GMC)

- (BOOL)isGMCMessage
{
	return ( [[[self attributeForName:@"type"] stringValue] isEqualToString:@"normal"]
                && [[self subTypeStr] isEqualToString:@"grp_mem"] );
}

- (BOOL)isGMCMessageWithBody
{
	if ([self isGMCMessage])
	{
		NSString *body = [[self elementForName:@"body"] stringValue];
		
		return ((body != nil) && ([body length] > 0));
	}
	
	return NO;
}

@end
