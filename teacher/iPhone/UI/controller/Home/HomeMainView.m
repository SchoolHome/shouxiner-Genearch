//
//  HomeMainView.m
//  iCouple
//
//  Created by qing zhang on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeMainView.h"
#import "messageMainViewController.h"
#import "AlarmClockHelper.h"

//tag:btnPeopleAndDelete : people时tag=90001，delete时tag=90002


@implementation HomeMainView
@synthesize imageviewUpPart = _imageviewUpPart,
        tableviewDownPart = _tableviewDownPart,
    homeMainViewDelegate = _homeMainViewDelegate,
imageviewForTableViewBG = _imageviewForTableViewBG;
    
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // Initialization code

        


        //初始化上部分的imageview
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, -hiddendUpPart, 320.0f, hiddendUpPart+imageviewDisplayPart+HiddendDownPart)];
        self.imageviewUpPart = imageview;
        imageview = nil;
        [self addSubview:self.imageviewUpPart];

        //初始化tableview的背景图
        self.imageviewForTableViewBG = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, tableviewYbeginPoint, 320, 460-tableviewYbeginPoint)];
        self.imageviewForTableViewBG.backgroundColor = [UIColor colorWithRed:243/255.f green:238/255.f blue:229/255.f alpha:1.f];
        self.imageviewForTableViewBG.userInteractionEnabled = YES;
        [self addSubview:self.imageviewForTableViewBG];
        

        UIImageView *imageviewShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_friendsShadow.png"]];
        [imageviewShadow setFrame:CGRectMake(0.f, -21.f, 320.f, 21.f)];
        [self.imageviewForTableViewBG addSubview:imageviewShadow];
        

        
//        UIButton *btnToHome = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btnToHome setFrame:CGRectMake(0.0f, 0.0f, 60.0f, 60.f)];
//        [btnToHome setBackgroundImage:[UIImage imageNamed:@"btn_home.png"] forState:UIControlStateNormal];
//        [btnToHome setBackgroundImage:[UIImage imageNamed:@"btn_home_press.png"] forState:UIControlStateHighlighted];
//        [btnToHome addTarget:self action:@selector(btn_ToGoHome) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:btnToHome];
 
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame Image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
           }
    return self;
}
#pragma mark method
 /***************
  ButtonMethod
  **************/
- (void)btn_ToGoHome
{
    [self.homeMainViewDelegate goHomeController];
}


-(void)delayHideTopBG
{
        if ([self.homeMainViewDelegate respondsToSelector:@selector(viewOrHideTopBackground:)]) {
            [self.homeMainViewDelegate viewOrHideTopBackground:NO];
        }
}

- (void)scaleImageviewByoffsetValue : (CGFloat)offsetValue
{
      
    //如果isScrolling=YES说明是tableview的滚动事件，反之则是imageview
    if (offsetValue != 0) {
        if ([self.homeMainViewDelegate respondsToSelector:@selector(turnOffScrollviewScrollable)]) {
            [self.homeMainViewDelegate turnOffScrollviewScrollable];
        }        
        if ([self.homeMainViewDelegate respondsToSelector:@selector(viewOrHideTopBackground:)]) {
            [self.homeMainViewDelegate viewOrHideTopBackground:YES];
        }
    }else {
//        if ([self.homeMainViewDelegate respondsToSelector:@selector(viewOrHideTopBackground:)]) {
//            [self.homeMainViewDelegate viewOrHideTopBackground:NO];
//        }
        [self performSelector:@selector(delayHideTopBG) withObject:nil afterDelay:0.4f];
    }
    
    if (!isScrolling) {

        CGRect frame    =   self.tableviewDownPart.frame;
        frame.origin.y  =   tableviewYbeginPoint + offsetValue/2.f;
        self.tableviewDownPart.frame = frame;
        
        CGRect imageviewForTableViewBGframe    =   self.imageviewForTableViewBG.frame;
        imageviewForTableViewBGframe.origin.y  =   tableviewYbeginPoint + offsetValue/2.f;
        self.imageviewForTableViewBG.frame  =   imageviewForTableViewBGframe; 
        
        CGRect imageviewframe = self.imageviewUpPart.frame;
        //imageviewframe.size.height   =   imageviewHeight+point.y / 2.0f;


        if (offsetValue/3.5 >= 23.f) {
            imageviewframe.origin.y = -hiddendUpPart+offsetValue/ 2.f-23;  
        }else {
            imageviewframe.origin.y = -hiddendUpPart+offsetValue/ 3.5f;  
        }
        
        if (offsetValue >= 0 ) {
            CGPoint hideBordPoint = hideBordInIMView.center;
            hideBordPoint.y = 157.5 + offsetValue/2.f;
            hideBordInIMView.center = hideBordPoint;
        }
        self.imageviewUpPart.frame = imageviewframe;

    }else {

        CGRect imageviewForTableViewBGframe    =   self.imageviewForTableViewBG.frame;
        imageviewForTableViewBGframe.origin.y  =   tableviewYbeginPoint + offsetValue/1.0f;
        self.imageviewForTableViewBG.frame  =   imageviewForTableViewBGframe; 
        
        CGRect imageviewframe = self.imageviewUpPart.frame;
        //imageviewframe.size.height   =   imageviewHeight+point.y / 2.0f;
        if (offsetValue/2.f >= 30.f) {
            imageviewframe.origin.y = -hiddendUpPart+offsetValue/ 1.0f-30;  
        }else {
            imageviewframe.origin.y = -hiddendUpPart+offsetValue/ 2.0f;  
        }
        
        if (offsetValue >= 0 ) {
            CGPoint hideBordPoint = hideBordInIMView.center;
            hideBordPoint.y = 157.5 + offsetValue/1.f;
            hideBordInIMView.center = hideBordPoint;
        }
        
        self.imageviewUpPart.frame = imageviewframe;
        

    }
  
    
    
    
    
}




#pragma mark touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    beginPoint = [touch locationInView:self.imageviewUpPart];
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //防止tableview未停止时拖动上面的imageview，所以改变滚动状态
    isScrolling = NO;
    
    UITouch *touch = [touches anyObject];
    CGPoint point  = [touch locationInView:self.imageviewUpPart];
    
    
    //为动画加一个最大偏差值
    //&& point.y - beginPoint.y <120 取消最大偏移值
    if (point.y-beginPoint.y > 10 ) {
        [self scaleImageviewByoffsetValue:point.y-beginPoint.y];
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnOnScrollviewScrollable)]) {
        [self.homeMainViewDelegate turnOnScrollviewScrollable];
    }
    
    [UIView animateWithDuration:0.4 animations:^{
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [self scaleImageviewByoffsetValue:0.0f];
    }];

    
}
#pragma mark CustomTableviewCellDelegate




-(void)gotoIMViewControllerFromFriends:(CPUIModelMessageGroup *)messageGroup 
{

    if ([self.homeMainViewDelegate respondsToSelector:@selector(goImController:::)]) {
    
        [self.homeMainViewDelegate goImController:messageGroup :NO :Btn_Back_IM];
    }
}
-(void)deleteRowBymessageGroup:(CPUIModelMessageGroup *)messageGroup
{
    [[AlarmClockHelper sharedInstance] removeAlarmClockObjectWithGroupID:messageGroup.msgGroupID];
    [[CPUIModelManagement sharedInstance] markMsgGroupReadedWithMsgGroup:messageGroup];
    [[CPUIModelManagement sharedInstance] deleteMsgGroup:messageGroup];
    [self recoverDeletingStatus];
    
}
-(void)recoverDeletingStatus
{
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
