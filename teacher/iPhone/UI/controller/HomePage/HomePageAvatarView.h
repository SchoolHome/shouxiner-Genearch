//
//  HomePageAvatarView.h
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPHeadView.h"

enum{
    AvatarButtonSelf,
    AvatarButtonBaby,
    AvatarButtonCouple
};

@class AvatarButton;
@class NicknameLabel;

@protocol HomePageAvatarViewDelegate;

@interface HomePageAvatarView : UIView
{
    HPHeadView *avatarSelf;
    HPHeadView *avatarCouple;
    HPHeadView *avatarBaby;
    
}

@property (nonatomic,assign) id<HomePageAvatarViewDelegate> delegate;
// 刷新头像布局
-(void)layoutAvatars;
@end

@protocol HomePageAvatarViewDelegate <NSObject>
-(void)avatarTaped:(AvatarButton *)sender;
@end


@interface NicknameLabel : UILabel
@end
/////////////////////////////////////////////////////////////////////////