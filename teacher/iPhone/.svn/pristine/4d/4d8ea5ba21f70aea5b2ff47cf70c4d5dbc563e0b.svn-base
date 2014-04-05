//
//  MessageAlarmExpressionViewController.m
//  iCouple
//
//  Created by wang shuo on 12-9-10.
//
//

#import "MessageAlarmExpressionViewController.h"
#import "MusicPlayerManager.h"
#import "TPCMToAMR.h"
#import "CoreUtils.h"
#import "ColorUtil.h"

@interface MessageAlarmExpressionViewController ()
@property (nonatomic,strong) NSString *pcmPath;
@property (nonatomic,strong) NSArray *imageArray;
@end

@implementation MessageAlarmExpressionViewController
@synthesize pcmPath = _pcmPath;
@synthesize imageArray = _imageArray;

// 初始化双双闹钟系列
-(id) initWithExModel:(ExMessageModel *)exModel{
    self = [super initWithExModel:exModel];
    if (self) {
        self.pcmPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"alarm1.wav"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:self.pcmPath]) {
            [fileManager removeItemAtPath:self.pcmPath error:nil];
            self.pcmPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"alarm2.wav"];
        }
        
        int succeed = [TPCMToAMR doConvertAMRFromPath:exModel.messageModel.filePath toPCMPath:self.pcmPath];
        // 返回值如果小于零，则转换不成功，不做任何操作
        if (succeed <= 0) {
            CPLogInfo(@"音频转换不成功");
            return nil;
        }
        self.imageArray = [[NSArray alloc] initWithObjects:
                           @"shuohua01",
                           @"shuohua02",
                           @"shuohua03",
                           @"shuohua04",
                           @"shuohua05",
                           @"shuohua06",
                           @"shuohua07",
                           @"shuohua08",
                           @"shuohua09",
                           @"shuohua10",
                           @"shuohua11",
                           @"shuohua12",
                           @"shuohua13",
                           @"shuohua14",
                           @"shuohua15",
                           @"shuohua16",
                           nil];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CPUIModelPetActionAnim *soundExpression = [[CPUIModelManagement sharedInstance] actionObjectOfID:self.petResID];
    CGSize size = CGSizeMake([soundExpression.width floatValue] / 2.0f, [soundExpression.height floatValue] / 2.0f);
    self.viewSize = size;
    
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alarm_bg.png"]];
    [self.view addSubview:bg];
    
    [self.alphaView removeFromSuperview];
    [self.view sendSubviewToBack:bg];
    
    UIImage *close = [UIImage imageNamed:@"alarm_playing_btn_close.png"];
    UIImage *closePress = [UIImage imageNamed:@"alarm_playing_btn_close_press.png"];
    [self.closeButton setImage:close forState:UIControlStateNormal];
    [self.closeButton setImage:closePress forState:UIControlStateHighlighted];
    self.closeButton.frame = CGRectMake(252.5f, 25.0f, close.size.width, close.size.height);
    
    UIImageView *timeView = [[UIImageView alloc] init];
    [timeView setImage:[UIImage imageNamed:@"alarm_playing_showtime.png"]];
    timeView.frame = CGRectMake( (320.0f - 158.0f) / 2.0f, 460.0f - 79.0f, 158.0f, 79.0f);
    [self.view addSubview:timeView];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [timeFormatter setDateFormat:@"HH:mm"];
    NSDate *date = [CoreUtils getDateFormatWithLong:self.exModel.messageModel.alarmTime];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = [timeFormatter stringFromDate:date];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.textColor = [UIColor colorWithHexString:@"#555555"];
    timeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36.0f];
    timeLabel.shadowColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.6f];
    timeLabel.shadowOffset = CGSizeMake(0.0f, 2.0f);
    [timeLabel sizeToFit];
    timeLabel.frame = CGRectMake((320.0f - timeLabel.frame.size.width) / 2.0f,
                                 460.0f - 70.0f,
                                 timeLabel.frame.size.width,
                                 timeLabel.frame.size.height);
    [self.view addSubview:timeLabel];
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.text = [dateFormatter stringFromDate:date];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0f];
    dateLabel.shadowColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.6f];
    dateLabel.shadowOffset = CGSizeMake(0.0f, 2.0f);
    [dateLabel sizeToFit];
    dateLabel.frame = CGRectMake((320.0f - dateLabel.frame.size.width) / 2.0f + 3.0f,
                                 460.0f - 30.0f,
                                 dateLabel.frame.size.width,
                                 dateLabel.frame.size.height);
    [self.view addSubview:dateLabel];
    [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:0]]];
//    [AudioPlayerManager sharedManager].delegate = self;
    
//    [self.animView addAnimArray:[soundExpression allAnimSlides] forName:self.petResID];
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [MusicPlayerManager sharedInstance].delegate = self;
    [self playmusic:self.pcmPath withMusicName:self.petResID];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

-(void)musicPlayer:(MusicPlayerManager *) player playToTime:(NSTimeInterval) time playerName:(NSString *)name{
    
    [player.audioPlayer updateMeters];
    double avgPowerForChannel = pow(10, (0.05 * [player.audioPlayer averagePowerForChannel:0]));
    int nIdx = (int)(avgPowerForChannel*16);
    NSLog(@"amp nIdx: %d", nIdx);
    
    [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:nIdx]]];
}

// 动画播放完成回调
-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
//    [super animImageViewDidStopAnim:animView];
//    //    [self.animView stop];
//    
//    // 如果动画完成，并且声音也完成
//    if (self.isSoundFinished) {
//        self.animView.delegate = nil;
//        [self.animView stop];
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//        [[HPStatusBarTipView shareInstance] setHidden:NO];
//        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
//            [self.delegate closeMessageExpressionView];
//        }
//        [self.view removeFromSuperview];
//    }else {
//        [self.animView start];
//    }
}

// 声音播放完成回调
-(void) audioPlayerDidFinishPlaying{
    [super audioPlayerDidFinishPlaying];
    
    // 如果声音完成，并且动画也完成
//    if (self.isAnimationFinished) {
        [self.animView stop];
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[HPStatusBarTipView shareInstance] setHidden:NO];
        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
            [self.delegate closeMessageExpressionView];
        }
        [self.view removeFromSuperview];
//    }
}

-(void) closeAnimationView{
    [super closeAnimationView];
//    [self.animView stop];
    [self stopMusic];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.view removeFromSuperview];
}
@end
