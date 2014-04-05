//
//  SingleSoundAlarmCell.m
//  iCouple
//
//  Created by wang shuo on 12-8-23.
//
//

#import "SingleSoundAlarmCell.h"

@implementation SingleSoundAlarmCell
@synthesize displayImageView = _displayImageView , playButton = _playButton ,  dateLabel = _dateLabel;
@synthesize textLabelTop = _textLabelTop , textLabelBottom = _textLabelBottom;
@synthesize breakAlarmImage = _breakAlarmImage;
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
    if (model.isResoureBreak) {
        // 添加破损闹钟图片
        if (nil == self.breakAlarmImage) {
            self.breakAlarmImage = [[UIImageView alloc] init];
        }
        [self.breakAlarmImage setImage:[UIImage imageNamed:@"alarm_im_img_error.png"]];
        self.breakAlarmImage.frame = CGRectMake(0.0f, 0.0f, 95.0f, 75.0f);
        [self addSubview:self.breakAlarmImage];
        
        [self adaptEllipticalBackgroundImage];
        CGFloat width = self.breakAlarmImage.image.size.width + kLeftAndRightPadding+ kLeftAndRightPadding;
        
        self.ellipticalBackground.frame = CGRectMake((320 - width)/2, kCellTopPadding, width, kBreakSoundAlarmHeight);  //固定高度
        self.breakAlarmImage.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding,
                                                kLeftAndRightPadding,
                                                self.breakAlarmImage.image.size.width,
                                                self.breakAlarmImage.image.size.height);
        self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f,
                                             ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                             kResendButtonWidth, kResendButtonWidth);
        
        timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
        timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
        return;
    }
    
    [self addSubview:self.displayImageView];
    [self addSubview:self.playButton];
    
    if ([model.messageModel.isAlarmHidden boolValue] == NO) {
        // 添加闹钟图片
//        if (nil == self.alarmImage) {
//            self.alarmImage = [[UIImageView alloc] init];
//        }
//        [self.alarmImage setImage:[UIImage imageNamed:@"alarm_im_icon_gray.png"]];
//        self.alarmImage.frame = CGRectMake(0.0f, 0.0f, 12.0f, 12.0f);
//        [self addSubview:self.alarmImage];
        
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
        
//        self.alarmImage.frame = CGRectMake((320.0f - self.alarmImage.frame.size.width - self.dateLabel.frame.size.width) / 2.0f,
//                                           kCellTopPadding+kTopAndButtomPadding + 1.0f,
//                                           self.alarmImage.frame.size.width,
//                                           self.alarmImage.frame.size.height);
        self.dateLabel.frame = CGRectMake((320.0f - self.dateLabel.frame.size.width) / 2.0f,
                                          kCellTopPadding+kTopAndButtomPadding,
                                          self.dateLabel.frame.size.width,
                                          self.dateLabel.frame.size.height);
    }else{
        if ( nil == self.textLabelTop ) {
            self.textLabelTop = [[UILabel alloc] init];
        }
        self.textLabelTop.textColor = [UIColor colorWithHexString:@"#999999"];
        self.textLabelTop.backgroundColor = [UIColor clearColor];
        self.textLabelTop.font = [UIFont systemFontOfSize:12.0f];
        if ([model.messageModel.flag intValue] == MSG_FLAG_SEND) {
            self.textLabelTop.text = @"你送出一个神秘闹闹，";
        }else{
            self.textLabelTop.text = @"送你一个神秘闹闹，到";
        }
        self.textLabelTop.textAlignment = UITextAlignmentCenter;
        [self.textLabelTop sizeToFit];
        [self addSubview:self.textLabelTop];
        self.textLabelTop.frame = CGRectMake((320.0f - self.textLabelTop.frame.size.width) / 2.0f,
                                           AlarmTopHeight + kCellTopPadding,
                                           self.textLabelTop.frame.size.width,
                                           self.textLabelTop.frame.size.height);
        
        if ( nil == self.textLabelBottom ) {
            self.textLabelBottom = [[UILabel alloc] init];
        }
        self.textLabelBottom.textColor = [UIColor colorWithHexString:@"#999999"];
        self.textLabelBottom.backgroundColor = [UIColor clearColor];
        self.textLabelBottom.font = [UIFont systemFontOfSize:12.0f];
        if ([model.messageModel.flag intValue] == MSG_FLAG_SEND) {
            self.textLabelBottom.text = @"对方到期才看到内容";
        }else{
            self.textLabelBottom.text = @"时候你就知道内容啦";
        }
        self.textLabelBottom.textAlignment = UITextAlignmentCenter;
        [self.textLabelBottom sizeToFit];
        [self addSubview:self.textLabelBottom];
        self.textLabelBottom.frame = CGRectMake((320.0f - self.textLabelBottom.frame.size.width) / 2.0f,
                                             self.textLabelTop.frame.origin.y + self.textLabelTop.frame.size.height,
                                             self.textLabelBottom.frame.size.width,
                                             self.textLabelBottom.frame.size.height);
    }
    
    if ([model.messageModel.isAlarmHidden boolValue] == NO) {
        self.displayImageView.image = [UIImage imageNamed:@"alarm_im_ss_img_pt.png"];
        [self.playButton setImage:[UIImage imageNamed:@"alarm_im_btn_pt_play_nor.png"] forState:UIControlStateNormal];
        [self.playButton setImage:[UIImage imageNamed:@"alarm_im_btn_pt_play_press.png"] forState:UIControlStateHighlighted];
    }else{
        self.displayImageView.image = [UIImage imageNamed:@"alarm_im_ss_img_sml.png"];
        [self.playButton setImage:[UIImage imageNamed:@"alarm_im_btn_sm_play_nor.png"] forState:UIControlStateNormal];
        [self.playButton setImage:[UIImage imageNamed:@"alarm_im_btn_sm_play_press.png"] forState:UIControlStateHighlighted];
    }
    
    
    [self adaptEllipticalBackgroundImage];
    
    CGFloat w = self.displayImageView.image.size.width + kLeftAndRightPadding+ kLeftAndRightPadding + 45.0f;
    
    CPLogInfo(@"displayImageView.image.size.width == %f",self.displayImageView.image.size.width);
    
    if ([model.messageModel.isAlarmHidden boolValue] == NO) {
        self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, kSoundAlarmHeight);  //固定高度
        self.displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding,
                                                 self.dateLabel.frame.origin.y + self.dateLabel.frame.size.height + 7.0f,
                                                 self.displayImageView.image.size.width, self.displayImageView.image.size.height);
    }else{
        self.ellipticalBackground.frame = CGRectMake((320 - w)/2, kCellTopPadding, w, kMysticalSoundAlarmHeight);  //固定高度
        NSLog(@"%f",self.textLabelBottom.frame.size.height);
        self.displayImageView.frame = CGRectMake(self.ellipticalBackground.frame.origin.x + kLeftAndRightPadding,
                                                 self.textLabelBottom.frame.origin.y + self.textLabelBottom.frame.size.height + 7.0f,
                                                 self.displayImageView.image.size.width, self.displayImageView.image.size.height);
    }
    
    self.playButton.frame = CGRectMake(self.displayImageView.frame.origin.x + self.displayImageView.frame.size.width, self.ellipticalBackground.frame.origin.y + 60.0f, 50.0f, 45.0f);
    
    self.resendButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width + 10.0f,
                                         ( ellipticalBackground.frame.size.height - kResendButtonWidth ) /2.0f ,
                                         kResendButtonWidth, kResendButtonWidth);
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
}

-(void)layoutBaseControls{
    [super layoutBaseControls];
}

@end
