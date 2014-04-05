//
//  ChooseCoupleModel.m
//  iCouple
//
//  Created by yong wei on 12-4-11.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "ChooseCoupleModel.h"

@implementation ChooseCoupleModel
@synthesize chooseedType = _chooseedType , chooseedUserinfor = _chooseedUserinfor;

static ChooseCoupleModel *sharedInstance = nil;

+ (ChooseCoupleModel *) sharedInstance{
    if (sharedInstance == nil){
        sharedInstance = [[super alloc] init];
    }
    return sharedInstance;
}
@end
