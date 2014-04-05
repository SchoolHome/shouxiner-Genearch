//
//  ContactsStartGroupChatViewController.h
//  teacher
//
//  Created by ZhangQing on 14-3-21.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmViewController.h"
#import "StartGroupChatTableviewCell.h"
#import "BBMessageGroupBaseTableView.h"
#import "DisplaySelectedMemberView.h"
@interface ContactsStartGroupChatViewController : PalmViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,BBMessageGroupBaseTableViewDelegate,StartGroupChatTableviewCellDelegate,DisplaySelectedMemberViewDelegate>
@property (nonatomic , strong) NSMutableArray *selectedItemsArray;//选中的array
@property (nonatomic , strong) CPUIModelMessageGroup *msgGroup;
//-(void)setAddMemberInExistMsgGroup:(NSMutableArray *)selectedArray;
-(void)filterExistUserInfo : (BOOL)isGroup WithSelectedArray:(NSArray *)userInfos;
@end
