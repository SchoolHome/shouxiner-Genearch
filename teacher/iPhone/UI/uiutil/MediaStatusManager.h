//
//  MediaStatusManager.h
//  iCouple
//
//  Created by ming bright on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

/*
 * 多媒体状态管理，主要避免一些情况下，同时播放消息提示音
 */

#import <Foundation/Foundation.h>

@interface MediaStatusManager : NSObject
{
    // 正在录像
    BOOL isVideoRecording;
    // 正在播放视频
    BOOL isVideoPlaying;
    // 正在录音
    BOOL isAudioRecording;
    // 正在播放音乐
    BOOL isAudioPlaying;
}

@property(assign) BOOL isVideoRecording;
@property(assign) BOOL isVideoPlaying;
@property(assign) BOOL isAudioRecording;
@property(assign) BOOL isAudioPlaying;

+(MediaStatusManager *)sharedInstance;
-(void)resetStatus;
-(BOOL)canPlaySound;

@end
