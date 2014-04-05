//
//  StartGroupChatTableviewCell.h
//  teacher
//
//  Created by ZhangQing on 14-3-21.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelUserInfo.h"

@protocol StartGroupChatTableviewCellDelegate <NSObject>
@optional
-(void)itemIsSelected:(CPUIModelUserInfo *)userInfo
         andIndexPath:(NSIndexPath *)indexPath;
@end

@interface StartGroupChatTableviewCell : UITableViewCell
//姓名
@property (nonatomic , strong) UILabel *userNameLabel;
//头像
@property (nonatomic , strong) UIImageView *userHeadImageView;
//model
@property (nonatomic , strong) CPUIModelUserInfo *model;
//selectedBtn
@property (nonatomic , strong) UIButton *selectedBtn;
@property (nonatomic ,assign) id<StartGroupChatTableviewCellDelegate> delegate;
@property (nonatomic , strong) NSIndexPath *currentIndexPath;

@end
