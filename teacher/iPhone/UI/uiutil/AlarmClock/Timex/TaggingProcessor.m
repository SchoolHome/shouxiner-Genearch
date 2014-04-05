//
//  TaggingProcessor.m
//  Timex
//
//  Created by liangshuang on 9/4/12.
//  Copyright (c) 2012 wang shuo. All rights reserved.
//

#import "TaggingProcessor.h"

@implementation TaggingProcessor
@synthesize calendar = _calendar;

- (BOOL) process:(NSString *)origInput withInput:(NSString *) input  withComponents:(NSDateComponents*) dateComponents{
    return YES;
}

-(id) init{
    self = [super init];
    if (nil != self) {
        self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        [self.calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+8"]];
    }
    return self;
}
@end
