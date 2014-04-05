//
//  ExMessageModel.h
//  iCouple
//
//  Created by yong wei on 12-5-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionsParser.h"
#import "CPUIModelMessage.h"
#import "CalculateCellHeight.h"


typedef enum {
    AnimationSucceed,            // 动画可播放
    AnimationInvalidate,         // 动画验证失败
    AnimationDownloading,        // 动画下载中
    AnimationDownloadingError,   // 动画下载失败
    AnimationNone                // 动画默认
}AnimationState;

/*
 封装底层Message Model数据
 */
@interface ExMessageModel : NSObject

// 底层定义Message Model
@property (nonatomic,strong) CPUIModelMessage *messageModel;
// 当前Message Cell高度
@property (nonatomic) float cellHeight;

// ExpressionsParser
@property (nonatomic,strong) ExpressionsParser *expressionsParser;
// 如果是图文混排消息时，保存分割后的消息高度
@property (nonatomic) float departedheight;
// 动画的状态
@property (nonatomic) AnimationState animationsState;
// 是否播放小表情
@property (nonatomic) BOOL isPlayAnimation;
// 显示聊天时间
@property (nonatomic,strong) NSString *headerDate;
// cell scetion 是否显示headerView
@property (nonatomic) BOOL isShowHeaderDate;
// 是否正在播放声音
@property (nonatomic) BOOL isPlaySound;
// 是否显示闹钟提醒
@property(nonatomic) BOOL isShowAlarmTip;
// 是否是单聊消息
@property(nonatomic) BOOL isGroupMessageTable;
// 携带资源文件的闹钟提醒高度
@property(nonatomic) CGFloat alarmHeight;
// 携带的资源文件是否正确
@property(nonatomic) BOOL isResoureBreak;
// 闹钟时间
@property(nonatomic,strong) NSDate *alarmDate;
// 获取model里的图片
-(UIImage *) getUserImage;
-(UIImage *) getUserVideoImage;
-(BOOL) hasUserVideoImage;
@end
