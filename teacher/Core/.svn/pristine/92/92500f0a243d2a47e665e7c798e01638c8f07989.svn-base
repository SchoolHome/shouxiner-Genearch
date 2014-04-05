//
//  XMPPMessage+XMPPMessage_EXT.m
//  iCouple
//
//  Created by yl s on 12-4-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XMPPMessage+SYS.h"
#import "NSXMLElement+XMPP.h"
#import "XMPPMessage+EXT.h"

@implementation XMPPMessage (XMPPMessage_SYS)

- (BOOL)isSystemMessage
{
	return ( ([[[self attributeForName:@"type"] stringValue] isEqualToString:@"normal"]
              && ( [[self subTypeStr] isEqualToString:@"sys_rmd"]
                  || [[self subTypeStr] isEqualToString:@"sys_req"]
                  || [[self subTypeStr] isEqualToString:@"sys_rsp"]
                  || [[self subTypeStr] isEqualToString:@"sys_dgrd"]
                  || [[self subTypeStr] isEqualToString:@"sys_logout"]
                  || [[self subTypeStr] isEqualToString:@"sys_login"]
                  || [[self subTypeStr] isEqualToString:@"sys_match"]
                  ))|| [[self subTypeStr] isEqualToString:@"ack"] );
}

- (BOOL)isSystemMessageWithBody
{
	if ([self isSystemMessage])
	{
		NSString *body = [[self elementForName:@"body"] stringValue];
		
		return ((body != nil) && ([body length] > 0));
	}
	
	return NO;
}

@end
