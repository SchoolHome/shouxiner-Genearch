//
//  AudioRecorder.m
//  iCouple
//
//  Created by ming bright on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AudioRecorder.h"
#import "MediaStatusManager.h"
@implementation AudioRecorder
@synthesize delegate;


-(id)init{
    self = [super init];
    if (self) {
        pcmPath = [[NSString alloc] initWithFormat:@"%@/%@",RECORDER_PATH_DOCUMENT,RECORDER_PATH_PCM];
        amrPath = [[NSString alloc] initWithFormat:@"%@/%@",RECORDER_PATH_DOCUMENT,RECORDER_PATH_AMR];
        
        NSDictionary * recorderSetting = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithFloat: 8000],                 AVSampleRateKey,
                                          [NSNumber numberWithInt: kAudioFormatLinearPCM], AVFormatIDKey,
                                          [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
                                          [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
                                          nil];
        
        NSError * error;
        audioSession = [AVAudioSession sharedInstance];
        if (audioSession.category != AVAudioSessionCategoryPlayAndRecord) {
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil]; // 请不要修改
        }
//        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
        //[audioSession setActive: YES error: nil];  
        NSURL * soundUrl=[[NSURL alloc] initFileURLWithPath:pcmPath]; 
        recorder=[[AVAudioRecorder alloc] initWithURL:soundUrl settings:recorderSetting error:&error];
        recorder.meteringEnabled=YES;
        recorder.delegate=self;
    }
    
    return self;
}

- (void)start{
        
    if (audioSession.category != AVAudioSessionCategoryPlayAndRecord) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil]; // 请不要修改
    }
    
//    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:NULL];
    //[audioSession setActive: YES error: nil]; 
    
    if(audioSession.inputIsAvailable){
        [recorder prepareToRecord];
        [recorder record];
        [MediaStatusManager sharedInstance].isAudioRecording = YES;

    }
    else{
        CPLogError(@"device not support audio record! ");
    }
}

- (void)stop{
    if (recorder.recording) {
        [recorder stop];
        [MediaStatusManager sharedInstance].isAudioRecording = NO;
    }
}

- (float)currentVolume{
    [recorder updateMeters];
    
    const float maxPower = 30.0f; // 通常15~40分贝
    //float avg = -1.0f * [recorder averagePowerForChannel:0];
    float peak = -1.0f * [recorder peakPowerForChannel:0];
    
    //NSLog(@"avg == %f",avg);
    //NSLog(@"peak == %f",avg);
    //(maxPower - avg) / maxPower;
    return maxPower-peak;
}


- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(audioRecorderDidFinish:)]) {
        [self.delegate audioRecorderDidFinish:pcmPath];
    }
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(audioRecorderErrorDidOccur:)]) {
        [self.delegate audioRecorderErrorDidOccur:error];
    }
}

- (void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder{
    
    NSError *error = [[NSError alloc] initWithDomain:@"www.fanxer.com" 
                                                code:-1 
                                            userInfo:[NSDictionary dictionaryWithObject:@"AVAudioRecorder Interrupted" forKey:@"error"]];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(audioRecorderErrorDidOccur:)]) {
        [self.delegate audioRecorderErrorDidOccur:error];
    }
}

@end
