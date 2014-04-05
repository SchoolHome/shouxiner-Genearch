//
//  MessageSoundPlayer.h
//  iCouple
//
//  Created by shuo wang on 12-5-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayerManager.h"
#import "SingleSoundCell.h"

@interface MessageSoundPlayer : NSObject<AudioPlayerDelegate>

@property (nonatomic,strong) SingleSoundCell *soundCell;

+(MessageSoundPlayer *) sharedInstance;
-(void) playSound : (SingleSoundCell *) cell;
-(void) stopSound;
@end
