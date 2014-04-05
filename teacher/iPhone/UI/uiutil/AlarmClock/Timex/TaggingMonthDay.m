//
//  TaggingMonthDay.m
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TaggingMonthDay.h"

@interface TaggingMonthDay ()

@property (nonatomic,strong) NSArray *dayKeyWord;
@property (nonatomic,strong) NSArray *dayOffset;
@property (nonatomic,strong) NSString *monthAndDayPattern;
@property (nonatomic,strong) NSString *dayOfMonthPattern;
@property (nonatomic,strong) NSString *dayPattern;


@end

@implementation TaggingMonthDay
@synthesize dayKeyWord = _dayKeyWord , dayOffset = _dayOffset , monthAndDayPattern = _monthAndDayPattern , dayOfMonthPattern = _dayOfMonthPattern , dayPattern = _dayPattern;


-(id) init{
    self = [super init];
    if (nil != self) {
        self.dayKeyWord = [NSArray arrayWithObjects:@"今天",@"明天",@"明早",@"明晚",@"后天",@"大后天",@"大大后天", nil];
        self.dayOffset = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4], nil];
        
        self.monthAndDayPattern = @"(?:(下*)个?|(\\d{1,2}))月(\\d{1,2})日*";
        
        self.dayOfMonthPattern = @"(\\d{1,2})[日号]";
        self.dayPattern = @"(\\d+)天([前后])";
    }
    return self;
}

-(BOOL) process:(NSString *)origInput withInput:(NSString *)input withComponents:(NSDateComponents *)dateComponents{
    
    NSUInteger result = [TimeUtil indexOfAny:origInput withStringArray:self.dayKeyWord];
    if (result != NSNotFound) {
        NSNumber *dayOffset = [self.dayOffset objectAtIndex:result];
        [dateComponents setDay:[dateComponents day] + [dayOffset intValue]];
        return YES;
    }
    
    NSError *error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.monthAndDayPattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    // 下月
    NSString *wordPrefixValue = @"";
    // x月
    NSString *numberPrefixValue = @"";
    // x日
    NSString *dayValue = @"";
    
    if (matches.count != 0){
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        NSNumberFormatter * formatter  = [[NSNumberFormatter alloc]init];
        
        wordPrefixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
        numberPrefixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:2];
        dayValue = [TimeUtil getMatchResult:input withMatch:match atIndex:3];
        
        if ( nil != wordPrefixValue) {
            [dateComponents setMonth:[dateComponents month] + [wordPrefixValue length]];
            NSNumber *dayNumber = [formatter numberFromString:dayValue];
            [dateComponents setDay:[dayNumber intValue]];
            return YES;
        }
        
        if (nil != numberPrefixValue) {
            NSNumber *month = [formatter numberFromString:numberPrefixValue];
            NSNumber *day = [formatter numberFromString:dayValue];
            if ([month intValue] > 0) {
                if ( (dateComponents.month * 100 + dateComponents.day) > ([month intValue] - 1) * 100 + [day intValue]) {
                    [dateComponents setYear:[dateComponents year] + 1];
                }
                [dateComponents setMonth:[month intValue]];
            }else{
                if ( dateComponents.day > [day intValue] ){
					[dateComponents setMonth:[dateComponents month] + 1];
                }
            }
        }
        NSNumber *day = [formatter numberFromString:dayValue];
        [dateComponents setDay:[day intValue]];
        return YES;
    }
    
    regularExpression = [NSRegularExpression regularExpressionWithPattern:self.dayOfMonthPattern options:NSRegularExpressionCaseInsensitive error:&error];
    matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    
    if (matches.count != 0) {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        NSNumberFormatter * formatter  = [[NSNumberFormatter alloc]init];
        
        dayValue = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
        
        if (nil != dayValue) {
            NSNumber *day = [formatter numberFromString:dayValue];
            if ([day intValue] <= 0) {
                day = [NSNumber numberWithInt:1];
            }
            if ( dateComponents.day > [day intValue] ){
                [dateComponents setMonth:[dateComponents month] + 1];
            }
            [dateComponents setDay:[day intValue]];
        }
    }
    
    regularExpression = [NSRegularExpression regularExpressionWithPattern:self.dayPattern options:NSRegularExpressionCaseInsensitive error:&error];
    matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    if (matches.count != 0) {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        NSNumberFormatter * formatter  = [[NSNumberFormatter alloc]init];
        NSString *wordSuffixValue = @"";
        
        dayValue = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
        wordSuffixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:2];
        
        NSNumber *day = [formatter numberFromString:dayValue];
        if ([day intValue] <= 0) {
            day = [NSNumber numberWithInt:1];
        }
        
        if (nil != wordPrefixValue) {
            if ([wordPrefixValue isEqualToString:@"后"]) {
                [dateComponents setDay:[dateComponents day] +[day intValue]];
            }
        }
    }
    
    return NO;
}

@end
