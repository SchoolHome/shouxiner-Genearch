//
//  HomePageViewController.h
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "HomePageAnimView.h"
#import "HomePageTabBar.h"
#import "HomePageAvatarView.h"
#import "HomePageArrowView.h"
#import "HomePageDocumentView.h"
#import "HomePageDatePickerView.h"
#import "HPStatusBarTipView.h"
#import "HPTopTipView.h"

#import "HomeMainViewController.h"
#import "HomePageSelfProfileViewController.h"

#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "CPUIModelUserInfo.h"

#import "MusicPlayerManager.h"

#import "BKLocationManager.h"
#import "SVGeocoder.h"
#import "SVPlacemark.h"

#import "ARMicView.h"

#import "KeyboardView.h"

@interface HomePageViewController : UIViewController 
<
HomePageAvatarViewDelegate,
HomePageDocumentViewDelegate,
HomePageDatePickerViewDelegate,
HPStatusBarTipViewDelegate,
MusicPlayerManagerDelegate,
UIAlertViewDelegate
>
{
    HPNCButton *ncButton;
    UIButton *addButton;
    HPCoupleButton *coupleButton;
    HomePageAnimView *animView;
    HomePageAvatarView *avatarView;
    HomePageDocumentView *documentView;
    
    UIImageView *coupleContentBack;  // couple近况大背景
    UIButton *selfAudioButton;
    UIButton *coupleAudioButton;

    // 减少刷新次数
    int personalLifeStatus;
    BOOL hasBaby;
    
    /////
    KeyboardView *keyboard;
    
    HomeMainViewController *homeMainViewController;
    HomePageSelfProfileViewController *profileViewController;
}

@property(nonatomic,strong) HomePageSelfProfileViewController *profileViewController;

-(HomeMainViewController *)homeMainViewController;

+(HomePageViewController *)sharedHomePageViewController;

-(void)transformToHomeMainController:(int) type animated:(BOOL)animated;

-(void)clearHomePage;  //注意：登出的时候需要清理页面

-(void)updateAvatars;
-(void)updateDocuments;
-(void)updateBadges;
-(void)updateRelation;
-(void)updateRecent;

//-(void)showLoadingView;

-(void)stopAnim;
-(void)startAnim;

-(void)launchIM;
-(void)launchShuangTeamIM;
@end
