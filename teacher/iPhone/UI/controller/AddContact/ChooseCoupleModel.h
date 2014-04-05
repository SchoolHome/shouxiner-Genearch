//
//  ChooseCoupleModel.h
//  iCouple
//
//  Created by yong wei on 12-4-11.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInforModel.h"

typedef enum{
    IsLover,
    IsMarried,
    IsNone
}ChooseedType;

@interface ChooseCoupleModel : NSObject


@property(strong,nonatomic) UserInforModel *chooseedUserinfor;
@property(nonatomic) ChooseedType chooseedType;

+ (ChooseCoupleModel *) sharedInstance;
@end
