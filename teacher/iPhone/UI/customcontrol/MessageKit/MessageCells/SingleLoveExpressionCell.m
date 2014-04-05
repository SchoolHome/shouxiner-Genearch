//
//  SingleLoveExpressionCell.m
//  iCouple
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleLoveExpressionCell.h"

@interface SingleLoveExpressionCell ()
// 灰层
@property (nonatomic,strong) UIImageView *greyView;
// 风火轮
@property (nonatomic,strong) UIActivityIndicatorView *activityView;
// 点击下载label
@property (nonatomic,strong) UILabel *clickDownloadLabel;
@end

@implementation SingleLoveExpressionCell
@synthesize greyView = _greyView;
@synthesize activityView = _activityView;
@synthesize clickDownloadLabel = _clickDownloadLabel;




- (void)playButtonTaped:(UIButton*)sender{
    //播放魔法表情

    if ([self.delegate respondsToSelector:@selector(loveExpressionCellTaped:)]) {
        [self.delegate loveExpressionCellTaped:self];
    }
}

-(void)backgroundTaped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(loveExpressionCellTaped:)]) {
        [self.delegate loveExpressionCellTaped:self];
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
        
        
        receiverDescLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        receiverDescLabel.textAlignment = UITextAlignmentCenter;
        receiverDescLabel.font = [UIFont systemFontOfSize:10];
        receiverDescLabel.numberOfLines = 0;
        receiverDescLabel.backgroundColor = [UIColor clearColor];
        
        
//        self.greyView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        [self.greyView exchangeSubviewAtIndex:25 withSubviewAtIndex:25];
//        self.greyView.userInteractionEnabled = NO;
//        self.greyView.exclusiveTouch = YES;
//        self.greyView.backgroundColor = [UIColor clearColor];
//        self.greyView.hidden = YES;
//        UIImage *image = [UIImage imageNamed:@"item_waitmagic.png"];
//        self.greyView.image = image;
//        
//        self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//        [self.activityView startAnimating];
//        self.activityView.hidden = YES;
//        
//        self.clickDownloadLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        self.clickDownloadLabel.backgroundColor = [UIColor clearColor];
//        self.clickDownloadLabel.font = [UIFont systemFontOfSize:12.0f];
////        self.clickDownloadLabel.textColor = [UIColor colorWithHexString:@"#999999"];
//        self.clickDownloadLabel.textColor = [UIColor blackColor];
//        self.clickDownloadLabel.text = @"点击下载";
//        [self.clickDownloadLabel sizeToFit];
//        self.clickDownloadLabel.hidden = YES;
    }
    return self;
}

