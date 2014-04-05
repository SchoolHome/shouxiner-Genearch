//
//  CPUserManager.h
//  icouple
//
//  Created by yong wei on 12-3-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPHttpEngineObserver.h"

@class CPDBModelUserInfo;
@interface CPUserManager : NSObject<CPHttpEngineObserver>

@property (nonatomic,strong) NSString *responseActionUserName;

-(void)initUserList;
-(void)initUserCommendList;
-(void)addUserCommendListWithUserID:(NSNumber *)userID;
-(void)initSysUserConver;

-(void)getFriendsCommend;
-(void)getFriendsWithTimeStamp:(NSString *)timeStamp;
-(void)modifyFriendTypeWithCategory:(NSInteger) category andUserName:(NSString *)userName andInviteString:(NSString *)inviteString andCouldExpose:(BOOL)couldExpose;
-(void)inviteFriendWithCategory:(NSInteger) category andMobile:(NSString *)mobile andCouldExpose:(BOOL)couldExpose;
-(void)answerRequestWithReqID:(NSString *)reqID andFlag:(NSInteger)flag andContextObj:(NSObject *)contextObj;
-(void)breakFriendRelationWithUserName:(NSString *)userName;
-(void)getFriendsMutualWithFriName:(NSString *)friUserName;
-(void)getUserWithMobiles:(NSArray *)mobileArray;
-(void)getMyProfile;
-(void)getUserProfileWithUserName:(NSString *)userName;
-(void)getMyRecentInfo;
-(void)updateMyRecentInfoWithContent:(NSString *)content andType:(NSInteger)type;
-(void)getUserRecentWithUserName:(NSString *)userName;
-(void)setSingleTimeWithDate:(NSDate *)singleTime andRelationType:(NSNumber *)relationType;
-(void)updatePersonalWithNickName:(NSString *)nickName andSex:(NSNumber *)sex andHiddenBaby:(NSNumber *)isHiddenBaby;
-(void)removeBaby;

-(NSArray *)getAllContacts;
-(NSArray *)getAllContactsByFilter;
-(NSArray *)getAllContactsByFriendsFilter;


-(void)refreshUserInfosCachedUiWithUser:(CPDBModelUserInfo *)dbUserInfo;
-(void)refreshCoupleModelWithUser:(CPDBModelUserInfo *)dbUserInfo;

@end
