//
//  AddContactAnswerViewController.h
//  iCouple
//
//  Created by shuo wang on 12-6-7.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerNavigationBarControl.h"
#import "NavigationBothStyle.h"
#import "UserProfileModel.h"
#import "CPUIModelManagement.h"
#import "FxImgBall.h"
#import "TImageOperator.h"
#import "ColorUtil.h"
#import "ExMessageModel.h"
#import "AddContactWithProfileViewController.h"
#import "CustomAlertView.h"
#import "HPTopTipView.h"
#import "HomePageViewController.h"
#import "StrangerHeaderImage.h"
@interface AddContactAnswerViewController : UIViewController<FanxerNavigationBarDelegate,FxImgBallDelegate,UserProfileModelDelegate,LoadMessageDelegate>

// 凡想NavigationBar
@property (strong,nonatomic) FanxerNavigationBarControl *fnav;
// 头部背景imageview
@property (strong,nonatomic) UIImageView *topBGImage;
// 透明背景
@property (strong,nonatomic) UIImageView *transparentBGImage;
// 个人用户头像
@property (strong,nonatomic) FxImgBall *personalHeadImg;
// 用户姓名
@property (strong,nonatomic) UILabel *nickName;
// 文字说明
@property (strong,nonatomic) UILabel *descriptionLabel;
// 用户个人信息
@property (strong,nonatomic) UserProfileModel *profileModel;
// 用户通讯录姓名
@property (strong,nonatomic) UILabel *fullNameLabel;
// 描述 -- “想加你为”
@property (strong,nonatomic) UILabel *textLabel;
// 描述 －－ “好友，情侣，夫妻”
@property (strong,nonatomic) UILabel *contentLabel;

// 引导提示
@property (nonatomic,strong) UILabel *guideLabel;
// 用户性别图片
@property (nonatomic,strong) UIImageView *sexImage;
// 初始化数据
-(id) initAddContactWithUserInfor : (ExMessageModel *) exModel;
@end
