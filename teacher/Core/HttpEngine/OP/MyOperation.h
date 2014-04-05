//
//  MyOperation.h
//  teacher
//
//  Created by singlew on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmOperation.h"

typedef enum{
    kGetCredits,
    kCheckVersion,
}MyType;

@interface MyOperation : PalmOperation
@property (nonatomic) MyType type;
-(MyOperation *) initGetCredits;
-(MyOperation *) initCheckVersion;
@end