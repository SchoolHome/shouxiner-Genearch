//
//  CPOperationSysInit.h
//  icouple
//
//  Created by yong wei on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperation.h"

typedef enum 
{
    SYS_INIT_TYPE_DEFAULT   = 0,
    SYS_INIT_TYPE_IMPORT_AB = 1,
    SYS_INIT_TYPE_LOGED_INIT= 2,
    SYS_INIT_TYPE_PRE_INIT= 3,//系统预设数据的初始化，但是依赖于帐号数据库
    SYS_INIT_TYPE_PRE_INIT_BG_DLD_PETRES = 4,
    SYS_INIT_TYPE_INIT_PERSONAL= 5,
    SYS_INIT_TYPE_INIT_USER_LIST= 6,
}SysInitType;
@interface CPOperationSysInit : CPOperation
{
    NSInteger initType;
}


- (id) initWithType:(NSInteger )type;

@end
