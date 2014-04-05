//
//  ChatInforCellBase.h
//  iCouple
//
//  Created by wang shuo on 12-4-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ChatInforCellDelegate.h"
#import "ExMessageModel.h"
#import "CPUIModelMessage.h"
#import "CoreUtils.h"

/*
 后续类型自己添加
 */
typedef enum{
    
    /*2人聊天*/
    UISingleMultiMessageSmallExpression,         //小表情，文本
    UISingleMultiMessageMagicExpression,         //魔法表情
    UISingleMultiMessageSound,                   //声音
    UISingleMultiMessageImage,                   //图片
    UISingleMultiMessageVideo,                   //视频
    UISingleMultiMessageSystemText,              //系统纯文字
    UISingleMultiMessageSystemTextAction,        //系统纯文字和动作
    UISingleMultiMessageLoveExpression,          //传情
    UISingleMultiMessageSoundExpression,         //传声
    UISingleMultiMessageAskExpression,           //偷偷问
    UISingleMultiMessageTextAlarmExpression,     //闹钟未提醒
    UISingleMultiMessageTextAlarmedExpression,   //闹钟已提醒
    UISingleMultiMessageSoundAlarmExpression,    //语音闹钟未提醒
    UISingleMultiMessageSoundAlarmedExpression,  //语音闹钟已提醒
    UISingleMultiMessageUnKnown,                 //未知的消息－升级消息
    //////////////////////////////////////////////////
    /*多人聊天*/
    /*
    UIGroupMultiMessageSmallExpression, //小表情，文本
    UIGroupMultiMessageMagicExpression, //魔法表情
    UIGroupMultiMessageSound,           //声音
    UIGroupMultiMessageImage,           //图片
    UIGroupMultiMessageVideo,           //视频
    UIGroupMultiMessageSystemText,      //系统纯文字
    UIGroupMultiMessageSystemTextAction,//系统纯文字和动作
    */
    UIMessageNone
}MessageCellType;


//  ChatInforCellBase基础聊天基类，封装单人聊天及其多人聊天所共有的行为
@interface ChatInforCellBase : UITableViewCell

//cell内容用于刷新数据，强制转化
@property (nonatomic,strong) id data;

// 委托调用
@property (nonatomic,assign) id<ChatInforCellDelegate> delegate;

// 气泡最大宽度 
@property (nonatomic,readonly) float maxBubbleLineWidth;
// 气泡内部顶边距
@property (nonatomic,readonly) float bubbleLineTopPadding;
// 气泡内部底边距
@property (nonatomic,readonly) float bubbleLineBottomPadding;
// 气泡内部左边距
@property (nonatomic,readonly) float bubbleLineLeftPadding;
// 气泡内部右边距
@property (nonatomic,readonly) float bubbleLineRightPadding;


// 气泡是否属于自己
@property (nonatomic) BOOL isBelongMe;
// 气泡属于自己时的图片
@property (nonatomic,readonly) NSString *pictruePathIsBelongMe;
// 气泡不属于自己时的图片 
@property (nonatomic,readonly) NSString *pictruePathNotBelongMe;
// 该cell的类型，enum类型
@property (nonatomic,readonly) MessageCellType messageCellType;
// 群聊时的用户头像
@property (nonatomic,strong) UIImage *userHeadImage;
- (id)initWithType : (MessageCellType) messageCellType  withBelongMe : (BOOL) isBelongMe withKey : (NSString *) key;

//刷新内容
- (void)refreshCell;          //刷新内容
- (void)refreshResendButton;  //刷新重新发送按钮
- (void)refreshAvatar;        //刷新头像

@end
