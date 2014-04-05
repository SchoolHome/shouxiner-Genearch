//
//  CPHttpEngineObserver.h
//  Couple
//
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPHttpEngineObserver <NSObject>

@optional

#ifdef SYS_STATE_MIGR
- (void) handleReLoginResult:(NSNumber *)resultCode withObject:(NSObject*)resutlObject andToken:(NSString *)token;
#endif

#pragma -
#pragma mark Resource request callback
- (void) handleResourceUploadCompleteOf:(NSNumber *)resourceID
                         withResultCode:(NSNumber *)resultCode
                      andResponseObject:(NSObject *)obj;

- (void) handleResourceUploadCompleteOfVideo:(NSNumber *)resourceID
                         withResultCode:(NSNumber *)resultCode
                      andResponseObject:(NSObject *)obj;

- (void) handleResrouceUploadErrorOf:(NSNumber *)resourceID
                      withResultCode:(NSNumber *)resultCode;

- (void) handleResourceDownloadCompleteOf:(NSNumber *)resourceID
                           withResultCode:(NSNumber *)resultCode
                             andLocalFile:(NSString *)localFile
                             andTimeStamp:(NSString *)timeStamp;

- (void) handleResourceDownlaodErrorOf:(NSNumber *)resourceID
                        withResultCode:(NSNumber *)resultCode;

- (void) handleResourceDownloadProgress:(double)grogress;

- (void) handlePetResDownloadResult:(NSNumber *)resultCode
                           ofPetRes:(NSString *)resID
                      andContextObj:(NSObject *)contextObj;

- (void) handlePetResDownloadProgress:(double)progress;

#pragma -
#pragma mark Account rltd op callback
- (void) handleRegisterAccountResult:(NSNumber *)resultCode;
- (void) handleSendVerifyCodeResult:(NSNumber *)resultCode;
- (void) handleBindPhoneNumberResult:(NSNumber *)resultCode;
- (void) handleBindCoupleResult:(NSNumber *)resultCode withObject:(NSObject *)obj;
- (void) handleRetrievePasswordResult:(NSNumber *)resultCode;
- (void) handleResetPasswordResult:(NSNumber *)resultCode withUserName:(NSString *)uName andOriginalPassword:(NSString *)pwd;
- (void) handleChangePasswordResult:(NSNumber *)resultCode withNewPassword:(NSString *)newPwd;
//obj:CPPTModelGetUsersResultList
- (void) handleGetUsersByPhonesResult:(NSNumber *)resultCode withObject:(NSObject *)obj;
- (void) handleUpdateMyNicknameAndGenderResult:(NSNumber *)resultCode;
- (void) handleUPdateDeviceTokenResult:(NSNumber *)resultCode;

//resutlObject:CPPTModelLoginResult
- (void) handleLoginResult:(NSNumber *)resultCode withObject:(NSObject*)resutlObject andToken:(NSString *)token;
- (void) handleLogoutResult:(NSNumber *)resultCode withToken:(NSString *)token;

- (void) handleSearchUserResult:(NSNumber *)resultCode withObject:(NSObject *)obj;

- (void) handleUploadContactInfosResult:(NSNumber *)resultCode;

//obj:CPPTModelUserInfos
- (void) handleGetUsersKnowMeResult:(NSNumber *)resultCode withObject:(NSObject *)obj;
//obj:CPPTModelUserInfos
- (void) handleGetMyFriendsResult:(NSNumber *)resultCode withObject:(NSObject *)obj andTimeStamp:(NSString *)timeStamp;
- (void) handleAddFriendResult:(NSNumber *)resultCode withUserName:(NSString *)uName andCategory:(NSNumber *)category;
//obj:CPPTModelInviteFriendResult
- (void) handleInviteFriendResult:(NSNumber *)resultCode withObject:(NSObject *)obj andPhoneNum:(NSString *)phoneNum andCategory:(NSNumber *)category;
- (void) handleAnswerRequestResult:(NSNumber *)resultCode withAcceptFlag:(NSNumber *)acceptFlag andContextObject:(NSObject *)ctxObj;
- (void) handleBreakFriendRelationResult:(NSNumber *)resultCode withUserName:(NSString *)uName;
//obj:CPPTModelUserInfos
- (void) handleGetMutualFriendsResult:(NSNumber *)resultCode forUser:(NSString *)uName withObject:(NSObject *)obj;

