//
//  AFHeadItem.h
//  AllFriends_dev
//
//  Created by ming bright on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+DebugRect.h"
#import "AFSectionData.h"


// 按钮通知
#define kAFHeadItemLongPressNotification @"AFHeadItemLongPressNotification"
#define kAFHeadItemTapNotification       @"AFHeadItemTapNotification"
#define kAFHeadItemDeleteTapNotification @"AFHeadItemDeleteTapNotification"

// 3种不同类型角色，用于选中状态管理
#define kAFHeadStatePrefixSystem         @"system_"
#define kAFHeadStatePrefixUser           @"user_"
#define kAFHeadStatePrefixGroup          @"group_"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@protocol AFHeadItemDelegate;
@interface AFHeadItem : UIView
{
    
    id<AFHeadItemDelegate> __weak _delegate;
    
    id _headItemData;
    
    AFIndexPath *_indexPath;
    AFHeadState *_headState;

    UIButton *_headButton;          // 头像按钮
    UIButton *_deleteButton;        // 删除按钮
    UIImageView *_checkedImageView; // 选中状态
    UILabel *_nameLabel;            // 昵称
    
    BOOL _selected;

}

@property(nonatomic,weak) id delegate;
@property(nonatomic,strong) id headItemData;
@property(nonatomic,strong) AFIndexPath *indexPath;
@property(nonatomic,strong) AFHeadState *headState;
@property (nonatomic, assign) BOOL selected;

- (void)setSelected:(BOOL)selected_; // 选中

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@protocol AFHeadItemDelegate <NSObject>
//
@end
