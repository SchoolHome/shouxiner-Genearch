//
//  TimeUtil.h
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject
+(TimeUtil *)getInstance;

+(NSUInteger) indexOfAny:(NSString *) input withStringArray:(NSArray *)stringArray;
+(NSString *) getMatchResult:(NSString *)input withMatch:(NSTextCheckingResult *)match atIndex:(int) index;

-(NSString *) prepareInput : (NSString *)str;

@end
