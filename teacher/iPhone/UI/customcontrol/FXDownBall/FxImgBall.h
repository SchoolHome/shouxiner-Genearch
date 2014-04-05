//
//  FxDownBall.h
//  Shuangshuang
//
//  Created by 振杰 李 on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMedallionView.h"
#import <QuartzCore/QuartzCore.h>
#define FX_SHAKE_DURATION 0.05
#define FX_SHAKE_REPEATE 3
#define FX_SHAKE_LENGTH 20.0f

#define FX_SHAKE_ALERT_WIDTH 30
#define FX_SHAKE_ALERT_HEIGHT 30
@protocol FxImgBallDelegate <NSObject>

-(void)ChooseImageFrom:(NSInteger)imgtype tag:(NSInteger)tag;

@end

@interface FxImgBall : UIView <UIActionSheetDelegate>{
    
    AGMedallionView *agview;
    
    NSTimer *runtimer;
    
    NSTimer *lowdowntimer;
    
    float myangle;

    int v;

//    id <FxImgBallDelegate> delegate;
    
    UIActionSheet *actionsheet;
    
    UIButton *button;
    
    int operatetype;
    
    BOOL needhightlight;
}
@property (nonatomic,assign) id<FxImgBallDelegate> delegate;

@property (nonatomic,retain)  AGMedallionView *agview;

@property (nonatomic) int operatetype;

/*
 button暴露出来，允许修改button属性
 王硕修改与2012年4月13日
*/
@property(strong, nonatomic) UIButton *button;
/* 
 设置点击头像图片是否触发事件
 为yes触发事件
 为no不触发事件
 王硕修改与2012年4月13日
*/
@property(nonatomic) BOOL isChangeImage;

-(id)initWithFrame:(CGRect)frame img:(UIImage *)img opttype:(int)operatetype;

-(id)initWithFrame:(CGRect)frame img:(UIImage *)img needhightlight:(BOOL)needhightlightx;

-(void)StartSelfRotate;

-(void)StopSelfRotate;

-(void)ResetImage:(UIImage *)img;

-(UIImage *)retriveImg;

-(void)ReloadImg:(UIImage *)img;

- (void)do_shake;
    
@end
