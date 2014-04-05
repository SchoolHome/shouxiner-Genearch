//
//  BBMemberInMsgGroupTableViewCell.h
//  teacher
//
//  Created by ZhangQing on 14-3-24.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelUserInfo.h"
@interface BBMemberInMsgGroupTableViewCell : UITableViewCell
//姓名
@property (nonatomic , strong) UILabel *userNameLabel;
//头像
@property (nonatomic , strong) UIImageView *userHeadImageView;

-(void)setUserInfo:(CPUIModelUserInfo *)userInfo;
@end
