//
//  HomePageAnimView.h
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kImageName @"image_name"
#define kAnimType  @"anim_type"

typedef enum{
    HP_ANIMI_TYPE_LEFT2RIGHT,     // 左右平移
    HP_ANIMI_TYPE_RIGHT2LEFT,     // 右左平移
    
    HP_ANIMI_TYPE_LEFT2RIGHT_UP,  // 左下右上
    HP_ANIMI_TYPE_LEFT2RIGHT_DOWN,// 左上右下
    
    HP_ANIMI_TYPE_RIGHT2LEFT_UP,  // 右下左上
    HP_ANIMI_TYPE_RIGHT2LEFT_DOWN,// 右上左下
    
    HP_ANIMI_TYPE_UP,             // 向上
    HP_ANIMI_TYPE_DOWN,           // 向下
    
    HP_ANIMI_TYPE_ZOOM_IN,        // 缩小       
    HP_ANIMI_TYPE_ZOOM_OUT        // 放大
    
}HP_ANIMI_TYPE;


@interface HomePageAnimView : UIView
{
    UIImageView *backImageView;
    UIImageView *front;
    
    CABasicAnimation *opacityAnimation;
    CABasicAnimation *opacityAnimation1;
    
    NSMutableArray *images;
    NSTimer *moveTimer;
    
    int random;
    BOOL isRunning;
    
    // 播放历史数据，保证不重复
    NSMutableArray *animRecords;  
}

@property (nonatomic,strong) UIImageView *front;
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,assign) BOOL isRunning;

-(void)run;
-(void)stop;

-(void)hideBackground;
-(void)showBackground;

@end