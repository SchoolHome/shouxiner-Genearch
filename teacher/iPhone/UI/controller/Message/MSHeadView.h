//
//  MSHeadView.h
//  iCouple
//
//  Created by qing zhang on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
typedef enum
{
    TouchButtonStatus_Default = 0,
    TouchButtonStatus_Begin = 0,
    TouchButtonStatus_Move = 1,
    TouchButtonStatus_End = 2 ,
    TouchButtonStatus_Cancel = 3
}TouchButtonStatus;
@protocol HeadViewTouchDelegate <NSObject>

-(void)touchedHeadView:(UITouch *)viewTouch withEvent:(UIEvent *)viewEvent withTouchButtonStatus : (TouchButtonStatus )status;

@end
@interface MSHeadView : UIButton
{
    CALayer *backLayer;
    CALayer *cycleLayer;
    CALayer *maskLayer;
    
}

@property(nonatomic,strong) UIImage *backImage;  //头像
@property(nonatomic,strong) UIImage *cycleImage; //圆环
@property(nonatomic,strong) UIImage *maskImage;  //点击后遮罩

@property(nonatomic,assign) CGFloat borderWidth; //圆环阴影宽度
@property(nonatomic,assign) id<HeadViewTouchDelegate> touchDelegate;

- (id)initWithFrame:(CGRect)frame;  // frame包含阴影

@end
