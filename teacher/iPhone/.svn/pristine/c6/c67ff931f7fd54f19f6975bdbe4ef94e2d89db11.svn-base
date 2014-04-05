//
//  AudioPlayerManager.h
//  iCouple
//
//  Created by shuo wang on 12-5-22.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAudioEngine.h"

@protocol AudioPlayerDelegate <NSObject>

-(void) audioPlayerDidFinishPlaying;

@end

@interface AudioPlayerManager : NSObject

@property (nonatomic,strong) id<AudioPlayerDelegate> delegate;

+(AudioPlayerManager *) sharedManager;

-(void) preloadBackgroundMusic:(NSString*) filePath;

-(void) playBackgroundMusic:(NSString*) filePath;

-(void) playBackgroundMusic:(NSString*) filePath loop:(BOOL) loop;

-(void) stopBackgroundMusic;

-(void) pauseBackgroundMusic;

-(void) resumeBackgroundMusic;

-(void) rewindBackgroundMusic;

-(BOOL) isBackgroundMusicPlaying;

-(void) playEffect : (NSString *)effectPath;

-(void) stopEffect;

+(void) end;
@end
