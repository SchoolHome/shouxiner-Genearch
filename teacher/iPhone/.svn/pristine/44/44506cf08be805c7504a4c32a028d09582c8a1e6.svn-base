//
//  FXCountDown.h
//  MedianAlarm
//
//  Created by 振杰 李 on 12-2-21.
//  Copyright (c) 2012年 pansi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FXCountDownDelegate <NSObject>
-(void)endNotify;
@end

@interface FXCountDown : UIView{
    
    UILabel * countdownnumber;
    NSTimer * timmer;
    UIColor * textcolor;
    NSString * displaykey;
}
@property (strong,nonatomic) UILabel *countdownnumber;
@property (nonatomic,assign) NSInteger number;
@property (nonatomic, strong) NSNumber * fnumber;
@property (nonatomic,assign) NSInteger interval;
@property (strong,nonatomic) id <FXCountDownDelegate> delegate;
@property (strong,nonatomic) UIColor *textcolor;

@property (strong,nonatomic) NSString *displaykey;
- (id)initWithFrame:(CGRect)frame beginNum:(int)begin interval:(int)inter txtColor:(UIColor *)txtcolor disKey:(NSString *)key;
- (void)StartCountDown;
- (void)StopCountDown;


@end
