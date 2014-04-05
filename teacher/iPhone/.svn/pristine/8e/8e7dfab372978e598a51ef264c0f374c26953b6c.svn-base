//
//  TaggingHoliday.m
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TaggingHoliday.h"

@interface TaggingHoliday ()

-(Holiday *) getHoliday : (NSString *) holidayName;

@end

@implementation TaggingHoliday
@synthesize holidayArray = _holidayArray;

-(id) init{
    self = [super init];
    
    if (nil != self) {
        self.holidayArray = [NSArray arrayWithObjects:@"元旦",@"情人节",@"母亲节",@"父亲节",@"五一",@"劳动节",@"六一",@"儿童节",@"七一",@"八一",@"建军节",@"十一",@"国庆节",@"平安夜",@"圣诞节", nil];
    }
    return self;
}

-(BOOL) process:(NSString *)origInput withInput:(NSString *)input withComponents:(NSDateComponents *)dateComponents{
    NSUInteger result = [TimeUtil indexOfAny:origInput withStringArray:self.holidayArray];
    if ( result == NSNotFound ) {
        return NO;
    }else{
        Holiday *holiday = [self getHoliday:(NSString *)[self.holidayArray objectAtIndex:result]];
        if ( nil == holiday) {
            return NO;
        }else{
            [holiday setCalendar:self.calendar withDateComponents:dateComponents];
            return YES;
        }
    }
}

-(Holiday *) getHoliday:(NSString *)holidayName{
    if (nil == holidayName || [holidayName isEqualToString:@""]) {
        return nil;
    }
    
    Holiday *holiday = nil;
    if ([holidayName isEqualToString:@"元旦"]) {
        holiday = [[Holiday alloc] initHoliday:1 withMonth:1 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"情人节"]){
        holiday = [[Holiday alloc] initHoliday:14 withMonth:2 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"母亲节"]){
        holiday = [[Holiday alloc] initHoliday:-1 withMonth:5 withDayOfWeek:1 withWeekOfMonth:2];
    }else if ([holidayName isEqualToString:@"父亲节"]){
        holiday = [[Holiday alloc] initHoliday:-1 withMonth:6 withDayOfWeek:1 withWeekOfMonth:3];
    }else if ([holidayName isEqualToString:@"五一"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:5 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"劳动节"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:5 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"六一"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:6 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"儿童节"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:6 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"七一"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:7 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"八一"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:8 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"建军节"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:8 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"十一"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:10 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"国庆节"]){
        holiday = [[Holiday alloc] initHoliday:1 withMonth:10 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"平安夜"]){
        holiday = [[Holiday alloc] initHoliday:24 withMonth:12 withDayOfWeek:-1 withWeekOfMonth:-1];
    }else if ([holidayName isEqualToString:@"圣诞节"]){
        holiday = [[Holiday alloc] initHoliday:25 withMonth:12 withDayOfWeek:-1 withWeekOfMonth:-1];
    }
    
    return holiday;
}
@end
