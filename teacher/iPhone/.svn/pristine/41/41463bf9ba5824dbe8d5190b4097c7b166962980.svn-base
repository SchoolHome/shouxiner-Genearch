//
//  TaggingLunar.m
//  Timex
//
//  Created by liangshuang on 9/6/12.
//  Copyright (c) 2012 wang shuo. All rights reserved.
//

#import "TaggingLunar.h"
@interface TaggingLunar()
@property(nonatomic, strong) NSString *keywordLunarPrefix;
@property(nonatomic, strong) NSString *keywordLunarYear;
@property(nonatomic, strong) NSString *keywordLunarMonth;
@property(nonatomic, strong) NSString *keywordLunarDayPrefix;
@property(nonatomic, strong) NSString *keywordLunarDay;
@property(nonatomic, strong) NSString *keywordLunarHoliday;

@property(nonatomic, strong) NSString *lunarRecPattern;
@property(nonatomic, strong) NSString *lunarParsePattern;
@property(nonatomic, strong) NSArray *holidayKeyword;
@property(nonatomic, strong) NSArray *holidayOffset;
@property(nonatomic, strong) NSArray *solarTerms;
-(BOOL) isLunar:(NSString *) input;
-(NSMutableDictionary *) getParsedKeywords:(NSString *) input;
-(NSMutableArray *) getLunarDate:(NSString *) input;
-(NSString *) containSolarTerm:(NSString *) input;
-(NSMutableArray *) getLunarHoliday:(NSString *)input;
-(void) setToNextSolarTerm:(NSDateComponents *)calendar withSolarTerm:(NSString *)solarTerm;

@end

@implementation TaggingLunar
@synthesize keywordLunarPrefix = _keywordLunarPrefix;
@synthesize keywordLunarYear = _keywordLunarYear;
@synthesize keywordLunarMonth = _keywordLunarMonth;
@synthesize keywordLunarDayPrefix = _keywordLunarDayPrefix;
@synthesize keywordLunarDay = _keywordLunarDay;
@synthesize keywordLunarHoliday = _keywordLunarHoliday;

@synthesize lunarRecPattern = _lunarRecPattern;
@synthesize lunarParsePattern = _lunarParsePattern;
@synthesize holidayKeyword = _holidayKeyword;
@synthesize holidayOffset = _holidayOffset;
@synthesize solarTerms = _solarTerms;

-(id) init{
    self = [super init];
    if (self){
        self.keywordLunarPrefix = @"l_prefix";
        self.keywordLunarYear = @"l_year";
        self.keywordLunarMonth = @"l_month";
        self.keywordLunarDayPrefix = @"l_day_prefix";
        self.keywordLunarDay = @"l_day";
        self.keywordLunarHoliday = @"l_holiday";
        
        self.lunarRecPattern = @"除夕|春节|端午|中秋|重阳|7夕|农历|阴历|夏历|大年|腊月|正月";
        self.lunarParsePattern = @"(?:([农阴夏])历)?(?:(\\d+|大)年)?(?:(腊|正|\\d+)月)?(初?)(?:(\\d+)[^夕号日])|(除夕|春节|端午|中秋|重阳|7夕)";
        self.holidayKeyword = [[NSArray alloc]initWithObjects:@"除夕", @"春节", @"端午", @"中秋", @"重阳", @"7夕", nil ] ;
        self.holidayOffset = [[NSArray alloc]initWithObjects:
                              [NSNumber numberWithInt:1230],
                              [NSNumber numberWithInt:101],
                              [NSNumber numberWithInt:505],
                              [NSNumber numberWithInt:815],
                              [NSNumber numberWithInt:909],
                              [NSNumber numberWithInt:707],
                              nil];
        self.solarTerms = [[NSArray alloc]initWithObjects:@"小寒", @"大寒", @"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏",
                           @"小满", @"芒种", @"夏至", @"小暑", @"大暑", @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", nil ] ;
        
        self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    }
    return self;
}

-(BOOL) isLunar:(NSString *) input{
    
    if (nil  == input)
        return NO;
    //1. 初始化正则表达式
    NSError *error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.lunarRecPattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //2. 执行匹配的过程
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    
    //3. 用下面的办法来遍历第一次匹配上的记录
    if (matches.count != 0)
        return YES;
    return NO;
}

-(NSMutableDictionary *) getParsedKeywords:(NSString *) input {
    if (nil  == input)
        return nil;
    //1. 初始化正则表达式
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSError * error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.lunarParsePattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //2. 执行匹配的过程
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0, [input length])];
    
    //3. 遍历匹配结果
    if (matches.count != 0)
    {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        for (int i = 1; i <= 6 ;i ++){
            NSString * matchedString = [TimeUtil getMatchResult:input withMatch:match atIndex:i];
            if (nil == matchedString)
                continue;
            switch (i) {
                case 1:
                    [dictionary setObject:matchedString forKey:self.keywordLunarPrefix];
                    break;
                case 2:
                    [dictionary setObject:matchedString forKey:self.keywordLunarYear];
                    break;
                case 3:
                    [dictionary setObject:matchedString forKey:self.keywordLunarMonth];
                    break;
                case 4:
                    [dictionary setObject:matchedString forKey:self.keywordLunarDayPrefix];
                    break;
                case 5:
                    [dictionary setObject:matchedString forKey:self.keywordLunarDay];
                    break;
                case 6:
                    [dictionary setObject:matchedString forKey:self.keywordLunarHoliday];
                    break;
                    
                default:
                    break;
            }
        }
    }
    return dictionary;
}

