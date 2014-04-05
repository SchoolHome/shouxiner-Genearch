//
//  GroupProfileView.h
//  iCouple
//
//  Created by qing zhang on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"
#import "GroupProfileTableViewCell.h"
#import "CPUIModelManagement.h"
#import "Reachability.h"
#import "HPTopTipView.h"
#import "GroupUserItemView.h"

#define GroupPicNameWithStatusDic @"groupPicNameDic"
#define GroupIdWithNameDic @"groupIdDic"
#define PicturenUsed 1
#define PictureUnUsed 2


#define SetGroupNameViewTag 1001
#define TableViewTag 1002
#define TextfiledGroupNameTag 1003
#define WaringTextLabelTag 1004
#define WaringImgTag 1005
#define LabelGroupNameTag 1006
#define ButtonChangeGroupNameTag 1007
#define btnSaveToGroupTag 1008
#define TextfiledChangeGroupNameTag 1009
#define imageviewTextfiledBGTag 1010
#define GroupNameLabelTag 1011
#define LabelTextRenTag 1012
#define LabelTextGroupMemberNumberTag 1013
#define LabelTextFirstMemberTag 1014
#define LabelTextSecondMemberTag 1015
#define LabelTextThirdMemberTag 1016

@protocol GroupProfileScrollViewDelegate <NSObject>

-(void)touchInScrollView;

@end

@protocol GroupProfileViewDelegate <NSObject>
@optional
-(void)turnToGroupindependentProfile:(CPUIModelMessageGroup *)msgGroup;
-(void)turnToIndependentProfileView:(CPUIModelUserInfo *)memberUserInfo;
-(void)turnToCoupleProfileView;
-(void)turnToContactProfileDelegate : (CPUIModelUserInfo *)userInfo;
//退群
-(void)quitGroup:(CPUIModelMessageGroup *)messageGroup;
//删除群成员
-(void)deleteGroupMember:(CPUIModelMessageGroup *)messageGroup andMemberArr:(NSArray *)memberArr;
//添加群
-(void)addFavoriteGroup:(CPUIModelMessageGroup *)messageGroup andGroupName : (NSString *)groupName;
//修改群名
-(void)modifyFavoriteGroupName:(CPUIModelMessageGroup *)messageGroup andGroupName: (NSString *)groupName;
@end

@interface GroupProfileView : ProfileView <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,GroupProfileScrollViewDelegate,UIAlertViewDelegate,GroupUserItemViewDelegate>
{
//    UIImageView *imageviewTextfiledBG;
    
}

@property (nonatomic ) NSInteger profiletype; //profile类型
@property (nonatomic , strong)CPUIModelMessageGroup *modelMessageGroup; 
@property (nonatomic , strong)NSMutableDictionary *groupMembers; //groupMember字典,key是row ,value是member
@property (nonatomic , strong)UIView *imageviewMemberNameBG; //群名的背景图
@property (nonatomic , assign) id<GroupProfileViewDelegate> groupProfileDelegate;
- (id)initWithFrame:(CGRect)frame andProfileType : (NSInteger)type andModelMessageGroup : (CPUIModelMessageGroup *)messageGroup;
//恢复删除状态
-(void)recoverGroupPrifleDeleteStatus;
//多人会话转成群
-(void)changeMutilToGroup;
//刷新群profile内容
-(void)refreshGroupProfileContent;
//关闭创建群名窗口
-(void)closeView;
@end
@protocol GroupProfileTableViewDelegate <NSObject>



@end
@interface GroupProfileTableView : UITableView
@property (nonatomic , assign) id<GroupProfileTableViewDelegate> groupProfileTableViewDelegate;
@end




@interface GroupProfileScrollView : UIScrollView
@property (nonatomic , assign) id<GroupProfileScrollViewDelegate> groupProfileScrollDelegate;
@end
