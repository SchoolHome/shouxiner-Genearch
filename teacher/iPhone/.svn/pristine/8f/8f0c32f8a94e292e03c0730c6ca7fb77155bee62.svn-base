//
//  FXCountDown.m
//  MedianAlarm
//
//  Created by 振杰 李 on 12-2-21.
//  Copyright (c) 2012年 pansi. All rights reserved.
//

#import "FXCountDown.h"
@interface FXCountDown(private)
-(void)RelaceNumber;
@end

@implementation FXCountDown
@synthesize countdownnumber;
@synthesize number = _number;
@synthesize interval = _interval;
@synthesize delegate = _delegate;
@synthesize textcolor=_textcolor;
@synthesize displaykey=_diskey;
@synthesize fnumber = _fnumber;
- (id)initWithFrame:(CGRect)frame beginNum:(int)begin interval:(int)inter txtColor:(UIColor *)txtcolor disKey:(NSString *)key
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.number=begin;
        self.fnumber = [NSNumber numberWithInt:self.number];
        self.interval=inter;
        self.textcolor=txtcolor;
        self.displaykey=key;
        countdownnumber=[[UILabel alloc] initWithFrame:self.bounds];
        countdownnumber.backgroundColor=[UIColor clearColor];
        countdownnumber.textAlignment=UITextAlignmentCenter;
        countdownnumber.font = [UIFont systemFontOfSize:12];
        countdownnumber.textColor=self.textcolor;
        NSString *second=NSLocalizedString(self.displaykey, @"");
        NSString *numbertext=[NSString stringWithFormat:@"%d%@后重新获取",self.number,second];
        countdownnumber.text=numbertext;
        [self addSubview:countdownnumber];
    }
    return self;
}



-(void)StopCountDown{
    NSString *second=NSLocalizedString(self.displaykey, @"");
    NSString *numbertext=[NSString stringWithFormat:@"%d%@",self.number,second];
    countdownnumber.text=numbertext;
    if (timmer!=nil) {
        [timmer invalidate];
        timmer=nil;
    }
}
-(void)StartCountDown{
    self.number = 59;
    self.fnumber = [NSNumber numberWithInt:self.number];
    NSString *second=NSLocalizedString(self.displaykey, @"");
    NSString *numbertext=[NSString stringWithFormat:@"%d%@",self.number,second];
    countdownnumber.text=numbertext; 
    timmer= [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(RelaceNumber) userInfo:nil repeats:YES];
}
/*
 内部循环事件,计时器显示
 */
-(void)RelaceNumber{
    self.number--;
    self.fnumber = [NSNumber numberWithInt:self.number];
    NSString *second=NSLocalizedString(self.displaykey, @"");
    NSString *numbertext=[NSString stringWithFormat:@"%d%@",self.number,second];
    countdownnumber.text=numbertext;
    if (self.number<1) {
        [timmer invalidate];
        timmer=nil;
        if (_delegate!=nil) {
            [_delegate endNotify];
        }
    }
}
@end