-(NSMutableArray *) getLunarHoliday:(NSString *)input {
    if (nil  == input)
        return nil;
    NSMutableArray * result = [[NSMutableArray alloc]init];
    int index = [TimeUtil indexOfAny:input withStringArray:self.holidayKeyword];
    if (index != NSNotFound) {
        [result addObject:[NSNumber numberWithInt:[[self.holidayOffset objectAtIndex:index]intValue] / 100]];
        [result addObject:[NSNumber numberWithInt:[[self.holidayOffset objectAtIndex:index]intValue] % 100]];
        return result;
    }
    return nil;
}

-(NSString *) containSolarTerm:(NSString *) input {
    if (nil == input)
        return nil;
    int index = [TimeUtil indexOfAny:input withStringArray:self.solarTerms];
    if (index != NSNotFound)
        return [self.solarTerms objectAtIndex:index];
    return nil;
}


-(NSMutableArray *) getLunarDate:(NSString *) input{
    if (nil == input) {
        return nil;
    }
    NSMutableArray *lunarCalendar = [LunarCalendar todayLunar];
    NSDictionary * dictionary = [self getParsedKeywords:input];
    
    NSString *holidayStr = [dictionary objectForKey:self.keywordLunarHoliday];
    NSString *yearStr = [dictionary objectForKey:self.keywordLunarYear];
    NSString *monthStr = [dictionary objectForKey:self.keywordLunarMonth];
    NSString *dayPrefixStr = [dictionary objectForKey:self.keywordLunarDayPrefix];
    NSString *dayStr = [dictionary objectForKey:self.keywordLunarDay];
    
    NSNumberFormatter * formatter  = [[NSNumberFormatter alloc]init];
    
    // 1. 是否是农历节假日
    if (nil != holidayStr) {
        NSArray * holidayDate = nil;
        if (nil != (holidayDate = [self getLunarHoliday:input])) {
            [lunarCalendar insertObject:[holidayDate objectAtIndex:0] atIndex:1];
            [lunarCalendar insertObject:[holidayDate objectAtIndex:1] atIndex:2];
        }
    }
    
    // 2. 设定年
    if (nil != yearStr && ![yearStr isEqualToString:@""]) {
        NSNumber *year = [formatter numberFromString:yearStr];
        if (nil != year)
            [lunarCalendar insertObject:year atIndex:0];
    }
    
    // 3. 设定月
    if (nil != monthStr) {
        NSNumber * month = [formatter numberFromString:monthStr];
        if (nil != month)
            [lunarCalendar insertObject:month atIndex:1];
        else if ([monthStr isEqualToString: @"正"])
            [lunarCalendar insertObject:[NSNumber numberWithInt:1] atIndex:1];
        else if ([monthStr isEqualToString: @"腊"])
            [lunarCalendar insertObject:[NSNumber numberWithInt:12] atIndex:1];
    } else if ([yearStr isEqualToString: @"大"]) {
        if (nil == dayPrefixStr || [dayPrefixStr isEqualToString:@""])
            [lunarCalendar insertObject:[NSNumber numberWithInt:12] atIndex:1];
        else if ([dayPrefixStr isEqualToString:@"初"])
            [lunarCalendar insertObject:[NSNumber numberWithInt:1] atIndex:1];
    }
    
    // 4. 设定日
    if (nil != dayStr) {
        NSNumber *day = [formatter numberFromString:dayStr];
        if (nil != day)
            [lunarCalendar insertObject:day atIndex:2];
    }
    
    return lunarCalendar;
}

