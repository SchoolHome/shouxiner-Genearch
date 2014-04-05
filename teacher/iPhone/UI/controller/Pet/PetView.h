//
//  PetView.h
//  Pet_component_dev
//
//  Created by ming bright on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "PetProgressView.h"
#import "PetActionItem.h"
#import "AnimImageView.h"

#import "HPTopTipView.h"
#import "ARMicView.h"

#import "CPUIModelMessage.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetFeelingAnim.h"
#import "CPUIModelAnimSlideInfo.h"
#import "CPUIModelPetMagicAnim.h"
#import "CPUIModelPetActionAnim.h"
#import "CPUIModelPetConst.h"

#import "MusicPlayerManager.h"
#import "CustomAlertView.h"
#import "HPSwitch.h"
#import "OverlayGuidView.h"

#define H_CONTROL_ORIGIN CGPointMake(20, 70)

//此appid为您所申请,请勿随意修改
#define APPID @"501f887d"
#define ENGINE_URL @"http://dev.voicecloud.cn:1028/index.htm"




/*主菜单弧度*/
#define kAngle0 (-M_PI_2)
#define kAngle1 (-M_PI*60/180.0f)
#define kAngle2 (-M_PI*30/180.0f)
#define kAngle3 (M_PI*5/180.0f)
#define kAngle4 (M_PI*135/180.0f) // alarm
#define kAngle5 (M_PI*175/180.0f)
#define kAngle6 (M_PI*210/180.0f)



#define kRadius 136.5f    //128.5

#define kItemSizeBig    52
#define kItemSizeSmall  43

typedef enum
{
    PetViewTypeCouple,    //couple之间唤出   
    PetViewTypeNoneCouple,//非couple之间唤出
    PetViewTypeGroup      //群聊唤出
    
}PetViewType;


@protocol PetViewDelegate;

@interface PetView : UIView
<
AnimImageViewDelegate,
PetActionItemDelegate,
ARMicViewDelegate,
MusicPlayerManagerDelegate,
CheckMessageDelegate
>
{
    
    PetViewType petViewType;
    
    
    //背后圆环
    PetProgressView *progressView;
    
    UILabel *tipsLabel;
    
    UIButton *goHome;
    
    //主菜单角度数组
    NSArray *mainAngles;  
    //主菜单按钮
    PetActionItem *mainItem[6];
    CAKeyframeAnimation *mainAnimation[6];
    
    //高兴二级菜单按钮
    PetActionItem *happyItem[11];
    CAKeyframeAnimation *happyAnimation[11];
    
    //不高兴二级菜单按钮
    PetActionItem *sadItem[11];
    CAKeyframeAnimation *sadAnimation[11];
    
    //爱情二级菜单按钮
    PetActionItem *loveItem[11];
    CAKeyframeAnimation *loveAnimation[11];
    
    //子菜单是否显示
    BOOL isSubItemShow;
    
    //
    NSTimer *voiceRecordTimer;
    
    // 
    NSArray *sads;
    NSArray *happys;
    NSArray *loves;
    
    
    NSMutableArray *animZhanli;
    
    AnimImageView *animView;
    
    ARMicView *micView;
    
    UIButton *longPressRecordButton;
    
    UIButton *downloadAllButton;
    
    NSMutableArray *zhanli;
    NSMutableArray *shuohua;
    
    NSMutableArray *ting1;
    NSMutableArray *ting2;
    NSMutableArray *ting3;
    NSMutableArray *ting4;
    
    
    // 当前表情id
    NSString *currentResourceID; 
    //当前消息类型
    
    /*
    MSG_CONTENT_TYPE_CQ = 6,//传情消息
    MSG_CONTENT_TYPE_CS = 7,//传声消息
    MSG_CONTENT_TYPE_TTW = 8,//偷偷问消息
     */
    MsgContentType currentMsgContentType;
    
    BOOL isTimeOut; // 是否到达60s 自动停止
    

    //////
    UIButton *timeButton;
    UIButton *sendButton;
    UIDatePicker *datePicker;
    HPSwitch *switcher;
    UIButton *replayAlermButton;
    
    BOOL isAlarm;   // 是否是录闹钟
    NSString *alarmFilePath;
    CGFloat  alarmFileLength;
    
    
    NSArray *imageArray;
}

@property(nonatomic,assign) id<PetViewDelegate> delegate;
@property(nonatomic,strong) NSString *currentResourceID;
@property(nonatomic,assign) MsgContentType currentMsgContentType;

@property(nonatomic,strong) NSString *alarmFilePath;
@property(nonatomic,assign) CGFloat  alarmFileLength;

-(id)initWithFrame:(CGRect)frame type:(PetViewType) type;
-(void)parseFeelings;
-(void)showInView:(UIView *)aView;
-(void)goHomeTaped:(id)sender;

@end


@protocol PetViewDelegate <NSObject>

-(void)voiceRecordDidBegin;
-(void)voiceRecordDidEnd;
-(void)petActionItemTaped:(id)item;
-(void)petFeelingStartSend:(PetView *)aPetView message: (CPUIModelMessage *)message;
-(void)petViewDidDismiss;

@end
