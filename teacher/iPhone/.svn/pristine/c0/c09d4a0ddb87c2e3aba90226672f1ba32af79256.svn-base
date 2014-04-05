//
//  SingleSoundAlarmedCell.m
//  iCouple
//
//  Created by wang shuo on 12-8-23.
//
//

#import "SingleSoundAlarmedCell.h"

@implementation SingleSoundAlarmedCell
@synthesize displayImageView = _displayImageView , playButton = _playButton ,  dateLabel = _dateLabel , finshImage = _finshImage;
//@synthesize alarmImage = _alarmImage;

- (void)playButtonTaped:(UIButton*)sender{
    ExMessageModel *model = (ExMessageModel*)self.data;
    if (model.isResoureBreak) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(alarmExpressionCellTaped:)]) {
        [self.delegate alarmExpressionCellTaped:self];
    }
}

-(void)backgroundTaped:(id)sender{
    ExMessageModel *model = (ExMessageModel*)self.data;
    if (model.isResoureBreak) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(alarmExpressionCellTaped:)]) {
        [self.delegate alarmExpressionCellTaped:self];
    }
}

- (void)createAvatar{
    [super createAvatarControl];
}


- (id)initWithType : (MessageCellType) messageCellType  withBelongMe : (BOOL) isBelongMe withKey:(NSString *)key{
    self = [super initWithType:messageCellType withBelongMe:isBelongMe withKey:key];
    if (self) {
        
        self.displayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 35, 77, 123)];
        self.displayImageView.backgroundColor = [UIColor clearColor];
        
        ellipticalBackground.exclusiveTouch = YES;
        [ellipticalBackground addTarget:self action:@selector(backgroundTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.playButton = [[UIButton alloc] initWithFrame: CGRectMake(130, 35, 50, 45)];
        self.playButton.backgroundColor = [UIColor clearColor];
        [self.playButton addTarget:self action:@selector(playButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        self.playButton.exclusiveTouch = YES;
    }
    return self;
}

- (void)refreshCell{
    [super refreshCell];
    
    ExMessageModel *model = (ExMessageModel*)self.data;
    
    
    
    [self addSubview:self.displayImageView];
    [self addSubview:self.playButton];
    
    // 添加闹钟图片
//    if (nil == self.alarmImage) {
//        self.alarmImage = [[UIImageView alloc] init];
//    }
//    [self.alarmImage setImage:[UIImage imageNamed:@"alarm_im_icon_gray.png"]];
//    self.alarmImage.frame = CGRectMake(0.0f, 0.0f, 12.0f, 12.0f);
//    [self addSubview:self.alarmImage];
        
    // 添加闹钟时间
    if ( nil == self.dateLabel ) {
        self.dateLabel = [[UILabel alloc] init];
    }
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
        
    NSDate *date = [CoreUtils getDateFormatWithLong:model.messageModel.alarmTime];
        
    NSLog(@"%@",model.messageModel.alarmTime);
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    self.dateLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    self.dateLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.dateLabel sizeToFit];
    [self addSubview:self.dateLabel];
    
    if (nil == self.finshImage) {
        self.finshImage = [[UIImageView alloc] init];
    }
    [self.finshImage setImage:[UIImage imageNamed:@"alarm_im_icon_done.png"]];
    self.finshImage.frame = CGRectMake(0.0f, 0.0f, 49.5f, 11.5f);
    [self addSubview:self.finshImage];
    
    
//    self.alarmImage.frame = CGRectMake((320.0f - self.alarmImage.frame.size.width - self.dateLabel.frame.size.width) / 2.0f,
//                                        kCellTopPadding+kTopAndButtomPadding + 1.0f,
//                                        self.alarmImage.frame.size.width,
//                                        self.alarmImage.frame.size.height);
    self.dateLabel.frame = CGRectMake( (320.0f - self.dateLabel.frame.size.width) / 2.0f,
                                        kCellTopPadding+kTopAndButtomPadding,
                                        self.dateLabel.frame.size.width,
                                        self.dateLabel.frame.size.height);
    self.finshImage.frame = CGRectMake((320.0f - self.finshImage.frame.size.width) / 2.0f,
                                       self.dateLabel.frame.origin.y + self.dateLabel.frame.size.height,
                                       self.finshImage.frame.size.width,
                                       self.finshImage.frame.size.height);

    self.displayImageView.image = [UIImage imageNamed:@"alarm_im_ss_img_pt.png"];
    [self.playButton setImage:[UIImage imageNamed:@"alarm_im_btn_pt_play_nor.png"] forState:UIControlStateNormal];
    [self.playButton setImage:[UIImage imageNamed:@"alarm_im_btn_pt_play_press.png"] forState:UIControlStateHighlighted];
    
    [self adaptEllipticalBackgroundImage];
    
    CGFloat w = self.displayImageView.image.size.width + kLeftAndRightPadding+ kLeftAndRightPadding + 45.0f;
    
    CPLogInfo(@"displayImageView.image.size.width == %f",self.displayImageView.image.size.width);
    
    
    self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, kSoundAlarmedHeight);  //固定高度
    self.displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding,
                                            self.finshImage.frame.origin.y + self.finshImage.frame.size.height + 7.0f,
                                            self.displayImageView.image.size.width, self.displayImageView.image.size.height);
    
    self.playButton.frame = CGRectMake(self.displayImageView.frame.origin.x + self.displayImageView.frame.size.width, self.ellipticalBackground.frame.origin.y + 60.0f, 50.0f, 45.0f);
    
    self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f,
                                         ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                         kResendButtonWidth, kResendButtonWidth);
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
    [self bringSubviewToFront:avatar];
    avatar.frame = CGRectMake(ellipticalBackground.frame.origin.x - kAvatarWidth+ 8, ellipticalBackground.frame.origin.y, kAvatarWidth, kAvatarHeight);
    if (!self.userHeadImage) {
        avatar.backImage = [UIImage imageNamed:@"headpic_index_normal_120x120"];
    }else {
        avatar.backImage = self.userHeadImage;
    }
    
}

-(void)layoutBaseControls{
    [super layoutBaseControls];
}

@end
