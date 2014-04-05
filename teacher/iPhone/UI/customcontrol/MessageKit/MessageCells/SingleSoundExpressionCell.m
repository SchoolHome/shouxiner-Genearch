//
//  SingleSoundExpressionCell.m
//  iCouple
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleSoundExpressionCell.h"

@implementation SingleSoundExpressionCell



- (void)playButtonTaped:(UIButton*)sender{

    if ([self.delegate respondsToSelector:@selector(soundExpressionCellTaped:)]) {
        [self.delegate soundExpressionCellTaped:self];
    }
}

-(void)backgroundTaped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(soundExpressionCellTaped:)]) {
        [self.delegate soundExpressionCellTaped:self];
    }
}

- (id)initWithType : (MessageCellType) messageCellType  withBelongMe : (BOOL) isBelongMe withKey:(NSString *)key{
    self = [super initWithType:messageCellType withBelongMe:isBelongMe withKey:key];
    if (self) {
        
        displayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 35, 100, 200)];
        displayImageView.backgroundColor = [UIColor clearColor];
        
        ellipticalBackground.exclusiveTouch = YES;
        [ellipticalBackground addTarget:self action:@selector(backgroundTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        playButton = [[UIButton alloc] initWithFrame: CGRectMake(130, 35, 40, 40)];
        playButton.backgroundColor = [UIColor clearColor];
        [playButton addTarget:self action:@selector(playButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        playButton.exclusiveTouch = YES;
        
        playTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 80, 40, 35)];
        playTimeLabel.backgroundColor = [UIColor clearColor];
        playTimeLabel.textAlignment = UITextAlignmentCenter;
        playTimeLabel.font = [UIFont systemFontOfSize:10];
        playTimeLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        playTimeLabel.text = @"12s";
    }
    return self;
}

- (void)refreshCell{
    [super refreshCell];
    
    ExMessageModel *model = (ExMessageModel*)self.data;
    
    [self addSubview:displayImageView];
    [self addSubview:playButton];
    [self addSubview:playTimeLabel];
    
    
 
     
    displayImageView.image = [UIImage imageNamed:@"chuansheng_QP@2x.gif"];
    playTimeLabel.text = [NSString stringWithFormat:@"%ds",[model.messageModel.mediaTime intValue]];
    [playButton setImage:[UIImage imageNamed:@"btn_im_chuansheng_white"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"btn_im_chuansheng_grey"] forState:UIControlStateHighlighted];
    
    
    
    [self adaptEllipticalBackgroundImage];
    
    CGFloat w = displayImageView.image.size.width/2 + kLeftAndRightPadding+ kLeftAndRightPadding+33.5;
    
    self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, 143);  //固定高度
    
    CPLogInfo(@"displayImageView.image.size.width == %f",displayImageView.image.size.width);
    
    displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, self.ellipticalBackground.frame.origin.y + ellipticalBackground.frame.size.height - 8 - displayImageView.image.size.height/2, displayImageView.image.size.width/2, displayImageView.image.size.height/2);
    
    playButton.frame = CGRectMake((self.ellipticalBackground.frame.origin.x + self.ellipticalBackground.frame.size.width - kLeftAndRightPadding - 34.5), self.ellipticalBackground.frame.origin.y+kTopAndButtomPadding, 33.5, 34.5);
    playTimeLabel.frame = CGRectMake(playButton.frame.origin.x, playButton.frame.origin.y + 24.5, 33.5, 34);
    
    self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f, 
                                         ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                         kResendButtonWidth, kResendButtonWidth);
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
}

-(void)layoutBaseControls{
    [super layoutBaseControls];
    
    //高度固定 286/2 = 143
    
    //self.ellipticalBackground.frame = kMagicBackgroundRect;
    
}
@end
