//
//  CPHttpEngine.h
//  Couple
//
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProtocolModelDefines.h"
#import "CPHttpEngineObserver.h"

#import "XMPPUserMessage.h"
#import "XMPPGroupMessage.h"

typedef enum
{
    K_RESOURCE_CATEGORY_SELFICON = 1,
    K_RESOURCE_CATEGORY_COUPLEICON = 2,
    K_RESOURCE_CATEGORY_BABYICON = 3,
    K_RESOURCE_CATEGORY_BACKGROUND = 4,
    K_RESOURCE_CATEGORY_MESSAGE_PIC = 5,
    K_RESOURCE_CATEGORY_MESSAGE_AUDIO = 6,
    K_RESOURCE_CATEGORY_MESSAGE_VIDEO = 7,
    K_RESOURCE_CATEGORY_MESSAGE_OTHER = 8,
    K_RESOURCE_CATEGORY_GROUP_MESSAGE_PIC = 9,
    K_RESOURCE_CATEGORY_GROUP_MESSAGE_AUDIO = 10,
    K_RESOURCE_CATEGORY_GROUP_MESSAGE_VIDEO = 11,
    K_RESOURCE_CATEGORY_GROUP_MESSAGE_OTHER = 12,
    K_RESOURCE_CATEGORY_RECENT_AUDIO = 101,
    //
}CPResourceCategory;

typedef enum
{
    K_FRIEND_CATEGORY_NORMAL = 1,
    K_FRIEND_CATEGORY_LOVER = 2,
    K_FRIEND_CATEGORY_CLOSER = 3,
    K_FRIEND_CATEGORY_COUPLE = 4,
    K_FRIEND_CATEGORY_CRUSH = 5,
}CPFriendCategory;

@interface CPHttpEngine : NSObject
{
    BOOL isLogout;
}

#pragma -
#pragma mark observer op
//--------------------------------------------------------------------------------------------------
//observer rltd op.
//--------------------------------------------------------------------------------------------------
- (void) registerObserver:(id<CPHttpEngineObserver>) observer;
- (void) deRegisterObserver:(id<CPHttpEngineObserver>) observer;

- (void) addObserver:(id<CPHttpEngineObserver>) observer;
- (void) removeObserver:(id<CPHttpEngineObserver>) observer;

#pragma -
#pragma mark account op
//--------------------------------------------------------------------------------------------------
//account op.
//--------------------------------------------------------------------------------------------------

- (void) registerAccountForModule:(Class)clazz
             WithUserRegisterInfo:(CPPTModelUserRegisterInfo *) userInfo;

- (void) sendVerifyCodeForModule:(Class)clazz
                    withPhoneNum:(NSString *)phoneNum
                    andPhoneArea:(NSString *)phoneArea
                   andVerifyCode:(NSString *)verifyCode;

//绑定手机号，服务器给绑定的号发送验证码。
- (void) bindPhoneNumForModule:(Class)clazz
                  withPhoneNum:(NSString *)phoneNum
                  andPhoneArea:(NSString *)phoneArea;

- (void) loginForModule:(Class)clazz
           WithUserName:(NSString *)userName
            andPassword:(NSString *)password;

- (void) logoutForModule:(Class)clazz withDeviceToken:(NSString *) deviceToken;

- (void) searchUserForModule:(Class)clazz
                withPhoneNum:(NSString *)phoneNum
                andPhoneArea:(NSString *)phoneArea;

- (void) searchUserForModule:(Class)clazz
                withUserName:(NSString *)uName;

- (void) bindCoupleForModule:(Class)clazz
                    withName:(NSString *)name
                 andPhoneNum:(NSString *)phoneNum
                andPhoneArea:(NSString *)phoneArea;

//找回密码(提交请求，获取手机验证码)
- (void) retrieveVerifyCodeForModule:(Class)clazz
                      withUserName:(NSString *)uName
                       andPhoneNum:(NSString *)phoneNum
                      andPhoneArea:(NSString *)phoneArea;

//找回密码(提交手机验证码和新密码)
- (void)resetPasswordForModule:(Class)clazz
                  withUserName:(NSString *)uName
                   andPhoneNum:(NSString *)phoneNum
                  andPhoneArea:(NSString *)phoneArea
                  andPasssword:(NSString *)passwd
                 andVerifyCode:(NSString *)verifyCode;

//修改密码
- (void)changePasswordForModule:(Class)clazz
                withOldPassword:(NSString *)oldPassword
                 andNewPassword:(NSString *)newPassword;

- (void) getUsersByPhonesForModule:(Class)clazz
                withContactWayList:(CPPTModelContactWayList *)contactWays;

- (void) updateDeviceTokenForModule:(Class)clazz
                    withDeviceToken:(NSString *)deviceToken;

#pragma -
#pragma mark relation op
//--------------------------------------------------------------------------------------------------
//relation op.
//--------------------------------------------------------------------------------------------------
- (void) uploadContactInfosForModule:(Class)clazz
                    withContactInfos:(CPPTModelContactInfos *)contactInfos;

- (void) getUsersKnowMeForModule:(Class)clazz;

- (void) getMyFriendsForModule:(Class)clazz
                 withTimeStamp:(NSString *)timeStamp;

- (void) addFriendForModule:(Class)clazz
             friendCategory:(CPFriendCategory)frdCategory
               withUserName:(NSString *)uName
            andInviteString:(NSString *)inviteString
             andCouldExpose:(NSNumber *)couldExpose;

