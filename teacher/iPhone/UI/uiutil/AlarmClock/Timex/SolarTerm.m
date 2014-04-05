//
//  SolarTerm.m
//  Timex
//
//  Created by liangshuang on 9/10/12.
//  Copyright (c) 2012 wang shuo. All rights reserved.
//

#import "SolarTerm.h"
@interface SolarTerm()
@property(nonatomic,strong) NSArray *solarTermKeyword;
@property(nonatomic,strong) NSMutableDictionary *INCREASE_OFFSETMAP;
@property(nonatomic,strong) NSMutableDictionary *DECREASE_OFFSETMAP;
-(int) getSolarTermNum:(int) year withSolarTerm:(NSNumber*) name;
-(int) specialYearOffset:(int) year withSolarTerm:(NSNumber *) name;
-(int) getOffset:(NSDictionary *) map withYear:(int) year withName:(NSNumber*) name withOffset:(int)offset;

@end
@implementation SolarTerm
@synthesize solarTermKeyword = _solarTermKeyword;
@synthesize INCREASE_OFFSETMAP = _INCREASE_OFFSETMAP;
@synthesize DECREASE_OFFSETMAP = _DECREASE_OFFSETMAP;
static double D = 0.2422;
static int solarTermMonth[] = { 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 1, 1 };

// 定义一个二维数组，第一维数组存储的是20世纪的节气C值，第二维数组存储的是21世纪的节气C值,0到23个，依次代表立春、雨水...大寒节气的C值
static double CENTURY_ARRAY[2][24] = {
    { 4.6295, 19.4599, 6.3826, 21.4155, 5.59, 20.888, 6.318, 21.86, 6.5, 22.2, 7.928, 23.65, 8.35, 23.95, 8.44,
        23.822, 9.098, 24.218, 8.218, 23.08, 7.9, 22.6, 6.11, 20.84 },
    { 3.87, 18.73, 5.63, 20.646, 4.81, 20.1, 5.52, 21.04, 5.678, 21.37, 7.108, 22.83, 7.5, 23.13, 7.646,
        23.042, 8.318, 23.438, 7.438, 22.36, 7.18, 21.94, 5.4055, 20.12 } };
- (id) init{
    self = [super init];
    if (nil != self){
        self.solarTermKeyword = [[NSArray alloc]initWithObjects:@"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至", @"小暑", @"大暑", @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", @"小寒", @"大寒", nil];
        self.INCREASE_OFFSETMAP = [[NSMutableDictionary alloc]init];
        self.DECREASE_OFFSETMAP = [[NSMutableDictionary alloc]init];
        [self.DECREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2026],nil] forKey:[NSNumber numberWithInt:YUSHUI]];// 雨水
        [self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2084],nil] forKey:[NSNumber numberWithInt:CHUNFEN]];// 春分
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2008],nil] forKey:[NSNumber numberWithInt:XIAOMAN]];// 小满
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1902],nil] forKey:[NSNumber numberWithInt:MANGZHONG]];// 芒种
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1928],nil] forKey:[NSNumber numberWithInt:XIAZHI]];// 夏至
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1925],[NSNumber numberWithInt:2016],nil] forKey:[NSNumber numberWithInt:XIAOSHU]];// 小暑
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1922],nil] forKey:[NSNumber numberWithInt:DASHU]];// 大暑
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2002],nil] forKey:[NSNumber numberWithInt:LIQIU]];// 立秋
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1927],nil] forKey:[NSNumber numberWithInt:BAILU]];// 白露
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1942],nil] forKey:[NSNumber numberWithInt:QIUFEN]];// 秋分
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2089],nil] forKey:[NSNumber numberWithInt:SHUANGJIANG]];// 霜降
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2089],nil] forKey:[NSNumber numberWithInt:LIDONG]];// 立冬
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1978],nil] forKey:[NSNumber numberWithInt:XIAOXUE]];// 小雪
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1954],nil] forKey:[NSNumber numberWithInt:DAXUE]];// 大雪
		[self.DECREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1918],[NSNumber numberWithInt:2021],nil] forKey:[NSNumber numberWithInt:DONGZHI]];// 冬至
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:1982],nil] forKey:[NSNumber numberWithInt:XIAOHAN]];// 小寒
		[self.DECREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2019],nil] forKey:[NSNumber numberWithInt:XIAOHAN]];// 小寒
		[self.INCREASE_OFFSETMAP setObject:[[NSArray alloc]initWithObjects:[NSNumber numberWithInt:2082],nil] forKey:[NSNumber numberWithInt:DAHAN]];// 大寒
        
    }
    return self;
}

