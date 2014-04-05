//
//  TimeUtil.m
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TimeUtil.h"
static TimeUtil *instance = nil;

@interface TimeUtil ()
@property (nonatomic,strong) NSString *numPattern;
@property (nonatomic,strong) NSDictionary *zhDigit2DigitMap;
@property (nonatomic,strong) NSArray *numUnit;

+(int) transNumber : (NSString *)str;
+(int) cnNumToInt : (NSString *)str;

@end

@implementation TimeUtil
@synthesize numPattern = _numPattern , zhDigit2DigitMap = _zhDigit2DigitMap;
@synthesize numUnit = _numUnit;

+(TimeUtil *)getInstance{
	@synchronized(self){
		if (instance==nil){
			instance = [[TimeUtil alloc]init];
            instance.zhDigit2DigitMap = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [NSNumber numberWithInt:0],@"零",
                                         [NSNumber numberWithInt:1],@"一",
                                         [NSNumber numberWithInt:2],@"二",
                                         [NSNumber numberWithInt:3],@"三",
                                         [NSNumber numberWithInt:4],@"四",
                                         [NSNumber numberWithInt:5],@"五",
                                         [NSNumber numberWithInt:6],@"六",
                                         [NSNumber numberWithInt:7],@"七",
                                         [NSNumber numberWithInt:8],@"八",
                                         [NSNumber numberWithInt:9],@"九",
                                         nil];
            instance.numUnit = [NSArray arrayWithObjects:@"十",@"百",@"千",@"万",@"亿", nil];
            
            instance.numPattern = @"([〇零一二三四五六七八九十百千万亿两]+)";
		}
	}
	return instance;
}

-(NSString *) prepareInput : (NSString *)str{
    if (nil == str || [str isEqualToString:@""]) {
        return @"";
    }
    
    NSMutableString *newStr = [NSMutableString  stringWithString:str];
    NSError *error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:instance.numPattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regularExpression matchesInString:str options:NSMatchingCompleted range:NSMakeRange(0,[str length])];
    
    if (matches.count > 0) {
        for (int i = 0; i<matches.count; i++) {
            NSTextCheckingResult *match = [matches objectAtIndex:i];
            NSString *number = [TimeUtil getMatchResult:str withMatch:match atIndex:1];
            //NSLog(@"第%d为%@",i,number);
            int value = -1;
            if ([TimeUtil indexOfAny:number withStringArray:instance.numUnit] == NSNotFound) {
                value = [TimeUtil transNumber:number];
            }else{
                value = [TimeUtil cnNumToInt:number];
            }
            
            if (value == -1) {
                continue;
            }else{
                //newStr = [newStr stringByReplacingOccurrencesOfString:number withString:[NSString stringWithFormat:@"%d",value]];
                [newStr replaceCharactersInRange:match.range withString:[NSString stringWithFormat:@"%d",value]];
            }
        }
    }
    //NSLog(@"%@",newStr);
    return newStr;
}

+(int) transNumber : (NSString *)str{
    if (nil == str || [str isEqualToString:@""]) {
        return -1;
    }
    int ret = 0;
    NSUInteger sz = str.length;

    for (int i = 0; i<sz; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *single = [str substringWithRange:range];
        NSNumber *v = [instance.zhDigit2DigitMap objectForKey:single];
        if ( nil != v ) {
            ret = ret * 10 + [v intValue];
        }else{
            return -1;
        }
    }
    return ret;
}

+(int) cnNumToInt : (NSString *)str{
    
    if (nil == str || [str isEqualToString:@""]) {
        return -1;
    }
    
    int result = 0;
    
    int yi = 1;// 记录高级单位
    int wan = 1;// 记录高级单位
    int ge = 1;// 记录单位
    
    for (int i = str.length - 1; i >= 0; i--) {
        NSRange range = NSMakeRange(i, 1);
        NSString *num = [str substringWithRange:range];
        int temp = 0;// 记录数值
        if ([num isEqualToString:@"〇"] || [num isEqualToString:@"零"]) {
            temp = 0;
        }else if ([num isEqualToString:@"一"]){
            temp = 1 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"二"] || [num isEqualToString:@"两"]){
            temp = 2 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"三"]){
            temp = 3 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"四"]){
            temp = 4 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"五"]){
            temp = 5 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"六"]){
            temp = 6 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"七"]){
            temp = 7 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"八"]){
            temp = 8 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"九"]){
            temp = 9 * ge * wan * yi;
            ge = 1;
        }else if ([num isEqualToString:@"十"]){
            ge = 10;
        }else if ([num isEqualToString:@"百"]){
            ge = 100;
        }else if ([num isEqualToString:@"千"]){
            ge = 1000;
        }else if ([num isEqualToString:@"万"]){
            wan = 10000;
        }else if ([num isEqualToString:@"亿"]){
            yi = 100000000;
            wan = 1;
            ge = 1;
        }else{
            return -1;
        }
        result += temp;
    }
    if (ge > 1) {
        result += 1 * ge * wan * yi;
    }
    return result;
}

+(NSUInteger) indexOfAny:(NSString *) input withStringArray:(NSArray *)stringArray{
    if (nil == input || [input isEqualToString:@""])
        return NSNotFound;
    if (nil == stringArray || [stringArray count] == 0)
        return NSNotFound;
    
    for (int i = 0; i < [stringArray count]; i ++){
        NSString *curKeyword = [stringArray objectAtIndex:i];
        NSRange range = [input rangeOfString:curKeyword];
        if (range.location != NSNotFound)
            return i;
    }
    return NSNotFound;
}

+ (NSString *) getMatchResult:(NSString *)input withMatch:(NSTextCheckingResult *)match atIndex:(int) index{
    if (nil == match|| nil == input)
        return nil;
    
    NSRange prefixRange = [match rangeAtIndex:index];
    if (!NSEqualRanges(prefixRange, NSMakeRange(NSNotFound, 0))) {    // 由时分组1可能没有找到相应的匹配，用这种办法来判断
        NSString *matchedValue = [input substringWithRange:prefixRange];  // 分组1所对应的串
        //NSLog(@"matched value at %d: %@",index, matchedValue);
        return matchedValue;
    }
    return nil;
}

@end
