//
//  AlarmClockHelper.h
//  iCouple
//
//  Created by wang shuo on 12-8-14.
//
//

#import <Foundation/Foundation.h>
#import "AlarmObject.h"
#import <UIKit/UILocalNotification.h>

@interface AlarmClockHelper : NSObject

//@property (nonatomic,strong) NSMutableDictionary *alarmClock;

+(AlarmClockHelper *) sharedInstance;

-(AlarmObject *) getAlarm : (NSString *) msgID;

-(BOOL) addAlarmClockObject : (AlarmObject *)object;
-(BOOL) removeAlarmClockObject : (NSString *) msgID;
-(void) removeAlarmClockObjectWithGroupID : (NSNumber *) groupID;
-(void) sendAlarmMessage:(NSString *)msgID;
// 重新加载数据
-(void) reloadData;
// 切换帐号时调用
-(void) changeUser;
// 每次系统启动时，分析闹钟是否已完成,如果完成，则沉淀一条消息
-(void) analysisAlarmed;

// 删除已经过期的闹钟
-(void) analysisAlarmData;

// 用户在应用内不使用本地通知机制，开始程序监听
-(void) beginTimeAlarm;
// 用户在应用外不使用程序监听机制，使用本地通知机制
-(void) endTimeAlarm;
@end
