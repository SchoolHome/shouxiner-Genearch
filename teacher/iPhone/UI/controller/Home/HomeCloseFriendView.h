//
//  HomeCloseFriendView.h
//  iCouple
//
//  Created by qing zhang on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeMainView.h"

@protocol HomeCloseFriendTableViewDelegate <NSObject>

-(void)tableviewTouchBegan;

@end

@interface HomeCloseFriendView : HomeMainView <UITableViewDelegate , UITableViewDataSource,HomeCloseFriendTableViewDelegate>
{
    //密友墙不需要刷新数据，既是有新数据，拨动tableview的时候
    BOOL closeFriendViewNotNeedRefreshData;
}

//右上角的button,进入到大家界面和取消删除切换
@property (nonatomic , strong) UIButton *btnPeopleAndDelete;

-(void)beginBreakIcePageView;
-(void)endBreakIcePageView;
//密友墙重置状态
-(void)beignChangeDeleteStatusFromCloseFriend:(BOOL)deleteOrRecorver;
@end




@interface HomeCloseFriendTableView : UITableView
@property (nonatomic , assign) id<HomeCloseFriendTableViewDelegate> homeCloseFriendTableviewDelegate;
@end

