//
//  Holiday.m
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "Holiday.h"
@interface Holiday ()
// 天
@property (nonatomic) int day;
// 月
@property (nonatomic) int month;
// 一周的第几天
@property (nonatomic) int dayOfWeek;
// 一月的第几周
@property (nonatomic) int weekOfMonth;

// 重置日期
-(void) nativeSet : (NSDateComponents *)dateComponents;
@end


@implementation Holiday
@synthesize day = _day , month = _month , dayOfWeek = _dayOfWeek , weekOfMonth = _weekOfMonth;

-(id) initHoliday:(int)day withMonth:(int)month withDayOfWeek:(int)dayOfWeek withWeekOfMonth:(int)weekOfMouth{
    self  = [super init];
    if (nil != self) {
        self.day = day;
        self.month = month;
        self.dayOfWeek = dayOfWeek;
        self.weekOfMonth = weekOfMouth;
    }
    return self;
}


-(void) nativeSet:(NSDateComponents *)dateComponents{
    if (self.day != -1) {
        [dateComponents setDay:self.day];
    }
    
    if (self.month != -1) {
        [dateComponents setMonth:self.month];
    }

    if (self.dayOfWeek != -1){
        [dateComponents setWeekday:self.dayOfWeek];
    }

    if(self.weekOfMonth != -1){
        [dateComponents setWeekOfMonth:self.weekOfMonth];
    }
}

-(void) setCalendar : (NSCalendar *) calendar withDateComponents : (NSDateComponents *) dateComponents{
//    NSCalendar *cal = [NSCalendar currentCalendar];
//    [cal setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
//    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
//    NSDateComponents *comps = [calendar components:unitFlags fromDate:[NSDate date]];
    
    [self nativeSet:dateComponents];
    NSDate *alarmDate = [calendar dateFromComponents:dateComponents];
    
    if ([alarmDate compare:[NSDate date]] == NSOrderedAscending) {
        [dateComponents setYear:[dateComponents year] + 1];
        [self nativeSet:dateComponents];
    }
}
@end
