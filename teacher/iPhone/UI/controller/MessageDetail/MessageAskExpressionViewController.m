//
//  MessageAskExpressionViewController.m
//  iCouple
//
//  Created by shuo wang on 12-5-18.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessageAskExpressionViewController.h"
#import "MusicPlayerManager.h"
#import "TPCMToAMR.h"


typedef enum{
    Question,
    Answer
}PlayType;

@interface MessageAskExpressionViewController ()
@property (nonatomic) PlayType playType;
@property (nonatomic,strong) NSString *pcmQuestionPath;
@property (nonatomic,strong) NSString *pcmAnswerPath;
@property (nonatomic,strong) NSString *amrQuestionPath;
@property (nonatomic,strong) NSString *amrAnswerPath;
@property (nonatomic,strong) ARMicView *micMeter;

@property (nonatomic,strong) NSString *senderUserName;
@property (nonatomic) BOOL isRecord;
//-(NSString *) convertAMRToPCM : (NSString *) AMRPath;
@property (nonatomic,strong) NSArray *imageArray;

-(void) closeAnimationView;
-(void) animImageViewDidStopAnim:(AnimImageView*) animView;
-(void) audioPlayerDidFinishPlaying;
-(void) clcikOnlyListenAnswer;
-(void) clickAnswerBegin;
-(void) clickAnswerFinish;

-(void) clickScreenPlay : (UIGestureRecognizer *)gesture;
@end

@implementation MessageAskExpressionViewController
@synthesize askType = _askType;
@synthesize playType = _playType;
@synthesize pcmAnswerPath = _pcmAnswerPath , pcmQuestionPath = _pcmQuestionPath;
@synthesize micMeter = _micMeter;
@synthesize amrAnswerPath = _amrAnswerPath , amrQuestionPath = _amrQuestionPath;
@synthesize perssAnswerButton = _perssAnswerButton , onlyListenAnswerButton = _onlyListenAnswerButton;
@synthesize senderUserName = _senderUserName;
@synthesize isRecord = _isRecord;
@synthesize imageArray = _imageArray;

