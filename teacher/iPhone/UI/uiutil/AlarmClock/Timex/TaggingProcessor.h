//
//  TaggingProcessor.h
//  Timex
//
//  Created by liangshuang on 9/4/12.
//  Copyright (c) 2012 wang shuo. All rights reserved.
//

#import <Foundation/Foundation.h>

static unsigned unitTimeFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit |NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit|NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit| NSWeekOfYearCalendarUnit;

@interface TaggingProcessor : NSObject
@property (nonatomic,strong) NSCalendar *calendar;

- (BOOL) process:(NSString *)origInput withInput:(NSString *) input  withComponents:(NSDateComponents*) dateComponents;
@end