/**
 *
 * @param year
 *            年份
 * @param name
 *            节气的名称
 * @return 返回节气是相应月份的第几天
 */
-(int) getSolarTermNum:(int) year withSolarTerm:(NSNumber*) name {
    
    double centuryValue = 0;// 节气的世纪值，每个节气的每个世纪值都不同
    int ordinal = name.intValue;
    
    int centuryIndex = -1;
    if (year >= 1901 && year <= 2000) // 20世纪
        centuryIndex = 0;
    else if (year >= 2001 && year <= 2100) // 21世纪
        centuryIndex = 1;
    else  //不支持
        return -1;
    
    centuryValue = CENTURY_ARRAY[centuryIndex][ordinal];
    int dateNum = 0;
    /**
     * 计算 num =[Y*D+C]-L这是传说中的寿星通用公式
     * 公式解读：年数的后2位乘0.2422加C(即：centuryValue)取整数后，减闰年数
     */
    int y = year % 100;// 步骤1:取年分的后两位数
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {// 闰年
        if (ordinal == XIAOHAN || ordinal == DAHAN || ordinal == LICHUN || ordinal == YUSHUI) {
            // 注意：凡闰年3月1日前闰年数要减一，即：L=[(Y-1)/4],因为小寒、大寒、立春、雨水这两个节气都小于3月1日,所以 y = y-1
            y = y - 1;// 步骤2
        }
    }
    dateNum = (int) (y * D + centuryValue) - (int) (y / 4);// 步骤3，使用公式[Y*D+C]-L计算
    dateNum += [self specialYearOffset:year withSolarTerm:name];// 步骤4，加上特殊的年分的节气偏移量
    return dateNum;
}

-(NSMutableArray*) solarTermDate:(int) year withSolarTerm:(NSString *) name {
    NSMutableArray *result = [[NSMutableArray alloc]init];
    [result insertObject:[NSNumber numberWithInt:year] atIndex:0];
    int index = [TimeUtil indexOfAny:name withStringArray:self.solarTermKeyword];
    if (index != -1) {
        [result insertObject:[NSNumber numberWithInt:solarTermMonth[index]] atIndex:1];
        int day = [self getSolarTermNum:year withSolarTerm:[NSNumber numberWithInt:index]];
        [result insertObject:[NSNumber numberWithInt:day] atIndex:2];
        
    }
    return result;
}

/**
 * 特例,特殊的年分的节气偏移量,由于公式并不完善，所以算出的个别节气的第几天数并不准确，在此返回其偏移量
 *
 * @param year
 *            年份
 * @param name
 *            节气名称
 * @return 返回其偏移量
 */
-(int) specialYearOffset:(int) year withSolarTerm:(NSNumber *) name {
    int offset = 0;
    offset += [self getOffset:self.DECREASE_OFFSETMAP withYear:year withName:name withOffset:-1];
    offset += [self getOffset:self.INCREASE_OFFSETMAP withYear:year withName:name withOffset:1];
    return offset;
}


-(int) getOffset:(NSDictionary *) map withYear:(int) year withName:(NSNumber*) name withOffset:(int)offset {
    int off = 0;
    NSArray * years = [map objectForKey:name];
    if (nil != years) {
        for (NSNumber *i in years) {
            if (i.intValue == year) {
                off = offset;
                break;
            }
        }
    }
    return off;
}

@end
