//
//  AllFriendsViewController+Data.h
//  iCouple
//
//  Created by ming bright on 12-8-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AllFriendsViewController.h"

@interface AllFriendsViewController (Data)

// 查看profile时，数据和状态
- (void)fillDefaultData;
- (void)fillDefaultState;

// 群聊加人进入时，数据和状态
- (void)fillFilterData;
- (void)fillFilterState:(NSArray *) groupMemberArray; // @element: CPUIModelMessageGroupMember

- (void)searchWithSearchStr:(NSString *)searchText;

// 互斥逻辑
- (void)filterLogic:(AFHeadItem *) item;

@end
