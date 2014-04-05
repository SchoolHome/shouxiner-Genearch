//
//  TaggingHoliday.h
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TaggingProcessor.h"
#import "Holiday.h"
#import "TimeUtil.h"

@interface TaggingHoliday : TaggingProcessor
@property (nonatomic,strong) NSArray *holidayArray;

-(id) init;


@end
