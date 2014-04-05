//
//  AllFriendsViewController.h
//  AllFriends_dev
//
//  Created by ming bright on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFSectionHeaderView.h"
#import "AFTableViewCell.h"

#import "HPTopTipView.h"
#import "CustomAlertView.h"

#import "AFSectionData.h"

#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessageGroup.h"

#import "SingleIMViewController.h"
#import "MutilIMViewController.h"

// 最多能选的人数
#define kMaxCountOfSelectedFriends 19  // 19人

typedef enum{
    
    ALL_FRIENDS_STATE_NA,
    ALL_FRIENDS_STATE_PROFILE, // profle
    ALL_FRIENDS_STATE_CHAT     // 发起会话
    
}ALL_FRIENDS_STATE;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

/*
 * @入口一: 好友密友进入
 *
 * @功能: 
 * 1,直接查看个人独立profile
 * 2,模式互换，profile与发起会话 
 * 3,删除刷新
 * 4,选择互斥
 * 5,发起聊天
 *
 * @入口二: IM进入
 *
 * @功能: 
 * 1,选择互斥
 * 2,发起聊天
 * 3,屏蔽系统和群
 */


@class AFNavgationBar;
@interface AllFriendsViewController : UIViewController<
UISearchBarDelegate,
UITextFieldDelegate,
UITableViewDataSource,
UITableViewDelegate,
AFTableViewCellDelegate,
UIScrollViewDelegate,
UIAlertViewDelegate
>
{

    
    LoadingView *loadingView;
    AFNavgationBar *navBar;
    UISearchBar *frendsSearchBar;
    UITableView *frendsTableView;
    
    ALL_FRIENDS_STATE defaultState;  // 初始化的状态
    
    NSMutableArray *fullFriendArray;
    
    NSMutableArray * _headerArray;
    NSMutableArray * _sweetArray;
    NSMutableArray * _friendArray;
    NSMutableArray * _groupArray;
    
    NSMutableArray * searchedHeaderArray;
    NSMutableArray * searchedSweetArray;
    NSMutableArray * searchedFriendArray;
    NSMutableArray * searchedGroupArray;
    
    // 最终数据
    NSMutableArray *resultArray; //array element : AFSectionData
    
}

@property (nonatomic,strong) AFHeadItem *deleteItem;

@property (nonatomic,strong) CPUIModelMessageGroup *fromGroupModel;

-(id)initWithState:(ALL_FRIENDS_STATE) state_ group:(CPUIModelMessageGroup *)group_; // group_: 由群聊进入的会话

@end


