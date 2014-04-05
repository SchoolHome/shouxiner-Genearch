//
//  AddContactWithProfileViewController.h
//  iCouple
//
//  Created by yong wei on 12-4-12.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerNavigationBarControl.h"
#import "NavigationBothStyle.h"
#import "ColorUtil.h"
#import "UserProfileModel.h"
#import "FxImgBall.h"
#import "UserProfileModel.h"
#import "GeneralViewController.h"
#import "CPUIModelManagement.h"
#import "ChooseCoupleTypeViewController.h"
#import "ChooseCoupleModel.h"
#import "AddContactViewController.h"
#import "FXBlockViewSubmit.h"
#import "TImageOperator.h"
#import "StrangerHeaderImage.h"

typedef enum{
    AddFriend,
    AddCloseFriend,
    AddLover,
    AddCouple
}ContactType;

@interface AddContactWithProfileViewController : GeneralViewController<FanxerNavigationBarDelegate,FxImgBallDelegate,UserProfileModelDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,FXBlockViewSubmitDelegate,LoadingDelegate>{
    
    BOOL isFirstShow;
}

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
// 添加关系按钮
@property (strong,nonatomic) UIButton *addContactButton;
// 文字说明
@property (strong,nonatomic) UILabel *descriptionLabel;
// 用户个人信息
@property (strong,nonatomic) UserProfileModel *profileModel;
// 等待提示
@property (strong,nonatomic) UILabel *waitLabel;
// 引导提示
@property (nonatomic,strong) UILabel *guideLabel;
// 用户通讯录姓名
@property (strong,nonatomic) UILabel *fullNameLabel;
// 用户性别图片
@property (nonatomic,strong) UIImageView *sexImage;
// 初始化数据
-(id) initAddContactWithUserInfor : (UserInforModel *) userInfor;
// 返回时pop的层数
-(id) initAddContactWithUserInfor:(UserInforModel *)userInfor withPopCount : (NSUInteger) count;
@end
