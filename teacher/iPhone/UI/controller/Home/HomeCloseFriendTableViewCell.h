//
//  HomeCloseFriendTableViewCell.h
//  iCouple
//
//  Created by qing zhang on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelMessageGroup.h"
#define UnCloseFriendReadMessageNumberTag 101
#define imageviewUserImgTag 102
#define messageAlertImgInUserImgTag 103
#define labelUserNameTag 104
#define cellContentViewTag 105
#define btnCloseFriendDelTag 106
@protocol HomeCloseFriendTableViewCellDelegate <NSObject>
@optional
//删除cell
-(void)deleteRowBymessageGroup:(CPUIModelMessageGroup *)messageGroup;

//切换到删除状态
-(void)beignChangeDeleteStatusFromCloseFriend:(BOOL)deleteOrRecorver;
//进入im界面
-(void)gotoIMViewControllerFromFriends : (CPUIModelMessageGroup *)messageGroup;
@end

@interface HomeCloseFriendTableViewCell : UITableViewCell
{
    BOOL isMoved;
}
//每一个头像的区域
//@property (nonatomic , strong) UIView *viewBG;
//记录cell的index
@property (nonatomic , strong) NSIndexPath *indexPathRow;
//cell中4个view的数组
@property (nonatomic , strong) NSMutableArray *cellSubviews;
////用户头像
//@property (nonatomic , strong) UIImageView *imageviewUserImg;
////用户名字
//@property (nonatomic , strong) UILabel *labelUserName;
////群人数
//@property (nonatomic , strong) UILabel *labelUserMemberListNumber;
////消息提示
//@property (nonatomic , strong) UIImageView *messageAlertImgInUserImg;

//delegate
@property (nonatomic , assign) id<HomeCloseFriendTableViewCellDelegate> closeFriendDelegate;

//为cell填充内容
-(void)setContent:(NSIndexPath *)indexpath messageGroup : (NSMutableArray *)messageGroups;
//删除密友
-(void)removeCloseFriend:(UIButton *)sender;
//通过标示返回MessageGroup
-(CPUIModelMessageGroup *)returnMessageGroup : (NSInteger)tag;

@end