-(id) initWithExModel:(ExMessageModel *)exModel{
    self = [super initWithExModel:exModel];
    if (self) {
        
        self.isRecord = NO;
        NSArray *array = [[CPUIModelManagement sharedInstance] getMsgListAskWithMsg:self.exModel.messageModel];
        
        if (nil == array || [array count] <= 0) {
            CPLogInfo(@"getMsgListAskWithMsg array is nil");
            return nil;
        }else {
            NSFileManager *fileManager = [NSFileManager defaultManager];
            CPUIModelMessage *msg1 = (CPUIModelMessage *)[array objectAtIndex:0];
            if ([msg1.contentType intValue] == MSG_CONTENT_TYPE_TTW) {
                // 如果该消息是偷偷问，取得问题的音频地址
                self.amrQuestionPath = msg1.filePath;
                self.senderUserName = msg1.msgSenderName;
                
                if (nil == self.senderUserName || [self.senderUserName isEqualToString:@""]) {
                    // 如果音频的地址为空，返回
                    CPLogInfo(@"\nsenderUserName is empty \nself.senderUserName = %@ \nCPUIModelMessage.msgSenderName = %@",self.senderUserName,msg1.msgSenderName);
                    return nil;
                }
                
                if (self.amrQuestionPath == nil || [self.amrQuestionPath isEqualToString:@""]) {
                    // 如果音频的地址为空，返回
                    CPLogInfo(@"\namrQuestionPath is empty \nself.amrQuestionPath = %@ \nCPUIModelMessage.filePath = %@",self.amrQuestionPath,msg1.filePath);
                    return nil;
                } 
                // 转换音频
                self.pcmQuestionPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"ttwQuestion1.wav"]; 
                if ([fileManager fileExistsAtPath:self.pcmQuestionPath]) {
                    [fileManager removeItemAtPath:self.pcmQuestionPath error:nil];
                    self.pcmQuestionPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"ttwQuestion2.wav"];
                }
                
                int succeed = [TPCMToAMR doConvertAMRFromPath:self.amrQuestionPath toPCMPath:self.pcmQuestionPath];
                // 返回值如果小于零，则转换不成功，不做任何操作
                if (succeed <= 0) {
                    CPLogInfo(@"音频转换不成功");
                    return nil;
                }
            }else {
                CPLogInfo(@"getMsgListAskWithMsg array is error!!");
                return nil;
            }
            
            if ([self.exModel.messageModel.contentType intValue] == MSG_CONTENT_TYPE_TTD) {
                // 如果该消息是偷偷答，取得答案的音频地址
                self.amrAnswerPath = self.exModel.messageModel.filePath;
                // 如果音频的地址为空，返回
                if (self.amrAnswerPath == nil || [self.amrAnswerPath isEqualToString:@""]) {
                    CPLogInfo(@"\namrAnswerPath is empty \nself.amrAnswerPath = %@ \nCPUIModelMessage.filePath = %@",self.amrAnswerPath,self.exModel.messageModel.filePath);
                    return nil;
                }
                // 转换音频
                self.pcmAnswerPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"ttwAnswer1.wav"]; 
                if ([fileManager fileExistsAtPath:self.pcmAnswerPath]) {
                    [fileManager removeItemAtPath:self.pcmAnswerPath error:nil];
                    self.pcmAnswerPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"ttwAnswer2.wav"];
                }
                
                int succeed = [TPCMToAMR doConvertAMRFromPath:self.amrAnswerPath toPCMPath:self.pcmAnswerPath];
                // 返回值如果小于零，则转换不成功，不做任何操作
                if (succeed <= 0) {
                    CPLogInfo(@"音频转换不成功");
                    return nil;
                }
            }else {
                CPLogInfo(@"exModel Type is error!! self.exModel.messageModel.contentType is %d",[self.exModel.messageModel.contentType intValue]);
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
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CPUIModelPetActionAnim *askExpression = [[CPUIModelManagement sharedInstance] actionObjectOfID:self.petResID];
    CGSize size = CGSizeMake([askExpression.width floatValue] / 2.0f, [askExpression.height floatValue] / 2.0f);
    self.viewSize = size;
    
    //[AudioPlayerManager sharedManager].delegate = self;
    [MusicPlayerManager sharedInstance].delegate = self;
    
    
    self.micMeter = [[ARMicView alloc] initWithCenter:CGPointMake(160.0f, 245.0f)];
    self.micMeter.delegate = self;
    // 添加长按按钮
    self.perssAnswerButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.perssAnswerButton setTitle:@"长按住说话" forState:UIControlStateNormal];
    UIImage *listenAnswer = [UIImage imageNamed:@"btn_pet_speak.png"];
    UIImage *listenAnswerPress = [UIImage imageNamed:@"btn_pet_speakpress.png"];
    self.perssAnswerButton.frame = CGRectMake( (self.view.frame.size.width - listenAnswer.size.width )/2, 380, listenAnswer.size.width , listenAnswer.size.height);
    
    [self.perssAnswerButton setBackgroundImage:listenAnswer forState:UIControlStateNormal];
    [self.perssAnswerButton setBackgroundImage:listenAnswerPress forState:UIControlStateHighlighted];
    [self.perssAnswerButton addTarget:self action:@selector(clickAnswerBegin) forControlEvents:UIControlEventTouchDown];
    [self.perssAnswerButton addTarget:self action:@selector(clickAnswerFinish) forControlEvents:UIControlEventTouchUpInside];
    [self.perssAnswerButton addTarget:self action:@selector(clickAnswerFinish) forControlEvents:UIControlEventTouchUpOutside];
    [self.perssAnswerButton addTarget:self action:@selector(clickAnswerFinish) forControlEvents:UIControlEventTouchCancel];
    self.perssAnswerButton.userInteractionEnabled = YES;
    self.perssAnswerButton.hidden = YES;
    [self.view addSubview:self.perssAnswerButton];
    
    // 添加只听答案按钮
    self.onlyListenAnswerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *onlyListenAnswer = [UIImage imageNamed:@"btn_pet_listenanswer.png"];
    UIImage *onlylistenAnswerPress = [UIImage imageNamed:@"btn_pet_listenanswerpress.png"];
    [self.onlyListenAnswerButton setTitle:@"只听答案" forState:UIControlStateNormal];
    self.onlyListenAnswerButton.frame = CGRectMake( (self.view.frame.size.width - listenAnswer.size.width )/2, 380, listenAnswer.size.width , listenAnswer.size.height);
    
    [self.onlyListenAnswerButton setBackgroundImage:onlyListenAnswer forState:UIControlStateNormal];
    [self.onlyListenAnswerButton setBackgroundImage:onlylistenAnswerPress forState:UIControlStateHighlighted];
    [self.onlyListenAnswerButton addTarget:self action:@selector(clcikOnlyListenAnswer) forControlEvents:UIControlEventTouchDown];
    self.onlyListenAnswerButton.hidden = YES;
