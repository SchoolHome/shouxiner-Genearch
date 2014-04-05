//
//  CPOperationResUpload.h
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPOperation.h"

@class CPDBModelResource;
@interface CPOperationResUpload : CPOperation
{
    __strong CPDBModelResource *dbResUpload;
    __strong NSData *resDataUpload;
}
- (id) initWithRes:(CPDBModelResource *)dbRes res_data:(NSData *)resData;
@end
