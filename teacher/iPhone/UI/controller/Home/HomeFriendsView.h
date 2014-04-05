//
//  HomeFriendsView.h
//  iCouple
//
//  Created by qing zhang on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeMainView.h"
@protocol HomeFriendsTableViewDelegate <NSObject>
-(void)friendTableviewTouch;

@end

@interface HomeFriendsView : HomeMainView <UITableViewDelegate,UITableViewDataSource,HomeFriendsTableViewDelegate>

{
    BOOL friendViewNotNeedRefreshData;
}
//右上角的button,进入到大家界面和取消删除切换
@property (nonatomic , strong) UIButton *btnPeopleAndDelete;
-(void)recoverDeletingStatus;
-(void)beginBreakIcePageView;
-(void)endBreakIcePageView;
@end


@interface HomeFriendsTableView : UITableView
@property (nonatomic , assign) id<HomeFriendsTableViewDelegate> homeFriendsTableviewDelegate;
@end