//
//  UserProfileModel.m
//  iCouple
//
//  Created by yong wei on 12-4-13.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "UserProfileModel.h"

@implementation UserProfileModel
@synthesize personalUserInfor = _personalUserInfor , userFriendInfor = _userFriendInfor , delegate = _delegate;

static UserProfileModel *sharedInstance = nil;

+(UserProfileModel *) sharedInstance{
    if (sharedInstance == nil)
    {
        sharedInstance = [[super alloc] init];
    }
    
    return sharedInstance;
}

-(id) init{
    self = [super init];
    
    if (self) {
        [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"findMutualFriendDic" options:0 context:@"findMutualFriendDic"];
    }
    
    return self;
}

// 加载个人数据
-(void) loadUserProfileInfor:(UserInforModel *)userInfor{
    self.personalUserInfor = userInfor;
    
    if (![[CPUIModelManagement sharedInstance] canConnectToNetwork]) {
        if ([CPUIModelManagement sharedInstance].sysOnlineStatus != SYS_STATUS_ONLINE) {
            if ([self.delegate respondsToSelector:@selector(loadPersonProfileDataCompleted:)]) {
                NSDictionary *errorDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"当前未连接网络，请联网后重试" , @"200" , nil];
                [self.delegate loadPersonProfileDataCompleted:errorDic];
                return;
            }
        }
    }else {
        CPLogInfo(@"----------获得共同好友-------用户userName：%@----------",userInfor.userName);
        if ( nil == userInfor.userName || [userInfor.userName isEqualToString:@""]) {
            CPLogInfo(@"----------获得共同好友-------用户userName is nil!!error,function is exit!!");
            return;
        }
        [[CPUIModelManagement sharedInstance] findMutualFriendsWithUserName:userInfor.userName];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    // 服务端处理任务完成
    if ([keyPath isEqualToString:@"findMutualFriendDic"]) {
        id code;
        NSDictionary *errorDic;
        
        // 获取code
        if ( ( code = [[CPUIModelManagement sharedInstance].findMutualFriendDic objectForKey:find_friend_mutual_res_code] ) != nil) {
            // 如果code是成功
            if ( [code intValue] == RESPONSE_CODE_SUCESS) {
                id value = [[CPUIModelManagement sharedInstance].findMutualFriendDic objectForKey:find_friend_mutual_data];
                NSArray *array;
                array = (NSArray *)value;
                if (nil == value || [value count] == 0) {
                    array = [[NSArray alloc] init];
                }
                CPLogInfo(@"---------------用户的共同好友数量是：%d人------------------",[array count]);
                errorDic = [[NSDictionary alloc] initWithObjectsAndKeys: array , @"1" , nil];
            }else {
                // 获取数据失败
                errorDic = [[NSDictionary alloc] initWithObjectsAndKeys: [[CPUIModelManagement sharedInstance].findMutualFriendDic objectForKey:find_friend_mutual_res_desc] , @"200" , nil];
                CPLogInfo(@"%@" , [[CPUIModelManagement sharedInstance].findMutualFriendDic objectForKey:find_friend_mutual_res_desc]);
            }
        }
        
        // 通知controller
        if ([self.delegate respondsToSelector:@selector(loadPersonProfileDataCompleted:)]) {
            [self.delegate loadPersonProfileDataCompleted:errorDic];
            return;
        }
    }
}

-(void) dealloc{
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"findMutualFriendDic" context:@"findMutualFriendDic"];
}

@end
