//
//  CPOperationResUploadResponse.h
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPOperation.h"

@interface CPOperationResUploadResponse : CPOperation
{
    __strong NSNumber *resUploadID;
    __strong NSString *resUploadUrl;
    NSString *updateTimeStamp;
    NSNumber *resultCode;
}
- (id) initWithResID:(NSNumber *)localResID andResCode:(NSNumber *)resCode res_url:(NSString *)resUrl andTimeStamp:(NSString *)timeStamp;

@end
