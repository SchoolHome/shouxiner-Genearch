//
//  TaggingWeekDay.m
//  Timex
//
//  Created by liangshuang on 9/4/12.
//  Copyright (c) 2012 wang shuo. All rights reserved.
//

#import "TaggingWeekDay.h"

@interface TaggingWeekDay ()
@property(nonatomic, strong) NSString * weekPattern;
@property(nonatomic, strong) NSString * keywordWeekend;
@property(nonatomic, strong) NSArray * keywordSundyArray;
@end

@implementation TaggingWeekDay
@synthesize weekPattern = _weekPattern , keywordWeekend = _keywordWeekend , keywordSundyArray = _keywordSundyArray;

-(id) init{
    self = [super init];
    if (self){
        self.weekPattern = @"(下*)个?(?:周|星期|礼拜){1}(?:(\\d+|末|天|日))";
        self.keywordWeekend = @"末";
        self.keywordSundyArray = [[NSArray alloc] initWithObjects:@"日",@"天", nil];
    }
    return self;
}

- (BOOL) process:(NSString *)origInput withInput:(NSString *) input  withComponents:(NSDateComponents*) dateComponents{
    
    if (nil == origInput || nil == input || nil == dateComponents) {
        return NO;
    }
    
    int currentWeekDay = dateComponents.weekday;
    
    //1. 初始化正则表达式
    NSError *error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.weekPattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //2. 执行匹配的过程
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    
    //3. 用下面的办法来遍历第一次匹配上的记录
    if (matches.count != 0)
    {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        NSString * keywordNext = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
        NSString * keywordWeekday = [TimeUtil getMatchResult:input withMatch:match atIndex:2];
        
        if (nil == keywordWeekday || [keywordWeekday isEqualToString:@""])
            return NO;
        
        //找到是周x
        NSInteger weekday = [keywordWeekday integerValue];
        if (weekday != 0)
            weekday += 1;
        
        //如果最后是“末”
        if ([keywordWeekday isEqualToString:self.keywordWeekend])
            weekday = 7;
        
        //如果最后是“日，天”
        else if([TimeUtil indexOfAny:keywordWeekday withStringArray:self.keywordSundyArray] != NSNotFound){
            weekday = 1;
        }
        [dateComponents setWeekday:weekday];
        
        // 为了设置day值
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setYear:dateComponents.year];
        [components setMonth:dateComponents.month];
        [components setWeekday:dateComponents.weekday];
        [components setWeekOfYear:dateComponents.weekOfYear];
        [components setWeek:dateComponents.week];
        [components setHour:dateComponents.hour];
        [components setMinute:dateComponents.minute];

        [dateComponents setYear:components.year];
        [dateComponents setMonth:components.month];
        [dateComponents setDay:components.day];
        
        NSDate *t = [self.calendar dateFromComponents:dateComponents];
        // 有几个“下”
        NSDateComponents *week = [[NSDateComponents alloc] init];
        if (nil != keywordNext && [keywordNext length] >0){
            if (currentWeekDay != 1) {
                [week setDay:keywordNext.length * 7];
                t = [self.calendar dateByAddingComponents:week toDate:t options:0];
            }else{
                if (dateComponents.weekday == 1) {
                    [week setDay:keywordNext.length * 7];
                    t = [self.calendar dateByAddingComponents:week toDate:t options:0];
                }else if (keywordNext.length > 1) {
                    [week setDay:(keywordNext.length - 1 ) * 7];
                    t = [self.calendar dateByAddingComponents:week toDate:t options:0];
                }
            }
        }else if (dateComponents.weekday > weekday) {
            if (currentWeekDay != 1) {
                [week setDay:7];
                t = [self.calendar dateByAddingComponents:week toDate:t options:0];
            }
        }else if (dateComponents.weekday < currentWeekDay){
            if (currentWeekDay != 1) {
                [week setDay:7];
                t = [self.calendar dateByAddingComponents:week toDate:t options:0];
            }
        }
        
        NSDateComponents *weekdayComponents = [[NSCalendar currentCalendar]components:unitTimeFlags fromDate:t];
        [dateComponents setYear:weekdayComponents.year];
        [dateComponents setMonth:weekdayComponents.month];
        [dateComponents setDay:weekdayComponents.day];
    }
    return YES;
}

@end