#pragma -
#pragma mark GroupChat rltd op
//obj:NSString---groupJID
- (void)handleCreateGroupResult:(NSNumber *)resultCode
                     withObject:(NSObject *)obj
               andContextObject:(NSObject *)contextObj;
//obj:CPPTModelGroupInfo
- (void)handleGetGroupInfoResult:(NSNumber *)resultCode withObject:(NSObject *)obj andOrignalGroupJID:(NSString *)groupJID;
- (void)handleAddGroupMembersResult:(NSNumber *)resultCode
                            ofGroup:(NSString *)groupJID
                   andContextObject:(NSObject *)contextObj;

- (void)handleRemoveGroupMembersResult:(NSNumber *)resultCode
                               ofGroup:(NSString *)groupJID
                      andContextObject:(NSObject *)contextObj;

- (void)handleQuitGroupResult:(NSNumber *)resultCode ofGroup:(NSString *)groupJID;

- (void)handleAddFavoriteGroupResult:(NSNumber *)resultCode
                             ofGroup:(NSString *)groupJID
                    andContextObject:(NSObject *)contextObj;

//obj:CPPTModelGroupInfo
- (void)hanldeGetFavoriteGroupsResult:(NSNumber *)resultCode withObject:(NSObject *)obj andTimeStamp:(NSString *)timeStamp;

- (void)handleModifyFavoriteGroupNameResult:(NSNumber *)resultCode
                                    ofGroup:(NSString *)groupJID
                           andContextObject:(NSObject *)contextObj;

- (void)handleRemoveGroupFromFavoriteResult:(NSNumber *)resultCode ofGroup:(NSString *)groupJID;

#pragma -
#pragma mark profile op
//--------------------------------------------------------------------------------------------------
//profile op.
//--------------------------------------------------------------------------------------------------
//obj:CPPTModelUserProfile
- (void)handleGetMyFrofileResult:(NSNumber *)resultCode withObject:(NSObject *)obj andTimeStamp:(NSString *)timeStamp;
//obj:CPPTModelUserProfile
- (void)handleGetUserFrofileResult:(NSNumber *)resultCode ofUser:(NSString *)uName withObject:(NSObject *)obj andTimeStamp:(NSString *)timeStamp;
- (void)handleUpdateRelationTimeResult:(NSNumber *)resultCode;
- (void)handleRemoveBabyResult:(NSNumber *)resultCode;
- (void)handleUpdateRecentResult:(NSNumber *)resultCode;

- (void)handleGetMyRecentResult:(NSNumber *)resultCode
                    withContent:(NSString *)content
                 andContentType:(NSNumber *)contentType
                  andCreateTime:(NSString *)createTime;

- (void)handleGetUserRecentResult:(NSNumber *)resultCode
                           ofUser:(NSString *)uName
                      withContent:(NSString *)content
                   andContentType:(NSNumber *)contentType
                    andCreateTime:(NSString *)createTime;

//other
- (void)handlePushMeResult:(NSNumber *)resultCode;
- (void)handleCheckUpdateResult:(NSNumber *)resultCode
                    withSubject:(NSString *)subject
                     andContent:(NSString *)content
                     andVersion:(NSString *)version
                 andVersionCode:(NSNumber *)versionCode
                         andUrl:(NSString *)url;

//HTTP send msg
- (void) handleHTTPSendMsg:(NSNumber*) messageID withResult:(BOOL)result;

@end
