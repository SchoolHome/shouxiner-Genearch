//
//  TaggingDayTime.m
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TaggingDayTime.h"

@interface TaggingDayTime ()
@property(nonatomic, strong) NSArray * keywordHourPM ;
@property(nonatomic, strong) NSArray * keywordHour ;
@property(nonatomic, strong) NSArray * keywordHourPoint ;
@property(nonatomic, strong) NSArray * keywordHourPointValue;

@property(nonatomic, strong) NSString * keywordHourHalf ;
@property(nonatomic, strong) NSString * keywordHourQuater;
@property(nonatomic, strong) NSString * timePattern ;
@property(nonatomic, strong) NSString * timeRangePattern ;

@property(nonatomic, strong) NSNumber * defaultDayHour ;

@end

@implementation TaggingDayTime
@synthesize  keywordHourPM  = _keywordHourPM, keywordHour = _keywordHour, keywordHourPoint = _keywordHourPoint, keywordHourPointValue = _keywordHourPointValue, keywordHourHalf = _keywordHourHalf, keywordHourQuater = _keywordHourQuater, timePattern = _timePattern, timeRangePattern = _timeRangePattern;
@synthesize defaultDayHour = _defaultDayHour;

- (id) init{
    self = [super init];
    if (self){
        self.keywordHourPM = [[NSArray alloc] initWithObjects: @"下午", @"晚上", @"晚", @"夜里",nil ];
        self.keywordHour = [[NSArray alloc] initWithObjects: @"点", @"时",nil ];
        self.keywordHourPoint = [[NSArray alloc] initWithObjects: @"凌晨", @"早", @"早上", @"上午", @"中午", @"下午", @"晚", @"晚上",nil ];
        self.keywordHourPointValue = [[NSArray  alloc] initWithObjects: [NSNumber numberWithInt:1], [NSNumber numberWithInt:7],[NSNumber numberWithInt:7],[NSNumber numberWithInt:10],[NSNumber numberWithInt:12],[NSNumber numberWithInt:15],[NSNumber numberWithInt:18],[NSNumber numberWithInt:18],nil];
        self.keywordHourHalf = @"半";
        self.keywordHourQuater = @"刻";
        self.timePattern = @"(凌晨|上午|早上[^好]?|下午[^好]?|晚上[^好]?|下午|晚|夜里)?(\\d{1,2})[点时](\\d{1,2})?([分刻]|半)?";
        self.timeRangePattern = @"(凌晨|上午|早上[^好]?|下午[^好]?|晚上[^好]?|晚|下午|夜里)";
        self.defaultDayHour = [NSNumber numberWithInt:10];
    }
    return self;
}




- (BOOL) process:(NSString *)origInput withInput:(NSString *) input  withComponents:(NSDateComponents*) dateComponents{
    
    int hour = 0;
    int minute = 0;
    NSString *prefixValue;
    NSString *hourValue;
    NSString *minuteValue;
    NSString *miniteSuffixValue;
    NSError *error;
    
    if (nil == origInput || nil == input || nil == dateComponents) {
        return NO;
    }
    
    //1. 初始化正则表达式
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.timePattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //2. 执行匹配的过程
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    
    //3. 用下面的办法来遍历第一次匹配上的记录
    //若第一精确匹配失败，尝试匹配时间段
    if (matches.count != 0)
    {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        
        prefixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
        
        hourValue = [TimeUtil getMatchResult:input withMatch:match atIndex:2];
        
        minuteValue = [TimeUtil getMatchResult:input withMatch:match atIndex:3];
        
        miniteSuffixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:4];
        
    }else{
        regularExpression = [NSRegularExpression regularExpressionWithPattern:self.timeRangePattern options:NSRegularExpressionCaseInsensitive error:&error];
        matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
        if (matches.count == 0)
            return NO;
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        prefixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
    }
    
    //4. 检查匹配情况
    
    //4.1 如果有小时，查找前缀和分
    if (nil != hourValue && ![hourValue isEqualToString:@""]){
        NSNumberFormatter * formatter  = [[NSNumberFormatter alloc]init];
        
        // 找到小时
        NSNumber *hourNumber = [formatter numberFromString:hourValue];
        hour = [hourNumber intValue];
        
        // 前缀如果是PM，增加12小时
        NSUInteger prefixHitIndex =  [TimeUtil indexOfAny:prefixValue withStringArray:self.keywordHourPM];
        if (prefixHitIndex != NSNotFound && hour <= 12){
            hour += 12;
        }
        
        // 找到分
        if (nil != minuteValue && ![minuteValue isEqualToString:@""]){
            NSNumber *minuteNumber = [formatter numberFromString:minuteValue];
            minute = [minuteNumber intValue];
            if (minute <4 && nil != miniteSuffixValue && [miniteSuffixValue isEqualToString:self.keywordHourQuater]){
                minute *= 15;
            }
        }else if (nil != miniteSuffixValue && [miniteSuffixValue isEqualToString:self.keywordHourHalf]){
            minute = 30;
        }
        // 4.2 模糊匹配
    }else if (nil != prefixValue && ![prefixValue isEqualToString:@""]){
        // 前缀如果是PM，增加12小时
        NSUInteger prefixHitIndex =  [TimeUtil indexOfAny:prefixValue withStringArray:self.keywordHourPoint];
        if (prefixHitIndex != NSNotFound ){
            NSNumber *value = [self.keywordHourPointValue objectAtIndex:prefixHitIndex];
            hour = [value intValue];
        }
        // 4.3 模糊匹配也失败，设为默认值
    }else{
        hour = [self.defaultDayHour intValue];
    }
    
    [dateComponents setHour:hour];
    [dateComponents setMinute:minute];
    return YES;
}


@end