//    self.onlyListenAnswerButton.userInteractionEnabled = YES;
    [self.view addSubview:self.onlyListenAnswerButton];
//    self.view.userInteractionEnabled = YES;
    
//    self.onlyListenAnswerButton.tag = 1;
    
    // 初始化动画数据
//    [self.animView addAnimArray:[askExpression allAnimSlides] forName:self.petResID];
    
    if ([self.exModel.messageModel.flag intValue] == MSG_FLAG_SEND) {
        // 如果是发送模式
        if ([self.exModel.messageModel.contentType intValue] == MSG_CONTENT_TYPE_TTW) {
            // 如果是偷偷问 
            self.askType = SendAskQuestion;
        }else if ([self.exModel.messageModel.contentType intValue] == MSG_CONTENT_TYPE_TTD) {
            // 如果是偷偷答
            self.askType = SendAskAnswer;
            self.perssAnswerButton.hidden = YES;
            self.onlyListenAnswerButton.hidden = NO;
            self.playType = Question;
        }
    }else if ([self.exModel.messageModel.flag intValue] == MSG_FLAG_RECEIVE) {
        // 如果是接收模式
        if ([self.exModel.messageModel.contentType intValue] == MSG_CONTENT_TYPE_TTW) {
            // 如果是偷偷问
            self.askType = ReceiveQuestion;
            self.perssAnswerButton.hidden = NO;
            self.perssAnswerButton.enabled = NO;
        }else if ([self.exModel.messageModel.contentType intValue] == MSG_CONTENT_TYPE_TTD) {
            // 如果是偷偷答
            self.askType = ReceiveAnswer;
            self.perssAnswerButton.hidden = YES;
            self.onlyListenAnswerButton.hidden = NO;
            self.playType = Question;
        }
    }
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickScreenPlay:)];
    [self.buttonView addGestureRecognizer:tapRecognizer];
    
//    self.view.userInteractionEnabled = YES;
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    
}

-(void)musicPlayer:(MusicPlayerManager *) player playToTime:(NSTimeInterval) time playerName:(NSString *)name{
    
    [player.audioPlayer updateMeters];
    double avgPowerForChannel = pow(10, (0.05 * [player.audioPlayer averagePowerForChannel:0]));
    int nIdx = (int)(avgPowerForChannel*16);
    NSLog(@"amp nIdx: %d", nIdx);
    
    [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:nIdx]]];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self playmusic:self.pcmQuestionPath withMusicName:self.petResID];
}

-(void) closeAnimationView{
    if (self.isRecord) {
        return;
    }
    [super closeAnimationView];
//    [self.animView stop];
    [self stopMusic];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.view removeFromSuperview];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

