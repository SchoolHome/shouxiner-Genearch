//
//  AudioRecorder.h
//  iCouple
//
//  Created by ming bright on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

/*
 * 添加改变CPUIModelManagement状态  2012.7.13
 */


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


#define RECORDER_PATH_DOCUMENT [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define RECORDER_PATH_PCM      @"recoder_temp.caf"
#define RECORDER_PATH_AMR      @"recoder_temp.amr"
#define RECORDER_PATH_WAV      @"recoder_temp.wav"


@protocol AudioRecorderDelegate;
@interface AudioRecorder : NSObject<AVAudioRecorderDelegate>
{
    AVAudioSession * audioSession;
    AVAudioRecorder *recorder;

    NSString * pcmPath;
    NSString * amrPath;
}

@property (nonatomic,assign) id<AudioRecorderDelegate> delegate;


- (float)currentVolume;

- (void)start;
- (void)stop;

@end


@protocol AudioRecorderDelegate <NSObject>

-(void)audioRecorderDidFinish:(NSString *)pcmPath_;
-(void)audioRecorderErrorDidOccur:(NSError *)error_;

@end