//
//  HomeMainViewController.h
//  iCouple
//
//  Created by qing zhang on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HomeCloseFriendView.h"
#import "HomeFriendsView.h"
#import "CoupleBreakIcePageView.h"
#import "FriendWallSwitchButton.h"
#define alertNoneCoupleTag 100001
#define alertDeleteFriendTag 100002
#define alertMessageWhenFristTime @"alertMessage"
#define alertMessageViewTag 100003
typedef enum
{
    ContactFriend_Default = -1,
    ContactFriend_NormalFriend = 0,
    ContactFriend_Couple = 2,
    ContactFriend_CloseFriend = 1,
    //ContactFriend_CoupleProfile = 3

}ContactFriend;

@interface HomeMainViewController : UIViewController <HomeMainViewDelegate,UIScrollViewDelegate,CoupleBreakIcePageViewDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIAlertViewDelegate>
{
    BOOL isComeFromChooseCoupleViewController;
    FriendWallSwitchButton *switchButton;
    NSTimer *timer;

}
@property (nonatomic )BOOL needBreakIceWhenCoupleMessageGroupNil;

//根据方向来生成动画
//- (CATransition *) getAnimation:(NSString *) direction;
//初始化view
- (void)initViewControllerByName:(NSInteger )type;
//滚动到指定区域，见枚举
-(void)scrollToRect : (NSInteger)viewcontrollerIndex;
//跳转到couple的profile
//-(void)turnToCoupleProfile:(NSInteger)profileNeedorNot;
// 根据coupleMessageGroup切换couple破冰
-(void)changeCoupleIceBreak;
//根据状态改变couple破冰
-(void)changeCoupleIceBreak:(BOOL)isChanged;
-(void)scrollToRect : (NSInteger)viewcontrollerIndex withAnimation :(BOOL)isNeeded;
//滚动到密友墙
-(void)scrollToCloseFriendRect;
@end