- (void)refreshCell{
    [super refreshCell];
    
    ExMessageModel *model = (ExMessageModel*)self.data;
    

    
    
    [self addSubview:displayImageView];
    [self addSubview:playButton];
    [self addSubview:playTimeLabel];
    
    CPUIModelPetFeelingAnim *anim = [[CPUIModelManagement sharedInstance] feelingObjectOfID:model.messageModel.magicMsgID fromPet:model.messageModel.petMsgID];
    
    UIImage *image;
    if ([anim isAvailable]) {
        NSData *data = [NSData dataWithContentsOfFile:anim.thumbNail];
        image = [[UIImage alloc] initWithData:data];
    }else {
        
        NSData *data = [NSData dataWithContentsOfFile:anim.thumbNail];
        image = [[UIImage alloc] initWithData:data];
        
        if (!image) {
            image = [UIImage imageNamed:@"xiazai_QP@2x.gif"];
        }
        
    }
    

    
    displayImageView.image = image;//[UIImage imageNamed:@"emotion_magic_01@2x.png"];
    
    
    [playButton setImage:[UIImage imageNamed:@"btn_im_chuanqing_white"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"btn_im_chuanqing_grey"] forState:UIControlStateHighlighted];
    

    playTimeLabel.text = [NSString stringWithFormat:@"%ds",[model.messageModel.mediaTime intValue]];
    
    /*
     MSG_FLAG_SEND = 1,//发送方
     MSG_FLAG_RECEIVE = 2,//接收方
     */
    
    [self adaptEllipticalBackgroundImage];
    
    receiverDescLabel.text = nil;
    
    switch ([model.messageModel.flag intValue]) {
        case MSG_FLAG_SEND:
        {

            CGFloat w = displayImageView.image.size.width/2 + kLeftAndRightPadding+ kLeftAndRightPadding+33.5;
            
            self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, 143);  //固定高度
            
            CPLogInfo(@"displayImageView.image.size.width == %f",displayImageView.image.size.width);
            
            displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, self.ellipticalBackground.frame.origin.y + ellipticalBackground.frame.size.height - kTopAndButtomPadding - displayImageView.image.size.height/2, displayImageView.image.size.width/2, displayImageView.image.size.height/2);
            
            playButton.frame = CGRectMake((self.ellipticalBackground.frame.origin.x + self.ellipticalBackground.frame.size.width - kLeftAndRightPadding - 34.5), self.ellipticalBackground.frame.origin.y+kTopAndButtomPadding, 33.5, 34.5);
            playTimeLabel.frame = CGRectMake(playButton.frame.origin.x, playButton.frame.origin.y + 24.5, 33.5, 34);
            
            
            timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding+2, 50, kTimestampLabelHeight);
            timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
            
            receiverDescLabel.text = nil;
            receiverDescLabel.hidden = YES;  //避免cell重用引发原来的数据残留
            
        }
            break;
        case MSG_FLAG_RECEIVE: //如果是接收方，添加文字描述
        {

            [self addSubview:receiverDescLabel];
            
            CGFloat w = displayImageView.image.size.width/2 + kLeftAndRightPadding+ kLeftAndRightPadding+33.5;
            
            receiverDescLabel.frame = CGRectMake(0, 0, w -2*kLeftAndRightPadding, 0);  // 保证原始高度是0
            
            if(anim.receiverDesc!=nil){
                receiverDescLabel.text = anim.receiverDesc;
                [receiverDescLabel sizeToFit];
            }
            
            
            
            
            self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, 143 + receiverDescLabel.frame.size.height+5);  //固定高度 +文字高度
            
            CPLogInfo(@"displayImageView.image.size.width == %f",displayImageView.image.size.width);
            
            receiverDescLabel.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, kCellTopPadding+kTopAndButtomPadding, receiverDescLabel.frame.size.width, receiverDescLabel.frame.size.height);
            
            
            displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, self.ellipticalBackground.frame.origin.y + ellipticalBackground.frame.size.height - kTopAndButtomPadding - displayImageView.image.size.height/2, displayImageView.image.size.width/2, displayImageView.image.size.height/2);
            
            playButton.frame = CGRectMake((self.ellipticalBackground.frame.origin.x + self.ellipticalBackground.frame.size.width - kLeftAndRightPadding - 34.5), self.ellipticalBackground.frame.origin.y+kTopAndButtomPadding+receiverDescLabel.frame.size.height+5, 33.5, 34.5);
            playTimeLabel.frame = CGRectMake(playButton.frame.origin.x, playButton.frame.origin.y + 24.5, 33.5, 34);
            
            
            timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
            timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
            
            receiverDescLabel.hidden = NO;
            
        }
            break;
        default:
            break;
    }
    
    self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f, 
                                         ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                         kResendButtonWidth, kResendButtonWidth);

    // 添加本地未存在动画时的状态
    
    if (self.greyView) {
        [self.greyView removeFromSuperview];
    }
    self.greyView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.greyView exchangeSubviewAtIndex:25 withSubviewAtIndex:25];
    self.greyView.userInteractionEnabled = NO;
    self.greyView.exclusiveTouch = YES;
    self.greyView.backgroundColor = [UIColor clearColor];
    self.greyView.hidden = YES;
    UIImage *imagelayer = [UIImage imageNamed:@"item_waitmagic.png"];
    self.greyView.image = imagelayer;
    
    if (self.activityView) {
        [self.activityView removeFromSuperview];
    }
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.activityView startAnimating];
    self.activityView.hidden = YES;
    
    if (self.clickDownloadLabel) {
        [self.clickDownloadLabel removeFromSuperview];
    }
    self.clickDownloadLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.clickDownloadLabel.backgroundColor = [UIColor clearColor];
    self.clickDownloadLabel.font = [UIFont systemFontOfSize:12.0f];
    //        self.clickDownloadLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.clickDownloadLabel.textColor = [UIColor blackColor];
    self.clickDownloadLabel.text = @"点击下载";
    [self.clickDownloadLabel sizeToFit];
    self.clickDownloadLabel.hidden = YES;
//    // 添加本地未存在动画时的状态
//    self.greyView.hidden = YES;
//    self.activityView.hidden = YES;
//    self.clickDownloadLabel.hidden = YES;
    
    switch (model.animationsState) {
        case AnimationInvalidate:{
                // 验证动画失败，需要下载时
                self.greyView.frame = ellipticalBackground.frame;
                self.clickDownloadLabel.frame = CGRectMake(self.greyView.frame.size.width - self.clickDownloadLabel.frame.size.width - 8.0f,
                                                           self.greyView.frame.size.height - self.clickDownloadLabel.frame.size.height - 6.0f, 
                                                           self.clickDownloadLabel.frame.size.width,
                                                           self.clickDownloadLabel.frame.size.height);
                [self.greyView addSubview:self.clickDownloadLabel];
                [self addSubview:self.greyView];
                if (nil != self.avatar ){
                    [self bringSubviewToFront:self.avatar];
                }
                self.greyView.hidden = NO;
                self.clickDownloadLabel.hidden = NO;
            }
            break;
        case AnimationDownloading:{
                // 正在下载动画时
                self.greyView.frame = ellipticalBackground.frame;
                self.activityView.frame = CGRectMake((self.greyView.frame.size.width - 16.0f) / 2.0f , 
                                                     (self.greyView.frame.size.height - 16.0f) / 2.0f , 
                                                     16.0f, 16.0f);
                [self.greyView addSubview:self.activityView];
                [self addSubview:self.greyView];
                if (nil != self.avatar ){
                    [self bringSubviewToFront:self.avatar];
                }
                self.greyView.hidden = NO;
                self.activityView.hidden = NO;
            }
            break;
        case AnimationDownloadingError:{
                // 动画下载出错时
                self.greyView.frame = ellipticalBackground.frame;
                [self addSubview:self.greyView];
                if (nil != self.avatar ){
                    [self bringSubviewToFront:self.avatar];
                }
                self.greyView.hidden = NO;
                self.activityView.hidden = YES;
                self.clickDownloadLabel.hidden = YES;
            }
            break;
        case AnimationSucceed:{
                self.greyView.hidden = YES;
                self.activityView.hidden = YES;
                self.clickDownloadLabel.hidden = YES;
            }
            break;
        default:
            break;
    }
}

-(void)layoutBaseControls{
    [super layoutBaseControls];
    
    //高度固定 286/2 = 143
    
    //self.ellipticalBackground.frame = kMagicBackgroundRect;
    
}

@end
