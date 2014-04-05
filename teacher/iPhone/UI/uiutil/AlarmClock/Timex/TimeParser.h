//
//  TimeParser.h
//  Timex
//
//  Created by wang shuo on 12-9-6.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaggingProcessor.h"
#import "TaggingYear.h"
#import "TaggingMonthDay.h"
#import "TaggingWeekDay.h"
#import "TaggingHoliday.h"
#import "TaggingDayTime.h"
#import "TaggingLunar.h"

@interface TimeParser : NSObject
+(TimeParser *)getInstance;

-(NSDate *) process : (NSString *) inputStr;

@end
