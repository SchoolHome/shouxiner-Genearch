//
//  CPOperationResDownloadResponse.h
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPOperation.h"

@interface CPOperationResDownloadResponse : CPOperation
{
    __strong NSNumber *resDownloadID;
    NSNumber *resultCode;
    NSString *updatetTimeStamp;
    NSString *tmpFilePath;
}
- (id) initWithResID:(NSNumber *)localResID andResCode:(NSNumber *)resCode andTimeStamp:(NSString *)timeStamp andTmpFilePath:(NSString *)filePath;

@end
