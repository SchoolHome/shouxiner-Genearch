//
//  ProfileView.h
//  iCouple
//
//  Created by qing zhang on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//上部分隐藏区域
#define upHidedPartInStatusMid 50.f
//底部隐藏区域
#define bottomHidedPartInStatusMid 30.f
//背景图大小
#define imageviewUpBGInStatusMid 150.f
#define CGRect_imageviewBGInMainViewInStatusMid CGRectMake(0, -50, 320, imageviewUpBGInStatusMid+upHidedPartInStatusMid+bottomHidedPartInStatusMid)
#define CGRect_imageviewBGInMainViewInStatusDown CGRectMake(0, 0, 320, imageviewUpBGInStatusMid+upHidedPartInStatusMid+bottomHidedPartInStatusMid)
#define buttonViewHeight 50.f
#define imageviewContentBGHeight 230.f
//+按钮
#define CGRect_btnPlus CGRectMake(27.f, 4.f, 107.f, 36.5f)
//调整关系和保存按钮
#define CGRect_changeRelationAndSave CGRectMake(186.5f, 4.f, 106.5f, 36.5f)
//树的大小
#define CGRect_imageviewTree CGRectMake(320-146.f-7.5f, 4.f, 146.f, 417.5f)
//近况
//352,168
#define CGRect_recent CGRectMake(320-19-176, 60.f, 176.f, 84.f)
//群输入框背景
#define CGRect_imageviewTextfiledBG CGRectMake(141.5f, 5.5f, 168.5f, 34.f)

//输入框
#define CGRect_textfiled CGRectMake(10.f, 6.0f, 148.5f, 20.f)
//tableview
#define CGRect_tableview CGRectMake(0.f, 0.f, 320.f, 211)
//组员名字背景图
#define CGRect_imageviewMemberNameBG CGRectMake(200.f, 0.f, 120.f, 150.f)
#import <UIKit/UIKit.h>
#import "CPUIModelMessageGroup.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelManagement.h"
@protocol ProfileViewDelegate <NSObject>

@optional
-(void)addFriendInFriendViewController;
@end
typedef enum
{
    Profile_Type_Single = 1,
    Profile_Type_Couple = 2,
    Profile_Type_Group = 3,
    Profile_Type_Mutil = 4,
    Profile_Type_xiaoshuang = 5,
    Profile_Type_shuangTeam = 6
}Profile_Type;
@interface ProfileView : UIView
{

}
//profile中未读数
@property (nonatomic)NSInteger unReadedMsgNumber;
//上部分背景图
@property (nonatomic , strong)UIImageView *imageviewBGInMainView;
//中间放按钮的透明层
@property (nonatomic , strong)UIView *buttonView;
//下部分背景图
@property (nonatomic , strong)UIView *viewContentBG;
@property (nonatomic , assign)id<ProfileViewDelegate> profileViewDelegate;
- (id)initWithFrame:(CGRect)frame andProfileType : (NSInteger)type andModelMessageGroup : (CPUIModelMessageGroup *) messageGroup;

-(void)tapByController;
@end
