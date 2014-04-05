//
//  MusicPlayerManager.h
//  AudioPlayer_dev
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol MusicPlayerManagerDelegate;
@interface MusicPlayerManager : NSObject <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
    NSTimer       *timer;
    
    NSString      *playerName;
}
@property (nonatomic,assign) id<MusicPlayerManagerDelegate> delegate;
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;
@property (nonatomic,strong) NSString      *playerName;

+(MusicPlayerManager *)sharedInstance;

// 播放短音
- (void)playSound:(NSString *)filePath;

// 播放长音
- (void)playMusic:(NSString *)filePath playerName:(NSString *)name;
- (BOOL)prepareToPlay;
- (BOOL)play;	
- (BOOL)playAtTime:(NSTimeInterval)time;
- (void)pause;	
- (void)stop;

- (BOOL)isPlaying;

-(NSTimeInterval )currentTime;

-(CGFloat)musicLength:(NSString *)path; //获取声音长度

@end

// 所有delegage 只对长音有效
@protocol MusicPlayerManagerDelegate <NSObject>

-(void)musicPlayer:(MusicPlayerManager *) player playToTime:(NSTimeInterval) time playerName:(NSString *)name;
-(void)musicPlayerDidFinishPlaying:(MusicPlayerManager *) player playerName:(NSString *)name;
-(void)musicPlayerDecodeErrorDidOccur:(MusicPlayerManager *) player error:(NSError *)error playerName:(NSString *)name;

@end