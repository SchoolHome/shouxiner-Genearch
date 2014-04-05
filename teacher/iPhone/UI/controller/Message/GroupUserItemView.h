//
//  GroupUserItemView.h
//  iCouple
//
//  Created by shuo wang on 12-7-20.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelUserInfo.h"

@class GroupUserItemView;

@protocol GroupUserItemViewDelegate <NSObject>
@optional
-(void) clickGroupUserItem : (GroupUserItemView *) item;
-(void) longPressGroupUserItem : (GroupUserItemView *) item;
@end

@interface GroupUserItemView : UIView
// 昵称
@property(nonatomic,strong) UILabel *userNickName;
// key
@property(nonatomic,strong) NSString *key;
// 是否是删除状态
@property(nonatomic) BOOL isDel;
// delegate
@property(nonatomic,assign) id<GroupUserItemViewDelegate> delegate;
@property(nonatomic,strong) CPUIModelMessageGroupMember *member;
@property(nonatomic,strong) UIButton *delButton;

-(id) initGroupUserItem : (CPUIModelMessageGroupMember *) groupMember;
-(void) hiddenDelButton;
-(void) showDelButton;
@end

