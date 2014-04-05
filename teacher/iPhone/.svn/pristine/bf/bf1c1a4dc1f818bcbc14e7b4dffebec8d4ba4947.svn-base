//
//  SingleIndependentProfileViewController.h
//  iCouple
//
//  Created by qing zhang on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndependentProfileViewController.h"

@interface SingleIndependentProfileViewController : IndependentProfileViewController <UIActionSheetDelegate,UIAlertViewDelegate,MusicPlayerManagerDelegate>
{
    //头像
    HPHeadView *friendHeadIMG;
    HPHeadView *friendCoupleIMG;
    HPHeadView *friendBabyIMG;
    
    //昵称
    UILabel *friendName;
    UILabel *friendCoupleName;
    UILabel *friendBabyName;
    
    //couple标示
    UIImageView *imageviewMyCoupleFlag;
    
    //好友性别
    UIImageView *imageviewfriendSex;
    
    //当前关系文案
    UILabel *currentRelationText;
    //改变关系
    UIButton *changeRelation;
    //判断改变好友关系归属于谁的
    NSString *userName;
    
    //近况背景图
    UIImageView *imageviewRecentBG;
}
@property (nonatomic) BOOL fromCoupleHeadPush;
-(id)initWithUserInfo:(CPUIModelUserInfo *)userInfo;

-(id)initWithUserInfoFromIM:(CPUIModelUserInfo *)userInfo;
@end
