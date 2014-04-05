//
//  UserProfileModel.h
//  iCouple
//
//  Created by yong wei on 12-4-13.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUIModelManagement.h"
#import "CPUIModelContactWay.h"
#import "CPUIModelUserInfo.h"
#import "UserInforModel.h"

@protocol UserProfileModelDelegate <NSObject>

@optional
// 加载数据完成回调
// msg为Dictionary对象 error and errormessage
-(void) loadPersonProfileDataCompleted : (id) msg;
@end

@interface UserProfileModel : NSObject{
    
}
// 个人用户信息
@property (strong,nonatomic) UserInforModel *personalUserInfor;
// 个人用户朋友信息
@property (strong,nonatomic) NSMutableArray *userFriendInfor;
// 个人用户model委托
@property (assign, nonatomic) id<UserProfileModelDelegate> delegate;

+(UserProfileModel *) sharedInstance;

// 加载用户个人信息
-(void) loadUserProfileInfor : (UserInforModel *) userInfor;

@end
