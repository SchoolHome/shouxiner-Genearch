//
//  TimeParser.m
//  Timex
//
//  Created by wang shuo on 12-9-6.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TimeParser.h"
static TimeParser *instance = nil;
static NSArray *processors;
@interface TimeParser ()
@end

@implementation TimeParser

+(TimeParser *)getInstance{
	@synchronized(self){
		if (instance==nil){
			instance = [[TimeParser alloc]init];
            processors = [NSArray arrayWithObjects:
                          [[TaggingYear alloc] init],
                          [[TaggingMonthDay alloc] init],
                          [[TaggingHoliday alloc] init],
                          [[TaggingWeekDay alloc] init],
                          [[TaggingDayTime alloc] init],
                          [[TaggingLunar alloc] init],nil];//
		}
	}
	return instance;
}

-(NSDate *) process : (NSString *) inputStr{
    NSDate *result = nil;
    
    if (nil == inputStr || [inputStr isEqualToString:@""]) {
        return result;
    }
    
    NSString *newInputStr = [[TimeUtil getInstance] prepareInput:inputStr];
    NSDateComponents *comps =[[NSCalendar currentCalendar]components:unitTimeFlags fromDate:[NSDate date]];
    [comps setSecond:0];
    
    TaggingProcessor *pro = nil;
    BOOL processResult = NO;
    for (int i = 0; i<[processors count]; i++) {
        pro = (TaggingProcessor *)[processors objectAtIndex:i];
        processResult = [pro process:inputStr withInput:newInputStr withComponents:comps];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+8"]];
        result = [calendar dateFromComponents:comps];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"%@---%@",inputStr,[dateFormatter stringFromDate:result]);
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+8"]];
    result = [calendar dateFromComponents:comps];
    return result;
}
@end
