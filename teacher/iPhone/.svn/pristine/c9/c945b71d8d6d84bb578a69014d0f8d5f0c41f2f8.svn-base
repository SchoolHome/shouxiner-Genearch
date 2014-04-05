//
//  HomeFriendsTableViewCell.h
//  iCouple
//
//  Created by qing zhang on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelMessageGroup.h"
#import "ImageUtil.h"
#define UnReadMessageNumberTag 10001

@protocol HomeFriendsTableViewCellDelegate <NSObject>

@optional
//删除cell
-(void)deleteRowBymessageGroup:(CPUIModelMessageGroup *)messageGroup;
//取消删除
-(void)recoverDeletingStatus;
//切换到删除状态
-(void)beignDeleteStatusFromFriend;
//进入im界面
-(void)gotoIMViewControllerFromFriends : (CPUIModelMessageGroup *)messageGroup;
//打开scrollview
-(void)openScrollable;
//关闭scrollview
-(void)closeScrollable;
@end
@interface HomeFriendsTableViewCell : UITableViewCell
{
    //记录每一个cell的indexpath
    NSIndexPath* indexpathInCell;
    //判断是否长按手势结束
    BOOL isLongPressing;
    
    UIImageView *imageviewUserImgShadow;
}
@property (nonatomic) NSUInteger msgGroupId;
//左边用户头像
@property (nonatomic , strong) UIImageView *imageviewUserImg;

//左边用户头像上提示信息框
@property (nonatomic , strong) UIImageView *imageviewMessageAlert;
//提示信息框中的文字（当信息>2时）
@property (nonatomic , strong) UILabel *messagesNumberInAlertImageview;
//右边用户姓名
@property (nonatomic , strong) UILabel *userName;
//如果是群显示几人
@property (nonatomic , strong) UILabel *userGroupNumber;
//右边用户信息
@property (nonatomic , strong) UILabel *userMessage;
//右边接收信息时间
@property (nonatomic , strong) UILabel *messagedDate;
@property (nonatomic , strong) NSString *messageReceivedDate;
//右边背景图
@property (nonatomic , strong) UIButton *imageviewBG;
//右边删除按钮 (删除状态下出现)
@property (nonatomic , strong) UIButton *btnDelete;
//右边删除状态时的view (灰色背景含删除按钮)
@property (nonatomic , strong) UIView *bgViewWhenDeleting;

@property (nonatomic , assign) id<HomeFriendsTableViewCellDelegate> homeFriendsTableViewCellDelegate;
@property (nonatomic , strong) CPUIModelMessageGroup *modelMessageGroup;
//当不需要刷新时为cell填充内容
-(void)setContentWhenfriendViewNotNeedRefreshData:(NSIndexPath *)indexpath modelMessageGroup:(CPUIModelMessageGroup *)messageGropu;
//为cell填充内容
-(void)setContent:(NSIndexPath *)indexpath modelMessageGroup:(CPUIModelMessageGroup *)messageGropu;

-(void)changeTextColor;
@end
