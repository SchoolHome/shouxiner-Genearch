//
//  ARMicView.h
//  iCouple
//
//  Created by ming bright on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARLevelView.h"
#import "AudioRecorder.h"

typedef enum {
    RECORDER_TYPE_NA,
    RECORDER_TYPE_COMMON,  // 普通不变声
    RECORDER_TYPE_TRANSED  // 变声
}RECORDER_TYPE;


@protocol ARMicViewDelegate;
@interface ARMicView : UIView<AudioRecorderDelegate>

{
    UIImageView *micBackground;
    ARLevelView *levelView;
    UILabel     *countDownLabel;
    
    AudioRecorder *audioRecorder;
    
    NSTimer *recordTimer;
    
    CGFloat totalCount; 
    
    RECORDER_TYPE  recoderType;
}

@property(nonatomic,assign) id<ARMicViewDelegate> delegate;
@property (assign) RECORDER_TYPE  recoderType;
-(id)initWithCenter:(CGPoint )center;

-(void)startRecord;
-(void)stopRecord;

@end

@protocol ARMicViewDelegate <NSObject>

// 开始
-(void)arMicViewRecordDidStarted:(id) arMicView_;
// 录音太短
-(void)arMicViewRecordTooShort:(id) arMicView_;
// 正确录音
-(void)arMicViewRecordDidEnd:(id) arMicView_ pcmPath:(NSString *)pcmPath_ length:(CGFloat) audioLength_;
// 录音转码失败或者被中断
-(void)arMicViewRecordErrorDidOccur:(id) arMicView_ error:(NSError *)error;

@end