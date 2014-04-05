//
//  DateUtil.m
//  humor
//
//  Created by zeng yonghong on 11-4-29.
//  Copyright 2011Âπ?fractalist. All rights reserved.
//
#define ONE_DAY_TIMEINTERVAL 24*60*60
#import "DateUtil.h"





@implementation DateUtil

-(id)init{
    if(self ==[super init])
        return self;
    return NULL;
}

/**
    This function have three parameters,first parameter is a NSString object that represent a string of date
    second parameter is a NSString object that represent a string of date formate (for example: like a "EEE MMM dd HH:mm:ss 'CST' yyyy" or other standard date formate string or customized date formate string) 
    the third parameter is a NSString object that represent a string of a local identifier (for example: like a "en_US,zh_CN" or other standard local identifier),this function will return a NSDate Object for the terminal user.
 **/

-(NSDate *)dateString:(NSString *)dstr formateString:(NSString *)formatestr localstr:(NSString *)local 
{    
     NSDateFormatter *dateformate= [[NSDateFormatter alloc]init];
     [dateformate setDateFormat:formatestr];
     [dateformate setLocale:[[NSLocale alloc]initWithLocaleIdentifier:local]];
     NSDate *date=[dateformate dateFromString:dstr];
   
     return date;
}
/**
 */

-(NSString *)obtainDate:(NSDate *)date formateString:(NSString *)formatestr{
    NSString *daterepresent=[[NSString alloc] init];
    NSDateFormatter *dateformate= [[NSDateFormatter alloc] init];
    [dateformate setDateFormat:formatestr];
    daterepresent=[dateformate stringFromDate:date];
 
    return daterepresent;
}
-(NSString *)compareDateForCloseFriend:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *dateNow = [NSDate date];
    date = [formatter dateFromString:[formatter stringFromDate:date]];
    NSTimeInterval timeNow = [dateNow timeIntervalSince1970];
    NSTimeInterval timeDate= [date timeIntervalSince1970];
    

    if (timeNow - timeDate < ONE_DAY_TIMEINTERVAL) {
        return @"今天";
    }else if (timeNow - timeDate >= ONE_DAY_TIMEINTERVAL && timeNow - timeDate < ONE_DAY_TIMEINTERVAL*2.0 )
    {
        return @"昨天";
    }else if (timeNow - timeDate < ONE_DAY_TIMEINTERVAL*7.0 && timeNow - timeDate >= ONE_DAY_TIMEINTERVAL*2.0)
    {
        return @"一周前";
    }else if (timeNow - timeDate < ONE_DAY_TIMEINTERVAL*30.0 && timeNow - timeDate >= ONE_DAY_TIMEINTERVAL*7.0 )
    {
        return @"一月前";
    }else {
        return @"好久不联系";
    }
    
    
    
    
}
//比较2个时间返回指定字符串
-(NSString *)compareDate:(NSDate *)date
{
    NSInteger dateNowY =  [self transformStrToInt:[NSDate date] strPart:@"y"];
    NSInteger dateNowM =  [self transformStrToInt:[NSDate date] strPart:@"m"];  
    NSInteger dateNowD =  [self transformStrToInt:[NSDate date] strPart:@"d"];
    NSInteger dateNowW =  [self transformStrToInt:[NSDate date] strPart:@"w"];
    
    NSInteger dateMessageY = [self transformStrToInt:date strPart:@"y"];
    NSInteger dateMessageM = [self transformStrToInt:date strPart:@"m"];
    NSInteger dateMessageD = [self transformStrToInt:date strPart:@"d"];
    NSInteger dateMessageW =  [self transformStrToInt:date strPart:@"w"];
       //当年，月，日相等时显示时间
    //当年，月相等，当前日比信息日差1时显示昨天，或者当前月比信息月大1，日=1时也显示昨天
    //当周相等，显示星期几
    //当年相等，显示月日
    //其他日期，显示年月日
    if (dateNowY == dateMessageY && dateNowM == dateMessageM && dateNowD == dateMessageD) {
        return [self formatDateWithType:dateWithHMS formatDate:date];
    }else if ((dateNowY == dateMessageY && dateNowM == dateMessageM && dateNowD-dateMessageD == 1) || (dateNowY == dateMessageY && dateNowM - dateMessageM == 1 && dateNowD == 1) || (dateNowY - dateMessageY == 1 && dateNowM == 1 && dateNowD == 1) )
    {
        return @"昨天";
    }else if (dateMessageY == dateNowY && dateNowW == dateMessageW)
    {
        NSString *strWeek = [self formatDateWithType:dateWithW formatDate:date];
        if ([strWeek isEqualToString:@"Monday"]) {
            return @"星期一";
        }else if([strWeek isEqualToString:@"Tuesday"])
        {
            return @"星期二";        
        }else if([strWeek isEqualToString:@"Wednesday"])
        {
            return @"星期三";
        }else if([strWeek isEqualToString:@"Thursday"])
        {
            return @"星期四";
        }else if([strWeek isEqualToString:@"Friday"])
        {
            return @"星期五";
        }else if([strWeek isEqualToString:@"Saturday"])
        {
            return @"星期六";
        }else if([strWeek isEqualToString:@"Sunday"])
        {
            return @"星期日";
        }else {
            return @"";
        }
    }else if (dateMessageY == dateNowY )
    {
        return [self formatDateWithType:dateWithMD formatDate:date];
    }else {
        return [self formatDateWithType:dateWithYMD formatDate:date];
    }
    
    
    
    
    
    
}
//将date过滤成指定格式的NSstring
-(NSString *)formatDateWithType:(NSString *)type formatDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:type];
    NSString *returnStr = [formatter stringFromDate:date];
    return returnStr;
}
-(NSInteger)transformStrToInt:(NSDate *)dateStr strPart:(NSString *)part
{
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit;
    NSDateComponents *time = [cal components:unitFlags fromDate:dateStr];
    if ([part isEqualToString:@"y"]) {
        return [time year];
    }else if ([part isEqualToString:@"m"])
    {
        return [time month];
    }else if ([part isEqualToString:@"w"])
    {
        return  [time week];
    }else if ([part isEqualToString:@"d"])
    {
        return [time day];
    }
    return -1;
}

