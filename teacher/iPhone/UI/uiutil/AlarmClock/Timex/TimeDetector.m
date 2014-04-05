//
//  TimeDetector.m
//  Timex
//
//  Created by wang shuo on 12-9-6.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TimeDetector.h"
@interface TimeDetector ()

@end

@implementation TimeDetector

-(id)init{
    self = [super init];
    
    if (nil != self) {

    }
    return self;
}

+(BOOL) containTimeInfo : (NSString *)input{
    static NSString *holidaySolar = @"元旦|情人节|母亲节|父亲节|五一|劳动节|六一|儿童节|七一|八一|建军节|十一|国庆|平安夜|圣诞节";
    static NSString *holidayLunar = @"除夕|春节|端午|中秋|重阳|七夕";
    static NSString *holidaySolarTerm = @"小寒|大寒|立春|雨水|惊蛰|春分|清明|谷雨|立夏|小满|芒种|夏至|小暑|大暑|立秋|处暑|白露|秋分|寒露|霜降|立冬|小雪|大雪|冬至";
    static NSString *holidaySolt = @"(?:凌晨|上午|中午|今晚|明晚|早上[^好]?|下午[^好]?|晚上[^好]?|夜里)|\\d{1,2}[时点](?:半|\\d{1,2}[分刻]?)?";
    static NSString *dayPattern = @"(?:(?:[这下本]个?|\\d+|[腊正])月|大年)初?\\d{1,2}[号日]?|(?:(?:星期|周|礼拜)[\\d日末天])|大?[明后]天";
    
    NSError *error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@|%@|%@",holidaySolar,holidayLunar,holidaySolarTerm] options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    if (matches.count > 0) {
        return YES;
    }
    
    NSString *newInput = [[TimeUtil getInstance] prepareInput:input];
    regularExpression = [NSRegularExpression regularExpressionWithPattern:dayPattern options:NSRegularExpressionCaseInsensitive error:&error];
    matches = [regularExpression matchesInString:newInput options:NSMatchingCompleted range:NSMakeRange(0,[newInput length])];
    if (matches.count > 0) {
        return YES;
    }
    
    regularExpression = [NSRegularExpression regularExpressionWithPattern:holidaySolt options:NSRegularExpressionCaseInsensitive error:&error];
    matches = [regularExpression matchesInString:newInput options:NSMatchingCompleted range:NSMakeRange(0,[newInput length])];
    if (matches.count > 0) {
        return YES;
    }
    return NO;
}

@end
