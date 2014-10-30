//
//  SystemOperation.h
//  teacher
//
//  Created by singlew on 14-8-12.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmOperation.h"

typedef enum{
    kGetAdvInfo,
    kGetAdvInfoWithGroup,
}SystemType;

@interface SystemOperation : PalmOperation
-(SystemOperation *) initGetAdvInfo;
-(SystemOperation *) initGetAdvInfo : (int) groupID;
@end