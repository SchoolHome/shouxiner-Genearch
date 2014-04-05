//
//  TaggingYear.m
//  Timex
//
//  Created by wang shuo on 12-9-6.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TaggingYear.h"

@interface TaggingYear ()
@property (nonatomic,strong) NSArray *keyword;
@property (nonatomic,strong) NSArray *offset;
@property (nonatomic,strong) NSString *yearPattern;
@end

@implementation TaggingYear
@synthesize keyword = _keyword , offset = _offset , yearPattern = _yearPattern;

-(id) init{
    self = [super init];
    if (nil != self) {
        self.keyword = [NSArray arrayWithObjects:@"今年",@"明年",@"后年",@"大后年", nil];
        self.offset = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
        self.yearPattern = @"(\\d{1,4})年([前后]*)";
    }
    return self;
}

-(BOOL) process:(NSString *)origInput withInput:(NSString *)input withComponents:(NSDateComponents *)dateComponents{
    
    NSUInteger result = [TimeUtil indexOfAny:input withStringArray:self.keyword];
    if ( result == NSNotFound ) {
        return NO;
    }else{
        NSNumber *year = [self.offset objectAtIndex:result];
        [dateComponents setYear:(dateComponents.year + [year intValue])];
        return YES;
    }
    
    NSError *error;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.yearPattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regularExpression matchesInString:input options:NSMatchingCompleted range:NSMakeRange(0,[input length])];
    // xxxx年
    NSString *numberPrefixValue = @"";
    // 前后
    NSString *wordSuffixValue = @"";
    
    if (matches.count > 0) {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        NSNumberFormatter * formatter  = [[NSNumberFormatter alloc]init];
        
        numberPrefixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:1];
        wordSuffixValue = [TimeUtil getMatchResult:input withMatch:match atIndex:2];
        
        if (nil != numberPrefixValue) {
            NSNumber *year = [formatter numberFromString:numberPrefixValue];
            if ([year intValue] > 1000) {
                [dateComponents setYear:[year intValue]];
                return YES;
            }else if ([year intValue] >= 10 && [year intValue] < 100){
                [dateComponents setYear:2000 + [year intValue]];
                return YES;
            }else{
                if (nil != wordSuffixValue) {
                    if ([wordSuffixValue isEqualToString:@"后"]) {
                        [dateComponents setYear:dateComponents.year + [year intValue]];
                        return YES;
                    }else if ([wordSuffixValue isEqualToString:@"前"]){
                        [dateComponents setYear:dateComponents.year - [year intValue]];
                        return YES;
                    }
                }
            }
        }
    }
    return NO;
}

@end
