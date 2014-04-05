//
//  SingleTextAlarmCell.m
//  iCouple
//
//  Created by wang shuo on 12-8-16.
//
//

#import "SingleTextAlarmCell.h"
#import "CoreUtils.h"

@implementation SingleTextAlarmCell

@synthesize dateLabel = _dateLabel;
@synthesize size = _size;
@synthesize alarmImage = _alarmImage;

-(id) initWithType:(MessageCellType)messageCellType withBelongMe:(BOOL)isBelongMe withKey:(NSString *)key{
    self = [super initWithType:messageCellType withBelongMe:isBelongMe withKey:key];
    
    if (self) {
        
    }
    return self;
}

// 该类型不对提醒做任何操作
-(void) showAlarmTip{
    
}

-(CGSize) calculateTextDisplayViewSize:(ExMessageModel *)model{
    self.size = [super calculateTextDisplayViewSize:model];
    
    if (nil == self.alarmImage) {
        self.alarmImage = [[UIImageView alloc] init];
    }
    [self.alarmImage setImage:[UIImage imageNamed:@"alarm_im_icon_orange.png"]];
    self.alarmImage.frame = CGRectMake(0.0f, 0.0f, 12.0f, 12.0f);
    
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
    
    
    self.alarmImage.frame = CGRectMake((320.0f - self.alarmImage.frame.size.width - self.dateLabel.frame.size.width) / 2.0f,
                                       AlarmTopHeight + kCellTopPadding + 1.0f,
                                       self.alarmImage.frame.size.width,
                                       self.alarmImage.frame.size.height);
    self.dateLabel.frame = CGRectMake(self.alarmImage.frame.origin.x + self.alarmImage.frame.size.width + AlarmAndDateDistance,
                                      AlarmTopHeight + kCellTopPadding,
                                      self.dateLabel.frame.size.width,
                                      self.dateLabel.frame.size.height);

    CGFloat width = self.dateLabel.frame.size.width + self.alarmImage.frame.size.width + AlarmAndDateDistance + kLeftAndRightPadding * 2;
    CGSize newSize = CGSizeZero;
    if (width < (self.size.width + kLeftAndRightPadding * 2 )) {
        newSize = CGSizeMake(self.size.width, self.size.height + kTextDateHeight);
    }else{
        newSize = CGSizeMake(width, self.size.height + kTextDateHeight);
    }
    
    return newSize;
}

-(void) refreshCell{
    [super refreshCell];
    textDisplayView.frame = CGRectMake((320.0f - self.size.width) / 2.0f,
                                       textDisplayView.frame.origin.y + kTextDateHeight,
                                       self.size.width,
                                       textDisplayView.frame.size.height);
    
    
    [self.alarmImage removeFromSuperview];
    [self addSubview:self.alarmImage];
    [self bringSubviewToFront:self.alarmImage];
    
    [self.dateLabel removeFromSuperview];
    [self addSubview:self.dateLabel];
    [self bringSubviewToFront:self.dateLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

@end