// 动画播放完成回调
-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
//    switch (self.askType) {
//        case SendAskQuestion:{
//                [super animImageViewDidStopAnim:animView];
//                [self.animView stop];
//            
//                // 如果动画完成，并且声音也完成
//                if (self.isSoundFinished) {
//                    [self.animView stop];
//                    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//                    [[HPStatusBarTipView shareInstance] setHidden:NO];
//                    if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
//                        [self.delegate closeMessageExpressionView];
//                    }
//                    [self.view removeFromSuperview];
//                }else {
//                    [self.animView start];
//                }
//            }
//            break;
//        case SendAskAnswer:{
//                if (self.isSoundFinished) {
//                    [self.animView stop];
//                }else {
//                    [self.animView start];
//                }
//            }
//            break;
//        case ReceiveQuestion:{
//                [super animImageViewDidStopAnim:animView];
//                [self.animView stop];
//            
//                // 如果动画完成，并且声音也完成
//                if (self.isSoundFinished) {
//                    [self.animView stop];
//                    self.perssAnswerButton.enabled = YES;
//                }else {
//                    [self.animView start];
//                }
//            }
//            break;
//        case ReceiveAnswer:{
//                if (self.isSoundFinished) {
//                    [self.animView stop];
//                }else {
//                    [self.animView start];
//                }
//            }
//            break;
//        default:
//            break;
//    }
}

// 声音播放完成回调
-(void) audioPlayerDidFinishPlaying{
    switch (self.askType) {
        case SendAskQuestion:{
                [super audioPlayerDidFinishPlaying];
            
                // 如果声音完成，并且动画也完成
//                if (self.isAnimationFinished) {
                    [[UIApplication sharedApplication] setStatusBarHidden:NO];
                    [[HPStatusBarTipView shareInstance] setHidden:NO];
                    if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
                        [self.delegate closeMessageExpressionView];
                    }
                    [self.view removeFromSuperview];
//                }
            }
            break;
        case SendAskAnswer:{
                if (self.playType == Question) {
                    self.playType = Answer;
//                    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
                    [self playmusic:self.pcmAnswerPath withMusicName:self.petResID];
                }else {
                    
                    [super audioPlayerDidFinishPlaying];
                    int nIdx = 0;
                    [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:nIdx]]];
                }
                
            }
            break;
        case ReceiveQuestion:{
                [super audioPlayerDidFinishPlaying];
            
                // 如果声音完成，并且动画也完成
//                if (self.isAnimationFinished) {
                    self.perssAnswerButton.enabled = YES;
//                }
                 int nIdx = 0;
                 [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:nIdx]]];
            }
            break;
        case ReceiveAnswer:{
                if (self.playType == Question) {
                    self.playType = Answer;
//                    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
                    [self playmusic:self.pcmAnswerPath withMusicName:self.petResID];
                }else {
                    [super audioPlayerDidFinishPlaying];
                    int nIdx = 0;
                    [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:nIdx]]];
                }
                
            }
            break;
        default:
            break;
    }
}

-(void) clickScreenPlay : (UIGestureRecognizer *)gesture{
    if (self.askType == SendAskAnswer || self.askType == ReceiveAnswer) {
//        NSLog(@"%d",gesture.view.tag);
        if (gesture.view.tag == 1){
            return;
        }
        
        // 重听问题和答案
        [self stopMusic];
        self.isSoundFinished = NO;
        self.isAnimationFinished = NO;
//        [self.animView stop];
//        [self.animView start];
        self.playType = Question;
        [self playmusic:self.pcmQuestionPath withMusicName:self.petResID];
    }else if (self.askType == SendAskQuestion || self.askType == ReceiveQuestion) {
//        NSLog(@"%d",gesture.view.tag);
        if (gesture.view.tag == 1){
            return;
        }
        if (self.isRecord) {
            return;
        }
        // 重听问题和答案
        [self stopMusic];
        self.isSoundFinished = NO;
        self.isAnimationFinished = NO;
//        [self.animView stop];
//        [self.animView start];
        self.playType = Answer;
        [self playmusic:self.pcmQuestionPath withMusicName:self.petResID];
    }
}

