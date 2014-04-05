//
//  AlarmObject.h
//  iCouple
//
//  Created by wang shuo on 12-8-14.
//
//

#import <Foundation/Foundation.h>

typedef enum{
    // 闹钟创建
    Create,
    // 闹钟已开始
    Begin,
    // 闹钟已结束
    Finish
}AlarmClockState;

typedef enum{
    // 文本消息闹钟
    TextAlarmClock,
    // 语音消息闹钟
    SoundAlarmClock,
    // 语音神秘闹钟
    MysticalSoundAlarm
}AlarmType;

@interface AlarmObject : NSObject

// key
@property(nonatomic,strong) NSString *msgID;
// 闹钟响的时间
@property(nonatomic,strong) NSDate *alarmTime;
// 闹钟的状态
@property(nonatomic,strong) NSNumber *state;
// groupID
@property(nonatomic,strong) NSNumber *groupID;
// 用户昵称
@property(nonatomic,strong) NSString *userNickName;
// 闹钟类型
@property(nonatomic,strong) NSNumber *alarmClockType;
// 消息体
@property(nonatomic,strong) NSString *msgText;


@end
