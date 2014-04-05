//
//  TimeTestViewController.m
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import "TimeTestViewController.h"
#import "TaggingDayTime.h"
#import "TaggingHoliday.h"
#import "TaggingWeekDay.h"
#import "TaggingLunar.h"

#import "TimeDetector.h"
#import "TimeParser.h"
@interface TimeTestViewController ()

@end

@implementation TimeTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    NSDateComponents *comps =[[NSCalendar currentCalendar]components:unitTimeFlags fromDate:[NSDate date]];
    [comps setSecond:0];
    
    NSMutableArray *testArray = [[NSMutableArray alloc]init];
    [testArray addObject:@"我想明早16点去踏青"];
    [testArray addObject:@"我想明晚7点去踏青"];
    [testArray addObject:@"我想清明去踏青"];
    [testArray addObject:@"我想端午出去玩"];
    [testArray addObject:@"我想本周3出去玩"];
    [testArray addObject:@"我想下个周3出去玩"];
    [testArray addObject:@"下周"];
    [testArray addObject:@"不如本周3开个会"];
    [testArray addObject:@"不如本月3开个会"];
    [testArray addObject:@"不如下个月3号开个会"];
    [testArray addObject:@"不如下个月3日开个会"];
    [testArray addObject:@"不如23日早上开个会"];
    [testArray addObject:@"不如5点半开个会"];
    [testArray addObject:@"不如下午5点半开个会"];
    [testArray addObject:@"不如早上5点1刻开个会"];
    [testArray addObject:@"不如早上5点30开个会"];
    [testArray addObject:@"不如四月十五开个会"];
    [testArray addObject:@"不如4月20号开个会"];
    [testArray addObject:@"不如下午4点03开个会"];
    [testArray addObject:@"中秋节去姥姥家"];
    [testArray addObject:@"腊月初八"];
    [testArray addObject:@"农历正月初一"];
    [testArray addObject:@"我打算阴历五月二十五去看看"];
    [testArray addObject:@"我打算阴历五月二十五号去看看"];
    [testArray addObject:@"我打算三月初二去看看"];
    [testArray addObject:@"我打算大年初八去看看"];
    [testArray addObject:@"大年三十"];
    [testArray addObject:@"十一干什么去"];
    [testArray addObject:@"五一干什么去"];
    [testArray addObject:@"七夕干什么去"];
    [testArray addObject:@"我想明天下午约你喝茶"];
    
    for (NSString *testString in testArray){
        
        if([TimeDetector containTimeInfo:testString]){
            NSDate * date = [[TimeParser getInstance]process:testString];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSLog(@"%@---%@",testString,[dateFormatter stringFromDate:date]);
        }else{
            NSLog(@"%@ contains NONE",testString);
        }
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
