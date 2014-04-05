//
//  ChatInforCellDelegate.h
//  iCouple
//
//  Created by yong wei on 12-5-1.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ChatInforCellBase;

/*
 各个Cell根据功能不同，添加delegate方法
 */
@protocol ChatInforCellDelegate <NSObject>

@optional
// 消息发送失败后,用户点击叹号重新发送消息的通知，ChatInforCellBase 类型
-(void) resendFailedMessage : (ChatInforCellBase *) sender;
// 下载出错时，通知外部从新下载
-(void) reDownLoadFailedMessage : (id) sender;
// 需要reload的通知
-(void) needReloadData;

///////////////////////////////////////////////////

// 小表情被点击
-(void)smallExpressionCellTaped:(id)sender;

// 播放魔法表情
-(void)magicExpressionCellTaped:(id)sender;
// 展示大图
-(void)imageCellTaped:(id)sender;
// 播放声音
-(void)soundCellTaped:(id)sender;
//播放视频
-(void)videoCellTaped:(id)sender;
//系统消息跳转
-(void)systemTextActionCellTaped:(id)sender;

//播放传情
-(void)loveExpressionCellTaped:(id)sender;

//播放传声
-(void)soundExpressionCellTaped:(id)sender;

//播放偷偷问
-(void)askExpressionCellTaped:(id)sender;

//播放双双闹钟
-(void)alarmExpressionCellTaped:(id)sender;
///////////////////////////////////////////////////
// 点击群头像
-(void) clickedAvatar : (id) userID;
// 点击闹钟提醒
-(void) clickedAlarmTip : (id)sender;
// 点击语音闹钟提醒
-(void) clickedSoundAlarmTip : (id)sender;
// 下载视频
-(void) downloadVideo : (id) sender;
@end


@protocol ChatInforInterface <NSObject>
/*
 必须实现的方法,各个Cell的子类按照需要override此方法
 */
@required
// 计算cell的高度
-(float) CalculateCellHeight;

@end