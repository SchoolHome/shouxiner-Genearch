//
//  SingleMagicExpressionCell.m
//  iCouple
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleMagicExpressionCell.h"
#import <QuartzCore/QuartzCore.h>

@interface SingleMagicExpressionCell ()
// 灰层
@property (nonatomic,strong) UIImageView *greyView;
// 风火轮
@property (nonatomic,strong) UIActivityIndicatorView *activityView;
// 点击下载label
@property (nonatomic,strong) UILabel *clickDownloadLabel;
@end

@implementation SingleMagicExpressionCell
@synthesize greyView = _greyView;
@synthesize activityView = _activityView;
@synthesize clickDownloadLabel = _clickDownloadLabel;




- (void)playButtonTaped:(UIButton*)sender{
    //播放魔法表情
    CPLogInfo(@"播放魔法表情！");
    if ([self.delegate respondsToSelector:@selector(magicExpressionCellTaped:)]) {
        [self.delegate magicExpressionCellTaped:self];
    }
}


-(void)backgroundTaped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(magicExpressionCellTaped:)]) {
        [self.delegate magicExpressionCellTaped:self];
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
    //[self addSubview:playTimeLabel];
    
    CPUIModelPetMagicAnim *anim = [[CPUIModelManagement sharedInstance] magicObjectOfID:model.messageModel.magicMsgID fromPet:model.messageModel.petMsgID];
    
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
    playTimeLabel.text = [NSString stringWithFormat:@"%ds",[model.messageModel.mediaTime intValue]];
    playTimeLabel.hidden = YES;
//    playTimeLabel.text = @"5s";

    [playButton setImage:[UIImage imageNamed:@"btn_im_mofabiaoqing_white"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"btn_im_mofabiaoqing_grey"] forState:UIControlStateHighlighted];
    

    [self adaptEllipticalBackgroundImage];
    
    CGFloat w = displayImageView.image.size.width/2 + kLeftAndRightPadding+ kLeftAndRightPadding+33.5;
    
    self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, 143);  //固定高度
    
    CPLogInfo(@"displayImageView.image.size.width == %f",displayImageView.image.size.width);
    
    displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding, self.ellipticalBackground.frame.origin.y + ellipticalBackground.frame.size.height - 8 - displayImageView.image.size.height/2, displayImageView.image.size.width/2, displayImageView.image.size.height/2);
    
    playButton.frame = CGRectMake((self.ellipticalBackground.frame.origin.x + self.ellipticalBackground.frame.size.width - kLeftAndRightPadding - 34.5), self.ellipticalBackground.frame.origin.y+kTopAndButtomPadding, 33.5, 34.5);
    playTimeLabel.frame = CGRectMake(playButton.frame.origin.x, playButton.frame.origin.y + 24.5, 33.5, 34);
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
    self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f, 
                                         ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                         kResendButtonWidth, kResendButtonWidth);
    
    // 添加本地未存在动画时的状态
    
    if (self.greyView) {
        [self.greyView removeFromSuperview];
    }
    UIImageView *greyView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.greyView = greyView1;
    greyView1 = nil;
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
    UIActivityIndicatorView *activityView1 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.activityView = activityView1;
    activityView1 = nil;
    [self.activityView startAnimating];
    self.activityView.hidden = YES;
    
    if (self.clickDownloadLabel) {
        [self.clickDownloadLabel removeFromSuperview];
    }
    UILabel *clickDownloadLabel1 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.clickDownloadLabel = clickDownloadLabel1;
    clickDownloadLabel1 = nil;
    self.clickDownloadLabel.backgroundColor = [UIColor clearColor];
    self.clickDownloadLabel.font = [UIFont systemFontOfSize:12.0f];
    //        self.clickDownloadLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.clickDownloadLabel.textColor = [UIColor blackColor];
    self.clickDownloadLabel.text = @"点击下载";
    [self.clickDownloadLabel sizeToFit];
    self.clickDownloadLabel.hidden = YES;
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

-(CGFloat)cellHeight{
    return 60.0;
}

//-(AnimationState) animationsState{
//    ExMessageModel *exModel = (ExMessageModel *)self.data;
//    // 如果没有取得此魔法表情
//    CPUIModelPetMagicAnim *magic = [[CPUIModelManagement sharedInstance] magicObjectOfID:exModel.messageModel.magicMsgID fromPet:exModel.messageModel.petMsgID];
//    if ( nil == magic) {
//        return AnimationInvalidate;
//    }
//    // 如果此魔法表情验证失败
//    if(magic.isAvailable == NO){
//        return AnimationInvalidate;
//    }
//    
//    /*
//     K_PETRES_DOWNLOD_STATUS_DEFAULT = 0,
//     K_PETRES_DOWNLOD_STATUS_PENDING = 1,
//     K_PETRES_DOWNLOD_STATUS_DOWNLOADING = 2,
//     K_PETRES_DOWNLOD_STATUS_DOWNLOAD_SUCCESS = 3,
//     K_PETRES_DOWNLOD_STATUS_DOWNLOAD_FAILED = 4,
//     */
//    
//    switch ( magic.downloadStatus ) {
//        case K_PETRES_DOWNLOD_STATUS_DOWNLOADING:
//            return AnimationDownloading;
//            break;
////        case K_PETRES_DOWNLOD_STATUS_DOWNLOAD_SUCCESS:
////            return super.animationsState;
////            break;
////        case K_PETRES_DOWNLOD_STATUS_DOWNLOAD_FAILED:
////            return AnimationDownloadingError;
////            break;
//        default:
//            break;
//    }
//    
//    return super.animationsState;
//}

@end
