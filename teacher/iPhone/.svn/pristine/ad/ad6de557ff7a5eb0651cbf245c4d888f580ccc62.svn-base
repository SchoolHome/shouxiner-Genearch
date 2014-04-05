//
//  MessageExpressionViewController.h
//  iCouple
//
//  Created by shuo wang on 12-5-19.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimImageView.h"
#import "MusicPlayerManager.h"
#import "AudioPlayerManager.h"
#import "ExMessageModel.h"
#import "HPStatusBarTipView.h"

@protocol ExpressionDelegate <NSObject>

@optional
-(void) sendTTDMessage:(CPUIModelMessage *) msg;
-(void) closeMessageExpressionView;
@end

@interface MessageExpressionViewController : UIViewController<AnimImageViewDelegate,MusicPlayerManagerDelegate,AudioPlayerDelegate>

// 宠物资源ID
@property (nonatomic,strong) NSString *petResID;
//
@property (nonatomic,strong) NSString *petID;
// 声音路径
@property (nonatomic,strong) NSString *soundPath;
// 动画ImageView
@property (nonatomic,strong) AnimImageView *animView;
// 透明View
@property (nonatomic,strong) UIView *alphaView;
// set View Size
@property (nonatomic) CGSize viewSize;
// 动画播放完成
@property (nonatomic) BOOL isAnimationFinished;
// 声音播放完成
@property (nonatomic) BOOL isSoundFinished;
@property (nonatomic,strong) ExMessageModel *exModel;
// 发送偷偷答时的回调
@property (nonatomic,assign) id<ExpressionDelegate> delegate;
@property (nonatomic,strong) UIView *buttonView;
@property (nonatomic,strong) UIButton *closeButton;
// 播放声音
-(void) playmusic : (NSString *) musicPath withMusicName : (NSString *) musicName;
// 停止声音
-(void) stopMusic;
// 播放音效
-(ALuint) playEffect:(NSString *)effectPath;
// 停止音效
-(void) stopEffect : (ALuint) i;
// 初始化魔法表情系列
-(id) initWithPetResID : (NSString *) petResID withPetID : (NSString *) petID;
// 初始化传情系列
-(id) initWithPetResID : (NSString *) petResID withPetID : (NSString *) petID withSoundPath : (NSString *) soundPath;
// 初始化偷偷问系列
-(id) initWithExModel : (ExMessageModel *)exModel;
// 关闭此窗口
-(void) closeAnimationView;
@end