- (void) setToNextSolarTerm:(NSDateComponents*) dateComponents withSolarTerm:(NSString*) solarTerm{
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *today =[[NSCalendar currentCalendar]components:unitFlags fromDate:[NSDate date]];
    SolarTerm *solarTermTransformer = [[SolarTerm alloc]init];
    
    NSArray * calendarParam = [solarTermTransformer solarTermDate:today.year withSolarTerm:solarTerm];
    [dateComponents setYear:[[calendarParam objectAtIndex:0] intValue]];
    [dateComponents setMonth:[[calendarParam objectAtIndex:1] intValue]];
    [dateComponents setDay:[[calendarParam objectAtIndex:2] intValue]];
    
    int dateValue = dateComponents.year * 10000 + dateComponents.month * 100 + dateComponents.day;
    int todayValue = today.year * 10000 + today.month * 100 + today.day  ;
    if ( dateValue < todayValue) {
        calendarParam = [solarTermTransformer solarTermDate:dateComponents.year + 1 withSolarTerm: solarTerm ];
        [dateComponents setYear:[[calendarParam objectAtIndex:0] intValue]];
        [dateComponents setMonth:[[calendarParam objectAtIndex:1] intValue]];
        [dateComponents setDay:[[calendarParam objectAtIndex:2] intValue]];
    }
    
}

- (BOOL) process:(NSString *)origInput withInput:(NSString *) input  withComponents:(NSDateComponents*) dateComponents{
    
    if (nil == origInput || nil == input || nil == dateComponents) {
        return NO;
    }

    NSString * solarTerm = [self containSolarTerm:input];
    // 是否是节气，优先级高
    if (nil != solarTerm) {
        NSLog(@"这是节气%@", solarTerm);
        [self setToNextSolarTerm:dateComponents withSolarTerm:solarTerm];
        return YES;
    }
    // 是否是农历
    if ([self isLunar:input]) {
        int lunarYear = 0;
        int lunarMonth = 0;
        int lunarDay = 0;
        NSArray * lunarToday = [LunarCalendar todayLunar];
        
        int lunarTodayValue = [[lunarToday objectAtIndex:0] intValue] * 10000 + [[lunarToday objectAtIndex:1] intValue] * 100 + [[lunarToday objectAtIndex:2] intValue];
        
        NSMutableArray * lunarCalendar = [self getLunarDate:input];
        int lunarCalendarValue = [[lunarCalendar objectAtIndex:0] intValue] * 10000 + [[lunarCalendar objectAtIndex:1] intValue] * 100 + [[lunarCalendar objectAtIndex:2] intValue];
        
        lunarYear = [[lunarCalendar objectAtIndex:0]intValue];
        if (lunarCalendarValue < lunarTodayValue){
            lunarYear += 1;
        }
        lunarMonth = [[lunarCalendar objectAtIndex:1]intValue];
        lunarDay = [[lunarCalendar objectAtIndex:2]intValue];
        
        NSArray * calendarParam = [LunarCalendar sCalendarLunarToSolar:lunarYear withMonth:lunarMonth withDay:lunarDay];
        [dateComponents setYear:[[calendarParam objectAtIndex:0] intValue]];
        [dateComponents setMonth:[[calendarParam objectAtIndex:1] intValue]];
        [dateComponents setDay:[[calendarParam objectAtIndex:2] intValue]];
        return true;
    }
    return NO;
}

@end