-(void) musicPlayerDidFinishPlaying:(MusicPlayerManager *)player playerName:(NSString *)name{
    [super musicPlayerDidFinishPlaying:player playerName:name];
    
    // 如果声音完成，并且动画也完成
    if (self.isAnimationFinished) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[HPStatusBarTipView shareInstance] setHidden:NO];
        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
            [self.delegate closeMessageExpressionView];
        }
        [self.view removeFromSuperview];
    }
}

-(void) clcikOnlyListenAnswer{
    // 只听答案
    [self stopMusic];
    self.isSoundFinished = NO;
    self.isAnimationFinished = NO;
//    [self.animView stop];
//    [self.animView start];
    self.playType = Answer;
    [self playmusic:self.pcmAnswerPath withMusicName:self.petResID];
}


-(void) clickAnswerBegin{
    self.isRecord = YES;
    //录音控件
    [self.micMeter startRecord];
}

-(void) clickAnswerFinish{
    [self.micMeter stopRecord];
}

// 开始
-(void)arMicViewRecordDidStarted:(id) arMicView_{
    self.isRecord = YES;
}
// 录音太短
-(void)arMicViewRecordTooShort:(id) arMicView_{
    self.isRecord = NO;
}
// 正确录音
-(void)arMicViewRecordDidEnd:(id) arMicView_ pcmPath:(NSString *)pcmPath_ length:(CGFloat) audioLength_{
    self.isRecord = NO;
    // 发送偷偷答消息
    self.perssAnswerButton.enabled = NO;
    CPUIModelMessage *msg = [[CPUIModelMessage alloc] init];
//    msg.msgData = data;
    msg.filePath =pcmPath_;
    msg.contentType = [NSNumber numberWithInt:MSG_CONTENT_TYPE_TTD];
    msg.uuidAsk = self.exModel.messageModel.uuidAsk;
    msg.msgSenderName = self.senderUserName;
    msg.petMsgID = self.exModel.messageModel.petMsgID;
    
    // 发送偷偷答回调
    if ([self.delegate respondsToSelector:@selector(sendTTDMessage:)]) {
        [self.delegate sendTTDMessage:msg];
    }
    
    [self performSelectorOnMainThread:@selector(closeView) withObject:nil waitUntilDone:NO];
}

// 录音转码失败或者被中断
-(void)arMicViewRecordErrorDidOccur:(id) arMicView_ error:(NSError *)error{
    self.isRecord = NO;
}

/*
 发送录音数据
 */
- (void)actionMicMeterSendRecordData:(NSData *)data withLength:(NSInteger)length{

//    // 发送偷偷答消息
//    self.perssAnswerButton.enabled = NO;
//    CPUIModelMessage *msg = [[CPUIModelMessage alloc] init];
//    msg.msgData = data;
//    msg.contentType = [NSNumber numberWithInt:MSG_CONTENT_TYPE_TTD];
//    msg.uuidAsk = self.exModel.messageModel.uuidAsk;
//    msg.msgSenderName = self.senderUserName;
//    msg.petMsgID = self.exModel.messageModel.petMsgID;
//    
//    // 发送偷偷答回调
//    if ([self.delegate respondsToSelector:@selector(sendTTDMessage:)]) {
//        [self.delegate sendTTDMessage:msg];
//    }
//    
//    [self performSelectorOnMainThread:@selector(closeView) withObject:nil waitUntilDone:NO];
}

-(void) closeView{
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[HPStatusBarTipView shareInstance] setHidden:NO];
    if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
        [self.delegate closeMessageExpressionView];
    }
    [self.view removeFromSuperview];
}

/*
 发送录音错误：录音时间太短
 */
- (void)actionMicMeterSendErrorRecordTooShort{
    
}

/*
 录音失败
 */
- (void)actionMicMeterSendError{
    
}

/*
 开始录音
 */
- (void)actionMicMeterBeginRecord{
    
}

@end
