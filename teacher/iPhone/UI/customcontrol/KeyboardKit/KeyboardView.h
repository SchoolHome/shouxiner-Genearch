//
//  KeyboardView.h
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KBScrollView.h"

#import "KBSmallView.h"
#import "KBMagicView.h"
#import "KBEmojiView.h"

#import "KBGrowingTextView.h"

#import "KBPageControl.h"
#import "KBButton.h"

#import "ARMicView.h"

#import "CPUIModelManagement.h"
#import "CPUIModelPetSmallAnim.h"
#import "CPUIModelPetMagicAnim.h"


typedef enum{
    
    KB_SCROLL_VIEW_TAG_SAMLL,
    KB_SCROLL_VIEW_TAG_MAGIC,
    KB_SCROLL_VIEW_TAG_EMOJI
    
}KB_SCROLL_VIEW_TAG;



@protocol KeyboardViewDelegate <NSObject>

// 键盘出现 
- (void)keyboardViewDidAppear:(CGFloat)height; // 高度暂时是 0
- (void)keyboardViewDidDisappear;

// open
-(void)keyboardViewOpenPet;
-(void)keyboardViewOpenPhotoLibrary;
-(void)keyboardViewOpenCamera;

// send message
-(void)keyboardViewSendText:(NSString *)text_;
-(void)keyboardViewSendMagic:(NSString *)magicMsgID_ ofPet:(NSString *)petID_;

// 录音相关
// 开始
-(void)keyboardViewRecordDidStarted:(id) arMicView_;
// 录音太短
-(void)keyboardViewRecordTooShort:(id) arMicView_;
// 正确录音结束
-(void)keyboardViewRecordDidEnd:(id) arMicView_ pcmPath:(NSString *)pcmPath_ length:(CGFloat) audioLength_;
// 录音转码失败或者被中断
-(void)keyboardViewRecordErrorDidOccur:(id) arMicView_ error:(NSError *)error;

// 下载提示
- (void)keyboardViewDownloadCount:(int)count size:(CGFloat)size;
- (void)keyboardViewNeedMoreAlert;

- (void)keyboardViewDownloadMagic:(NSString *)magicMsgID_ ofPet:(NSString *)petID_; // 单个下载

@end


@interface KeyboardView : UIView
<KBGrowingTextViewDelegate,
KBPhotoSwitchDelegate,
KBScrollViewDelegate,
KBSmallViewDelegate, 
KBMagicViewDelegate,
KBEmojiViewDelegate,
ARMicViewDelegate
>
{
    // 工具栏按钮
    UIView *keyboardTopBar; // 
    UIImageView *topBarBack;
    UIImageView *textViewBack;
    UIImageView *textViewMask;
    
    KBPetButton     *petButton;
    KBRecordButton  *recordButton;
    KBConvertButton *convertButton;
    KBEmotionButton *emotionButton;
    KBCaptureButton *captureButton;
    
    KBPhotoSwitch *photoSwitch;
    
    KBGrowingTextView *textView;
    
    NSArray *emojis;
    NSMutableArray *escapeChars;
    
    KBScrollView *smallPageView;
    KBScrollView *magicPageView;
    KBScrollView *emojiPageView;
    
    KBPageControl *smallPageControl;
    KBPageControl *magicPageControl;
    KBPageControl *emojiPageControl;
    
    // 底部按钮
    KBSmallButton *smallButton;
    KBMagicButton *magicButton;
    KBEmojiButton *emojiButton;
    KBSendButton  *sendButton;
    
    ARMicView *micView;
    BOOL isRecordTimeOut; // 到达60秒，自动停止 
    
    
    NSString *cachedString;
}

@property(nonatomic,assign) id<KeyboardViewDelegate> delegate;

@property(nonatomic,strong) NSString *cachedString;
@property (nonatomic) float currentScreenHeight;
+(KeyboardView *)sharedKeyboardView;
-(UIView *)keyboardTopBar;
-(void)show;  //deprecated,please use -(void)showInView:(UIView *)aView
-(void)showInView:(UIView *)aView;
-(void)dismiss;
-(void)resetFrame;  //仅回到底部

-(void)reset; // 全部重置

-(CGFloat)currentHeight; // 高度: 文本框＋上下边沿

-(void)hidePhotoSwitch; // 隐藏选择按钮
-(void)setEmotionButtonEnabled:(BOOL) enabled; // 能否使用表情键盘
-(void)setPetButtonEnabled:(BOOL) enabled;  // 小双能否使用
-(void)clearText; // 清除文本

-(void)closeSystemKeyboard;

@end
