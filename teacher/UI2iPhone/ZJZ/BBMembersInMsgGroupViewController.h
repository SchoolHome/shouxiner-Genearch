//
//  BBMembersInMsgGroupViewController.h
//  teacher
//
//  Created by ZhangQing on 14-3-24.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmViewController.h"

@interface BBMembersInMsgGroupViewController : PalmViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong)NSArray *members;

-(void)setMembers:(NSArray *)members andMsgGroup:(CPUIModelMessageGroup *)messageGroup;
@end
