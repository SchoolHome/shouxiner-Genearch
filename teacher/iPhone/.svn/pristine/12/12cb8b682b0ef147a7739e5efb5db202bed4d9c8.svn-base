//
//  SingleVideoCell.m
//  iCouple
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleVideoCell.h"
#import "ColorUtil.h"

#define BottomPanelHeight 16.0f
#define MarginBottomLeft 5.0f
#define MarginBottomTop 2.0f
#define LoadViewHeight 16.0f

@interface SingleVideoCell ()
-(NSString *) getFormatTime : (int) second;
-(void) addDownLoadButton;
-(void) addPlayButton;
-(void) downloadVideo;
-(void) playVideo;
-(void) addLoadView;
@end

@implementation SingleVideoCell

@synthesize displayImageView;
@synthesize bottomPanelView = _bottomPanelView , videoSizeLabel = _videoSizeLabel , videoTimeLabel = _videoTimelabel;
@synthesize downloadButton = _downloadButton , playButton = _playButton;
@synthesize textFont = _textFont;
@synthesize loadView = _loadView;



-(void) playVideo{
    ExMessageModel *model = (ExMessageModel *)self.data;
    
    if ([model.messageModel.flag intValue] == MSG_FLAG_RECEIVE) {
        CPLogInfo(@"%d",[model.messageModel.sendState intValue]);
        switch ([model.messageModel.sendState intValue]) {
            case MSG_SEND_STATE_DEFAULT:{
                if (nil == self.delegate || ![self.delegate respondsToSelector:@selector(downloadVideo:)]) {
                    return;
                }
                [self.delegate downloadVideo:self];
            }
                break;
            case MSG_SEND_STATE_DOWN_SUCESS:{
                if ([self.delegate respondsToSelector:@selector(imageCellTaped:)]) {
                    [self.delegate videoCellTaped:self];
                }
            }
                break;
            case MSG_SEND_STATE_DOWN_ERROR:{
                // 如果是下载失败
                if (nil == self.delegate || ![self.delegate respondsToSelector:@selector(downloadVideo:)]) {
                    return;
                }
                [self.delegate downloadVideo:self];
            }
                break;
            default:
                break;
        }
    }else if ([model.messageModel.flag intValue] == MSG_FLAG_SEND) {
        if ([self.delegate respondsToSelector:@selector(imageCellTaped:)]) {
            [self.delegate videoCellTaped:self];
        }
    }
}

-(void)backgroundTaped:(id)sender{
    [self playVideo];
}