- (void) inviteFriendForModule:(Class)clazz
                friendCategory:(CPFriendCategory)frdCategory
                  withPhoneNum:(NSString *)phoneNum
                  andPhoneArea:(NSString *)phoneArea
                andCouldExpose:(NSNumber *)couldExpose;

- (void) answerRequestForModule:(Class)clazz
                    ofRequestId:(NSString *)reqId
                 withAcceptFlag:(NSNumber *)accept
                  andContextObj:(NSObject *)contextObj;

- (void) breakFriendRelationForModule:(Class)clazz
                             withUser:(NSString *)uName;

- (void) getMutualFriendsForModule:(Class)clazz
                          withUser:(NSString *)uName;

#pragma -
#pragma mark res op
//--------------------------------------------------------------------------------------------------
//res op.
//--------------------------------------------------------------------------------------------------

- (void) downloadResourceOf:(NSNumber *)resourceID
                  forModule:(Class)clazz
                       from:(NSString *)remoteURL
                     toFile:(NSString *)filePath;

- (void) downloadPetResOf:(NSString *)resID
                  forModule:(Class)clazz
                       from:(NSString *)remoteURL
                     toFile:(NSString *)filePath
              andContextObj:(NSObject *)contextObj;

- (void) uploadResourceOf:(NSNumber *)resourceID
                forModule:(Class)clazz
         resrouceCategory:(CPResourceCategory)resCategory
                 fromFile:(NSString *)fileName
                 mimeType:(NSString *)mimeType;

#pragma -
#pragma mark address book op
//--------------------------------------------------------------------------------------------------
//address book op.
//--------------------------------------------------------------------------------------------------

//another way++
#if 0
typedef void (^PicOpCompletionBlock)(NSString *twitPicURL);

-(MKNetworkOperation*) uploadImageFromFile:(NSString*) file 
                              onCompletion:(PicOpCompletionBlock) completionBlock
                                   onError:(MKNKErrorBlock) errorBlock;
#endif
//another way--

#pragma -
#pragma mark groupChat op
//--------------------------------------------------------------------------------------------------
//groupChat op.
//--------------------------------------------------------------------------------------------------

- (void)createGroupForModule:(Class)clazz
                withMembers:(NSArray *)membersArray
               andContextObj:(NSObject *)contextObj;

- (void)getGroupInfoForModule:(Class)clazz ofGroup:(NSString *)groupJID;

- (void)addGroupMembersForModule:(Class)clazz
                         ofGroup:(NSString *)groupJID
                     withMembers:(NSArray *)membersArray
                   andContextObj:(NSObject *)contextObj;

- (void)removeGroupMembersForModule:(Class)clazz
                            ofGroup:(NSString *)groupJID
                        withMembers:(NSArray *)membersArray
                      andContextObj:(NSObject *)contextObj;

- (void)quitGroupForModule:(Class)clazz fromGroup:(NSString *)groupJID;

- (void)addFavoriteGroupForModule:(Class)clazz
                        withGroup:(NSString *)groupJID
                     andGroupName:(NSString *)groupName
                    andContextObj:(NSObject *)contextObj;

- (void)getFavoriteGroupsForModule:(Class)clazz withTimeStamp:(NSString *)timeStamp;

- (void)modifyFavoriteGroupNameForModule:(Class)clazz
                                 ofGroup:(NSString *)groupJID
                           withGroupName:(NSString *)groupName
                           andContextObj:(NSObject *)contextObj;

- (void)removeGroupFromFavoriteForModule:(Class)clazz dstGroup:(NSString *)groupJID;

#pragma -
#pragma mark profile op
//--------------------------------------------------------------------------------------------------
//profile op.
//--------------------------------------------------------------------------------------------------
- (void)getMyProfileForModule:(Class)clazz withTimeStamp:(NSString *)timeStamp;

- (void) updateMyNicknameAndGenderForModule:(Class)clazz
                               withNickname:(NSString *)nickname
                                  andGender:(NSNumber *)gender
                                andHideBaby:(NSNumber *)hideBaby;

- (void)getUSerProfileForModule:(Class)clazz ofUser:(NSString *)uName withTimeStamp:(NSString *)timeStamp;
//更新生活状态相关时间
- (void)updateRelationTimeForModule:(Class)clazz withRelationType:(NSNumber *)relationType andTime:(NSString *)relationTime;
- (void)removeBabyForModule:(Class)clazz;
- (void)updateRecentForModule:(Class)clazz withContent:(NSString *)content andContentType:(NSNumber *)contentType;
- (void)getMyRecentForModule:(Class)clazz;
- (void)getUserRecentForModule:(Class)clazz ofUserName:(NSString *)uName;

//other.
- (void)pushMeForModule:(Class)clazz;
- (void)uploadDeviceInfoForModule:(Class)clazz
                              MCC:(NSString *)mcc
                              MNC:(NSString *)mnc
                            Model:(NSString *)model
                        PhoneLang:(NSString *)lan
                          Country:(NSString *)country
                              APN:(NSString *)apn
                     SoftwareLang:(NSString *)sftLan
                       PlatformID:(NSString *)pId
                        EditionID:(NSString *)eId
                        SubcoopId:(NSString *)subcId
                          Cracked:(NSNumber *)crced
                         UniqueId:(NSString *)uId;

- (void)checkUpdate:(Class)clazz;

- (void) sendXMPPMsg:(Class)clazz withMsg:(XMPPUserMessage *) xmppMsg;
- (void) sendXMPPGroupMsg:(Class)clazz withMsg:(XMPPGroupMessage *) xmppMsg;

@end









