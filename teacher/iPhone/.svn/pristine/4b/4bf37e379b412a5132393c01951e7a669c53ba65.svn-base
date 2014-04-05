//
//  HomeMainView.h
//  iCouple
//
//  Created by qing zhang on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define hiddendUpPart        50.0f
#define imageviewDisplayPart 150.0f
#define HiddendDownPart      30.0f
#define tableviewYbeginPoint 160.0f

#define rect_a  CGRectMake(310.f-36.f, 9.f, 36.f, 36.f)
#define rect_b  CGRectMake(310.f-36.f, 9.f, 36.f, 36.f)

#import <UIKit/UIKit.h>

#import "HomeFriendsTableViewCell.h"
#import "HomeCloseFriendTableViewCell.h"
#import "CPUIModelManagement.h"
#import "CPUIModelMessageGroup.h"
#import "HomeInfo.h"

@protocol HomeMainViewDelegate <NSObject>

@optional
//按钮事件
-(void)goHomeController;

-(void)goPeopleController;
//跳转Im界面
-(void)goImController : (CPUIModelMessageGroup *)messageGroup :(BOOL)isProfileNeeded :(NSInteger)btnBackType;
//滑动的时候关闭或打开scroolview的scroll属性
-(void)turnOffScrollviewScrollable;

-(void)turnOnScrollviewScrollable;
//显示/隐藏顶部的图
-(void)viewOrHideTopBackground:(BOOL)isNeedHided;
//跳转到密友的联系人界面
-(void)turnToCloseFriendView;
//跳转到好友的联系人界面
-(void)turnToContactFriendController;
@end


@interface HomeMainView : UIView <HomeFriendsTableViewCellDelegate,HomeCloseFriendTableViewCellDelegate>
{
    //第一次触摸时的point
    CGPoint beginPoint;
    //当前是否在滚动
    BOOL isScrolling;
    
    UIImageView *hideBordInIMView;
}
//上部分imageview
@property (nonatomic , strong) UIImageView *imageviewUpPart;
//下部分tableview
@property (nonatomic , strong) UITableView *tableviewDownPart;

@property (nonatomic , strong) id<HomeMainViewDelegate> homeMainViewDelegate;

//tableview的背景图
@property (nonatomic , strong) UIImageView *imageviewForTableViewBG;

//根据差值来动画imageview
- (void)scaleImageviewByoffsetValue : (CGFloat)offsetValue;
-(void)recoverDeletingStatus;
@end