- (id)initWithType : (MessageCellType) messageCellType  withBelongMe : (BOOL) isBelongMe withKey:(NSString *)key{
    self = [super initWithType:messageCellType withBelongMe:isBelongMe withKey:key];
    if (self) {
        displayImageView = [[UIImageView alloc] initWithFrame:CGRectZero];

        ellipticalBackground.exclusiveTouch = YES;
        [ellipticalBackground addTarget:self action:@selector(backgroundTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.bottomPanelView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.videoSizeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.videoTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.downloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.playButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.textFont = [UIFont systemFontOfSize:10.0f];
    }
    return self;
}


-(CGFloat)cellHeight{
    return 374.0f;
}

- (void)refreshCell{
    [super refreshCell];
    
    ExMessageModel *model = (ExMessageModel *)self.data;
    
    displayImageView.image = [model getUserVideoImage];//[UIImage imageNamed:@"add_couple_img.jpg"];
    [displayImageView removeFromSuperview];
    if (displayImageView.image.size.height>=displayImageView.image.size.width) {
        displayImageView.frame = CGRectMake((320 - kMaxImageWidth)/2, kTopAndButtomPadding+kCellTopPadding, kMaxImageWidth, kMaxImageHeight);
    }else {
        displayImageView.frame = CGRectMake((320 - kMaxImageHeight)/2, kTopAndButtomPadding+kCellTopPadding, kMaxImageHeight, kMaxImageWidth);
    }
    [self addSubview:displayImageView];
    
    CGRect imageRect = displayImageView.frame;
    ellipticalBackground.frame = CGRectMake((320 -(imageRect.size.width+2*kLeftAndRightPadding))/2, kCellTopPadding, imageRect.size.width+2*kLeftAndRightPadding, imageRect.size.height+2*kTopAndButtomPadding);
    
    [self adaptEllipticalBackgroundImage];
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
    self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f, 
                                         ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                         kResendButtonWidth, kResendButtonWidth);
    
    
    
    self.bottomPanelView.frame = CGRectMake(self.displayImageView.frame.origin.x,
                                            self.displayImageView.frame.origin.y + self.displayImageView.frame.size.height - BottomPanelHeight,
                                            self.displayImageView.frame.size.width,
                                            BottomPanelHeight);
    self.bottomPanelView.backgroundColor = [UIColor blackColor];
    self.bottomPanelView.alpha = 0.3f;
    [self addSubview:self.bottomPanelView];
    
    self.videoSizeLabel.text = [NSString stringWithFormat:@"%dK",[model.messageModel.fileSize intValue]];
    self.videoSizeLabel.font = self.textFont;
    self.videoSizeLabel.textColor = [UIColor colorWithHexString:@"#cccccc"];
    self.videoSizeLabel.backgroundColor = [UIColor clearColor];
    [self.videoSizeLabel sizeToFit];
    self.videoSizeLabel.frame = CGRectMake(self.bottomPanelView.frame.origin.x + MarginBottomLeft, 
                                           self.bottomPanelView.frame.origin.y + MarginBottomTop,
                                           self.videoSizeLabel.frame.size.width,
                                           self.videoSizeLabel.frame.size.height);
    [self addSubview:self.videoSizeLabel];
    
    self.videoTimeLabel.text = [self getFormatTime:[model.messageModel.mediaTime intValue]];
    self.videoTimeLabel.font = self.textFont;
    self.videoTimeLabel.textColor = [UIColor colorWithHexString:@"#cccccc"];
    self.videoTimeLabel.backgroundColor = [UIColor clearColor];
    [self.videoTimeLabel sizeToFit];
    self.videoTimeLabel.frame = CGRectMake(self.displayImageView.frame.origin.x + self.displayImageView.frame.size.width - self.videoTimeLabel.frame.size.width - MarginBottomLeft,
                                           self.bottomPanelView.frame.origin.y + MarginBottomTop,
                                           self.videoTimeLabel.frame.size.width,
                                           self.videoTimeLabel.frame.size.height);
    [self addSubview:self.videoTimeLabel];
    
    /*
     MSG_SEND_STATE_DEFAULT = 0,//
     MSG_SEND_STATE_SENDING = 1,//发送中
     MSG_SEND_STATE_SEND_SUCESS = 2,//发送成功
     MSG_SEND_STATE_SEND_ERROR = 3,//发送失败
     MSG_SEND_STATE_DOWNING = 4,//下载中
     MSG_SEND_STATE_DOWN_SUCESS = 5,//下载成功
     MSG_SEND_STATE_DOWN_ERROR = 6,//下载失败
     */
    
    if ([model.messageModel.flag intValue] == MSG_FLAG_SEND) {
        // 如果是发送方，则可以直接播放
        [self addPlayButton];
    }else {
        CPLogInfo(@"%d",[model.messageModel.sendState intValue]);
        switch ([model.messageModel.sendState intValue]) {
            case MSG_SEND_STATE_DEFAULT:{
                // 如果是未下载时，添加下载按钮
                [self addDownLoadButton];
            }
                break;
            case MSG_SEND_STATE_DOWNING:{
                // 如果是下载中时，添加下载按钮
                [self addLoadView];
            }
                break;
            case MSG_SEND_STATE_DOWN_SUCESS:{
                // 如果是下载成功时，添加播放按钮
                [self addPlayButton];
            }
                break;
            case MSG_SEND_STATE_DOWN_ERROR:{
                // 如果是下载失败
            }
                break;
            default:
                break;
        }
    }
}


-(void) downloadVideo{
    if (nil == self.delegate || ![self.delegate respondsToSelector:@selector(downloadVideo:)]) {
        return;
    }
    [self.delegate downloadVideo:self];
}

-(void) addDownLoadButton{
    [self.downloadButton removeFromSuperview];
    self.downloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
    UIImage *downloadImageButton = [UIImage imageNamed:@"btn_video_talk.png"];
    UIImage *downloadImageButtonPress = [UIImage imageNamed:@"btn_video_talkpress.png"];
    [self.downloadButton setBackgroundImage:downloadImageButton forState:UIControlStateNormal];
    [self.downloadButton setBackgroundImage:downloadImageButtonPress forState:UIControlStateHighlighted];
    
    self.downloadButton.frame = CGRectMake((320.0f - downloadImageButton.size.width) / 2.0f, 
                                           (self.ellipticalBackground.frame.size.height - downloadImageButton.size.height ) / 2.0f, 
                                           downloadImageButton.size.width, downloadImageButton.size.height);
    
    [self.downloadButton addTarget:self action:@selector(downloadVideo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.downloadButton];
}

-(void) addPlayButton{
    
    if ( nil != self.downloadButton) {
        [self.downloadButton removeFromSuperview];
        self.downloadButton = nil;
    }
    
    UIImage *playImageButton = [UIImage imageNamed:@"btn_video_play.png"];
    UIImage *playImageButtonPress = [UIImage imageNamed:@"btn_play_talkpress.png"];
    [self.playButton setBackgroundImage:playImageButton forState:UIControlStateNormal];
    [self.playButton setBackgroundImage:playImageButtonPress forState:UIControlStateHighlighted];
    
    // ellipticalBackground ---- displayImageView
    self.playButton.frame = CGRectMake((320.0f - playImageButton.size.width) / 2.0f, 
                                       (self.ellipticalBackground.frame.size.height - playImageButton.size.height ) / 2.0f, 
                                       playImageButton.size.width, playImageButton.size.height);
    [self.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.playButton];
}

-(void) addLoadView{
    self.loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.loadView.frame = CGRectMake((320.0f - LoadViewHeight) / 2.0f,
                                     (self.displayImageView.frame.size.height - LoadViewHeight ) / 2.0f, 
                                     LoadViewHeight, LoadViewHeight);
    [self.loadView startAnimating];
    [self addSubview:self.loadView];
}

- (void)refreshResendButton{
    //子类实现
    
    /*
     MSG_SEND_STATE_SENDING = 1,//发送中
     MSG_SEND_STATE_SEND_SUCESS = 2,//发送成功
     MSG_SEND_STATE_SEND_ERROR = 3,//发送失败
     
     MSG_SEND_STATE_DOWNING = 4,//下载中
     MSG_SEND_STATE_DOWN_SUCESS = 5,//下载成功
     MSG_SEND_STATE_DOWN_ERROR = 6,//下载失败
     */
    
    ExMessageModel *model = (ExMessageModel*)self.data;
    
    if (nil == resendButton) {
        self.resendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.resendButton addTarget:self action:@selector(resendButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        [resendButton setBackgroundImage:[UIImage imageNamed:@"icon_losemessage_red.png"] forState:UIControlStateNormal];
        [resendButton setBackgroundImage:[UIImage imageNamed:@"icon_losemessage_darkenred.png"] forState:UIControlStateHighlighted];
        resendButton.exclusiveTouch = YES;
    }
    
    resendButton.hidden = NO;
    resendButton.userInteractionEnabled = YES;
    
    switch ([model.messageModel.sendState intValue]) {
        case MSG_SEND_STATE_SENDING:
            resendButton.userInteractionEnabled = NO;
            [self clearResendButton];
            CPLogInfo(@"-------------------------发送中");
            break;
        case MSG_SEND_STATE_SEND_SUCESS:
            resendButton.hidden = YES;
            CPLogInfo(@"-------------------------发送安全");
            break;
        case MSG_SEND_STATE_SEND_ERROR:
            [self resetResendButton];
            resendButton.hidden = NO;
            CPLogInfo(@"-------------------------发送错误");
            break;
        case MSG_SEND_STATE_DOWNING:
            resendButton.hidden = YES;
//            resendButton.userInteractionEnabled = NO;
//            [self clearResendButton];
//            CPLogInfo(@"-------------------------下载中");
            break;
        case MSG_SEND_STATE_DOWN_SUCESS:
            resendButton.hidden = YES;
            CPLogInfo(@"-------------------------下载成功");
            break;
        case MSG_SEND_STATE_DOWN_ERROR:
            [self resetResendButton];
            resendButton.hidden = NO;
            CPLogInfo(@"-------------------------下载失败");
        default:
            resendButton.hidden = YES;
            break;
    }
}

-(NSString *) getFormatTime:(int)second{
    int min = second / 60;
    int sec = second % 60;
    
    NSString *secStr;
    if (sec < 10) {
        secStr = [NSString stringWithFormat:@"0%d",sec];
    }else {
        secStr = [NSString stringWithFormat:@"%d",sec];
    }
    
    return [NSString stringWithFormat:@"%d:%@",min,secStr];
}

@end
