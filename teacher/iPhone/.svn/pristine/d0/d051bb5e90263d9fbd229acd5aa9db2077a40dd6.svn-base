//
//  MessageVideoViewController.h
//  iCouple
//
//  Created by shuo wang on 12-5-11.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//



@protocol UserMessageVideoDelegate <NSObject>

@required
-(void) beganOpenVideoAnimation;
-(void) beganCloseVideoAnimation;
-(void) endCloseVideoAnimation;
@end

#import <UIKit/UIKit.h>
#import "MediaPlayer/MediaPlayer.h"
#import "AVFoundation/AVFoundation.h"
#import "HPStatusBarTipView.h"

@interface MessageVideoViewController : UIViewController<UIActionSheetDelegate>

// 展示图片的UIImageView
@property (nonatomic,strong) UIImageView *imageView;
// 播放的视频路径
@property (nonatomic,strong) NSString *videoPath;
// 第一桢的图片路径
@property (nonatomic,strong) NSString *imagePath;
// 第一桢的图片矩形
@property (nonatomic) CGRect videoRect;

// 用户是否已保存视频
@property (nonatomic) BOOL isSavedImage;

// 是否正在显示开始动画
@property (nonatomic) BOOL isBeganShowAnimation;
// 是否正在显示结束动画
@property (nonatomic) BOOL isEndCloseAnimation;

@property (nonatomic,assign) id<UserMessageVideoDelegate> delegate;

-(id) initWithVideoPath : (NSString *) videoPath withImagePath : (NSString *)imagePath withRect : (CGRect) rect;

//
-(void) beginAnimation;
@end
