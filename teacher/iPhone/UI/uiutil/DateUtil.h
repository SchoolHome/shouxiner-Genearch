//
//  DateUtil.h
//  humor
//
//  Created by zeng yonghong on 11-4-29.
//  Copyright 2011年 fractalist. All rights reserved.
//

#import <Foundation/Foundation.h>


#define DATE_FORMAT_EN_US_CST @"EEE MMM dd HH:mm:ss 'CST' yyyy"
#define LOCAL_REPRESENT_EN_US @"en_US";
#define DATE_FORMAT_CH_WITHOUT_SEP @"yyyyMMddKmmss"
#define DATE_FORMAT_CH_WITH_SEP @"yyyy-MM-dd K:mm:ss"
#define DATE_FORMAT_CH_WITH_CHN @"yyyy年MM月dd日 K:mm:ss"
#define dateWithYMDHMS @"YYYY-MM-dd HH:MM:SS"
#define dateWithHMS  @"HH:mm"
#define dateWithMD  @"MM-dd"
#define dateWithYMD @"YYYY-MM-dd"
#define dateWithW @"EEEE"
#define dateForCoupleComplete @"YYYY·MM·dd"


// added by mingtf 2012-6-8
#define CP_MINUTE 60
#define CP_HOUR   (60 * CP_MINUTE)
#define CP_DAY    (24 * CP_HOUR)
#define CP_5_DAYS (5 * CP_DAY)
#define CP_WEEK   (7 * CP_DAY)
#define CP_MONTH  (30.5 * CP_DAY)
#define CP_YEAR   (365 * CP_DAY)



@interface DateUtil : NSObject {
    
}
-(id)init;

-(NSDate *)dateString:(NSString *)dstr formateString:(NSString *)formatestr localstr:(NSString *)local;

-(NSString *)obtainDate:(NSDate *)date formateString:(NSString*)formatestr;   

//比较2个时间返回指定字符串
-(NSString *)compareDateForCloseFriend:(NSDate *)date;
-(NSString *)compareDate:(NSDate *)date;
//将date过滤成指定格式的NSstring
-(NSString *)formatDateWithType:(NSString *)type formatDate:(NSDate *)date;
//返回指定的年月日的int值
-(NSInteger)transformStrToInt:(NSDate *)dateStr strPart:(NSString *)part;

// 格式化输出2个秒数之差
+ (NSString *)dateStrFrom:(double) fromDateSec to:(double) toDateSec;

@end