+ (NSString *)dateStrFrom:(double) fromDateSec to:(double) toDateSec{
    
    double length = toDateSec - fromDateSec;
    
    /*
    if (length<0) {
        NSLog(@"date error");
        return @"1天";
    }else {
        //
        if (length>=CP_YEAR) {
            
            int year = (int)length/CP_YEAR;
            int month = (length - year*CP_YEAR)/CP_MONTH;
            int day = (length - year*CP_YEAR - month*CP_MONTH)/CP_DAY+1;
            
            NSString *str;
            
            if (month>=0) {
                if (day>=30) {
                    month = month +1;
                    if (month == 12) {
                        year = year +1;
                        return [NSString stringWithFormat:@"%d年",year];
                    }
                    
                    return [NSString stringWithFormat:@"%d年%d月",year,month];
                }
                
                str = [NSString stringWithFormat:@"%d年%d月零%d天",year,month,day];
            }else {
                str = [NSString stringWithFormat:@"%d年零%d天",year,day];
            }
            
            return str;
            
        }else if(length>=CP_MONTH){
            
            int month = (int)length/CP_MONTH;
            int week = (length - month*CP_MONTH)/CP_WEEK;
            int day = (length - month*CP_MONTH - week*CP_WEEK)/CP_DAY+1;
            
            NSString *str;
            
            if (week>=0) {
                if (day == 7) {
                    week = week + 1;
                    return [NSString stringWithFormat:@"%d月%d周",month,week]; 
                }
                
                if (week == 4) {
                    day = day -1;
                    if (day ==0) {
                        return  [NSString stringWithFormat:@"%d月%d周",month,week]; 
                    }
                }
                
                str = [NSString stringWithFormat:@"%d月%d周零%d天",month,week,day];
            }else {
                str = [NSString stringWithFormat:@"%d月零%d天",month,day];
            }

            return str;
            
        }else if(length>=CP_WEEK){
            
            int week = (int)length/CP_WEEK;
            int day = (length - week*CP_WEEK)/CP_DAY+1;
            
            if (day == 7) {
                week = week + 1;
                return  [NSString stringWithFormat:@"%d周",week]; 
            }
            if (week == 4) {
                day = day -1;
                if (day ==0) {
                    return  [NSString stringWithFormat:@"%d周",week]; 
                }
                
                return  [NSString stringWithFormat:@"%d周零%d天",week,day]; 
            }
            
            NSString *str = [NSString stringWithFormat:@"%d周零%d天",week,day];
            return str;
            
        }else if(length>=CP_DAY){
            int day = (int)length/CP_DAY;
            int hour = (length - day*CP_DAY)/CP_HOUR+1;
            
            if (hour==24) {
                hour = hour-1;
            }
            NSString *str = [NSString stringWithFormat:@"%d天零%d小时",day,hour];
            
            return str;
        }else {
            return @"1天";
        }
    }
    */
    
    if (length<0) {
        CPLogInfo(@"date error");
        return @"1天";
    }else {
        if (length>=CP_DAY) {
            int day = (int)length/CP_DAY;
            NSString *str = [NSString stringWithFormat:@"%d天",day];
            return str;
        }else {
            return @"1天";
        }
    }
    
    return @"1天";
}

@end
