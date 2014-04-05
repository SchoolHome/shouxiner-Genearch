//
//  SingleAskExpressionCell.m
//  iCouple
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleAskExpressionCell.h"

@implementation SingleAskExpressionCell

- (void)playButtonTaped:(UIButton*)sender{


    if ([self.delegate respondsToSelector:@selector(askExpressionCellTaped:)]) {
        [self.delegate askExpressionCellTaped:self];
    }
}


-(void)backgroundTaped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(askExpressionCellTaped:)]) {
        [self.delegate askExpressionCellTaped:self];
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
        playTimeLabel.text = @"1s";
        
        receiverDescLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        receiverDescLabel.textAlignment = UITextAlignmentCenter;
        receiverDescLabel.font = [UIFont systemFontOfSize:10];
        receiverDescLabel.numberOfLines = 0;
        receiverDescLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)refreshCell{
    [super refreshCell];
    
    ExMessageModel *model = (ExMessageModel*)self.data;
    
    [self addSubview:displayImageView];
    [self addSubview:playButton];
    [self addSubview:playTimeLabel];
    [self addSubview:receiverDescLabel];
    
    displayImageView.image = [UIImage imageNamed:@"toutouwen_QP@2x.gif"];
    playTimeLabel.text = [NSString stringWithFormat:@"%ds",[model.messageModel.mediaTime intValue]];
    /*
     MSG_FLAG_SEND = 1,//发送方
     MSG_FLAG_RECEIVE = 2,//接收方
     */
    switch ([model.messageModel.contentType intValue]) {
        case MSG_CONTENT_TYPE_TTW:
        {
            [playButton setImage:[UIImage imageNamed:@"btn_pet_sendask"] forState:UIControlStateNormal];
            [playButton setImage:[UIImage imageNamed:@"btn_pet_sendaskpress"] forState:UIControlStateHighlighted];
        }
            break;
        case MSG_CONTENT_TYPE_TTD:
        {
            [playButton setImage:[UIImage imageNamed:@"btn_pet_sendanswer"] forState:UIControlStateNormal];
            [playButton setImage:[UIImage imageNamed:@"btn_pet_sendanswerpress"] forState:UIControlStateHighlighted];
        }
            break;
        default:
            break;
    }
    
    
    [self adaptEllipticalBackgroundImage];
    
    //CGFloat w = displayImageView.image.size.width/2 + kLeftAndRightPadding+ kLeftAndRightPadding+33.5;
    CGFloat w = displayImageView.image.size.width/2 + kLeftAndRightPadding+ kLeftAndRightPadding+33.5;

    receiverDescLabel.text = nil;
    receiverDescLabel.frame = CGRectMake(0, 0, w -2*kLeftAndRightPadding, 0); // 保证原始高度是0
    
    NSString *desc;
    switch ([model.messageModel.contentType intValue]) {
        case MSG_CONTENT_TYPE_TTD:{

            if (MSG_FLAG_SEND == [model.messageModel.flag intValue]) {
                desc = @"小双已经捎去你的回答啦";
                
            }else if (MSG_FLAG_RECEIVE == [model.messageModel.flag intValue]){
                desc = @"小双喊你快来收偷偷问的答案";
            }
        }
            break;
        case MSG_CONTENT_TYPE_TTW:{

            if (MSG_FLAG_SEND == [model.messageModel.flag intValue]) {
                desc = @"小双已经匿名去偷偷打听啦";
            }else if (MSG_FLAG_RECEIVE == [model.messageModel.flag intValue]){
                desc = @"有好友托小双偷偷提问哦";
            }

        }
            break;

        default:
            break;
    }
    
    
    if (self.isBelongMe) {
        receiverDescLabel.textColor = [UIColor whiteColor];
    }else {
        receiverDescLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    
    receiverDescLabel.text = desc;

    [receiverDescLabel sizeToFit];
    
    
    self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, 143+ receiverDescLabel.frame.size.height+5);  //固定高度
    
    receiverDescLabel.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, kCellTopPadding+kTopAndButtomPadding, receiverDescLabel.frame.size.width, receiverDescLabel.frame.size.height);
    
    
    displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, self.ellipticalBackground.frame.origin.y + ellipticalBackground.frame.size.height - kTopAndButtomPadding - displayImageView.image.size.height/2, displayImageView.image.size.width/2, displayImageView.image.size.height/2);
    
    playButton.frame = CGRectMake((self.ellipticalBackground.frame.origin.x + self.ellipticalBackground.frame.size.width - kLeftAndRightPadding - 34.5), self.ellipticalBackground.frame.origin.y+kTopAndButtomPadding+receiverDescLabel.frame.size.height+5, 33.5, 34.5);
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
