//
//  SingleSoundCell.h
//  iCouple
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleChatInforCellBase.h"



@interface SingleSoundCell : SingleChatInforCellBase

{
    
    UIButton    *playButton;
    UIImageView *stateImageView;
    UILabel     *playTimeLabel;
    
    BOOL isPlaying;
}

-(void)updatePlayTime:(float)second;

-(void)playCompleted;

-(void)refreshPlayStatus:(BOOL) isPlaying_;

@end
