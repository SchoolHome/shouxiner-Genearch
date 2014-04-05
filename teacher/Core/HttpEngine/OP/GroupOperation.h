//
//  GroupOperation.h
//  teacher
//
//  Created by singlew on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmOperation.h"

typedef enum {
    kGetGroupList,
}GroupListType;

@interface GroupOperation : PalmOperation
-(GroupOperation *) initGetGroupList;

@property(nonatomic) GroupListType type;
@end
