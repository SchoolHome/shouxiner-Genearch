//
//  CPHttpEngineConst.h
//  iCouple
//
//  Created by yl s on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef iCouple_CPHttpEngineConst_h
#define iCouple_CPHttpEngineConst_h

#ifdef TEST
#define K_HOST_NAME_OF_PALM_SERVER      @"115.29.224.151"
#define K_HOST_NAME_OF_PALM_UPLOAD      @"115.29.224.151"
#define K_XMPP_SERVER                   @"115.29.224.151:8280/chat"
#else
#define K_HOST_NAME_OF_PALM_SERVER      @"www.shouxiner.com"
#define K_HOST_NAME_OF_PALM_UPLOAD      @"att.shouxiner.com"
#define K_XMPP_SERVER                   @"im.shouxiner.com:80/chat"
#endif

//auth server info ++

///////////////////////////////////////////////////////////////////////////////////////////
//                                  Passport
///////////////////////////////////////////////////////////////////////////////////////////
#ifdef WWAN_TEST

//#define K_HOST_NAME_OF_PASSPORT_SERVER      @"www.shouxiner.com"
#define K_HOST_NAME_OF_PASSPORT_SERVER      @"115.29.224.151"

#define K_PATH_LOGIN                        @"mapi/login"
#define K_PATH_LOGOUT                       @"logout"
#define K_PATH_REGISTER                     @"reg"
#define K_PATH_VERIFY_CODE                  @"user/phone/verify"
#define K_PATH_BIND_PHONENUM                @"user/phone/bind"
#define K_PATH_BIND_COUPLE                  @"user/couple/addCouplePhone"
#define K_PATH_RETRIEVE_PASSWORD            @"findPasswd"
#define K_PATH_RESET_PASSWORD               @"resetPasswd"
#define K_PATH_CHANGE_PASSWORD              @"user/passwd/change"
//@"user/info/phone?p={phonenum}&a={phonearea}"
#define K_PATH_SEARCH_USER                  @"user/info/phone"
#define K_PATH_SEARCH_USER_BY_NAME          @"user/info/name"
#define K_PATH_GET_USERS_BY_PHONES          @"user/info/getUsersByPhones"
#define K_PATH_UPDATE_DEVICE_TOKEN          @"mapi/setPushToken"

#else

#define K_HOST_NAME_OF_PASSPORT_SERVER      @"192.168.50.0:8080"

#define K_PATH_LOGIN                        @"passport/login"
#define K_PATH_LOGOUT                       @"passport/logout"
#define K_PATH_REGISTER                     @"passport/reg"
#define K_PATH_VERIFY_CODE                  @"passport/user/phone/verify"
#define K_PATH_BIND_PHONENUM                @"passport/user/phone/bind"
#define K_PATH_BIND_COUPLE                  @"passport/user/couple/addCouplePhone"
#define K_PATH_RETRIEVE_PASSWORD            @"passport/findPasswd"
#define K_PATH_RESET_PASSWORD               @"passport/resetPasswd"
#define K_PATH_CHANGE_PASSWORD              @"passport/user/passwd/change"
//@"user/info/phone?p={phonenum}&a={phonearea}"
#define K_PATH_SEARCH_USER                  @"passport/user/info/phone"
#define K_PATH_SEARCH_USER_BY_NAME          @"passport/user/info/name"
#define K_PATH_GET_USERS_BY_PHONES          @"passport/user/info/getUsersByPhones"
#define K_PATH_UPDATE_DEVICE_TOKEN          @"passport/user/token/updateToken"


#endif
//auth server info --

///////////////////////////////////////////////////////////////////////////////////////////
//                                  file
///////////////////////////////////////////////////////////////////////////////////////////
//file server info ++
#ifdef WWAN_TEST

#define K_HOST_NAME_OF_FILE_UPLOAD_SERVER   @"115.29.224.151"
#define K_HOST_NAME_OF_FILE_DOWNLOAD_SERVER @"http://file.ishuangshuang.com"

#define K_HOST_NAME_OF_PRODUCT_FILE_DOWNLOAD_SERVER @"http://static.ishuangshuang.com"

#define K_PATH_OF_SELFICON                  @"upload/icon/own"
#define K_PATH_OF_COUPLEICON                @"upload/icon/couple"
#define K_PATH_OF_BABYICON                  @"upload/icon/baby"
#define K_PATH_OF_BACKGROUND                @"upload/background"
#define K_PATH_OF_MESSAGE_PIC               @"upload/pic/chat"
#define K_PATH_OF_MESSAGE_AUDIO             @"upload/audio/chat"
#define K_PATH_OF_MESSAGE_VIDEO             @"upload/video/chat"
#define K_PATH_OF_MESSAGE_OTHER             @"upload/other/chat"
#define K_PATH_OF_GROUP_MESSAGE_PIC         @"upload/pic/mchat"
#define K_PATH_OF_GROUP_MESSAGE_AUDIO       @"upload/audio/mchat"
#define K_PATH_OF_GROUP_MESSAGE_VIDEO       @"upload/video/mchat"
#define K_PATH_UPDATE_RECENT_AUDIO          @"upload/audio/recent"

#else

#ifdef PM_TEST
#define K_HOST_NAME_OF_FILE_UPLOAD_SERVER   @"192.168.50.8:8080"
#define K_HOST_NAME_OF_FILE_DOWNLOAD_SERVER @"http://192.168.50.8:9000"
#else
#define K_HOST_NAME_OF_FILE_UPLOAD_SERVER   @"192.168.50.0:8080"
#define K_HOST_NAME_OF_FILE_DOWNLOAD_SERVER @"http://192.168.50.0:9000"
#endif

#define K_PATH_OF_SELFICON                  @"res/upload/icon/own"
#define K_PATH_OF_COUPLEICON                @"res/upload/icon/couple"
#define K_PATH_OF_BABYICON                  @"res/upload/icon/baby"
#define K_PATH_OF_BACKGROUND                @"res/upload/background"
#define K_PATH_OF_MESSAGE_PIC               @"res/upload/pic/chat"
#define K_PATH_OF_MESSAGE_AUDIO             @"res/upload/audio/chat"
#define K_PATH_OF_MESSAGE_VIDEO             @"res/upload/video/chat"
#define K_PATH_OF_MESSAGE_OTHER             @"res/upload/other/chat"
#define K_PATH_OF_GROUP_MESSAGE_PIC         @"res/upload/pic/mchat"
#define K_PATH_OF_GROUP_MESSAGE_AUDIO       @"res/upload/audio/mchat"
#define K_PATH_OF_GROUP_MESSAGE_VIDEO       @"res/upload/video/mchat"
#define K_PATH_UPDATE_RECENT_AUDIO          @"res/upload/audio/recent"

#endif
//file server info --

///////////////////////////////////////////////////////////////////////////////////////////
//                                  relation
///////////////////////////////////////////////////////////////////////////////////////////
//relation ++
#ifdef WWAN_TEST

#define K_HOST_NAME_OF_RELATION_SERVER      @"115.29.224.151"

#define K_PATH_OF_GET_MY_FRIENDS            @"mapi/getContacts"
#define K_PATH_OF_ADD_NORMAL_FRIEND         @"user/roster/beMyNormalFriend"
#define K_PATH_OF_ADD_LOVER                 @"user/roster/beMyLoverCouple"
#define K_PATH_OF_ADD_CLOSER                @"user/roster/beMyCloseFriend"
#define K_PATH_OF_ADD_COUPLE                @"user/roster/beMyMarriedCouple"
#define K_PATH_OF_ADD_CRUSH                 @"user/roster/beMyConcernedFriend"
#define K_PATH_OF_INVITE_NORMAL_FRIEND      @"user/roster/inv/beMyNormalFriend"
#define K_PATH_OF_INVITE_LOVER              @"user/roster/inv/beMyLoverCouple"
#define K_PATH_OF_INVITE_CLOSER             @"user/roster/inv/beMyCloseFriend"
#define K_PATH_OF_INVITE_COUPLE             @"user/roster/inv/beMyMarriedCouple"
#define K_PATH_OF_INVITE_CRUSH              @"user/roster/inv/beMyConcernedFriend"
#define K_PATH_OF_ANSWER_REQUEST            @"user/roster/answerRequest"
#define K_PATH_OF_BREAK_FRIEND_RELATION     @"user/roster/breakOutFromFriend"
#define K_PATH_OF_GET_MUTUAL_FRIENDS        @"user/roster/findSharedFriends"

#else

#ifdef PM_TEST
#define K_HOST_NAME_OF_RELATION_SERVER      @"192.168.50.8:8080"
#else
#define K_HOST_NAME_OF_RELATION_SERVER      @"192.168.50.0:8080"
#endif

#define K_PATH_OF_UPLOAD_CONTACT_INFO       @"contact/user/contact/upload"
#define K_PATH_OF_GET_USERS_KNOW_ME         @"contact/user/contact/getUsersKnowMe"

#define K_PATH_OF_GET_MY_FRIENDS            @"relation/user/roster/getMyFriends"
#define K_PATH_OF_ADD_NORMAL_FRIEND         @"relation/user/roster/beMyNormalFriend"
#define K_PATH_OF_ADD_LOVER                 @"relation/user/roster/beMyLoverCouple"
#define K_PATH_OF_ADD_CLOSER                @"relation/user/roster/beMyCloseFriend"
#define K_PATH_OF_ADD_COUPLE                @"relation/user/roster/beMyMarriedCouple"
#define K_PATH_OF_ADD_CRUSH                 @"relation/user/roster/beMyConcernedFriend"
#define K_PATH_OF_INVITE_NORMAL_FRIEND      @"relation/user/roster/inv/beMyNormalFriend"
#define K_PATH_OF_INVITE_LOVER              @"relation/user/roster/inv/beMyLoverCouple"
#define K_PATH_OF_INVITE_CLOSER             @"relation/user/roster/inv/beMyCloseFriend"
#define K_PATH_OF_INVITE_COUPLE             @"relation/user/roster/inv/beMyMarriedCouple"
#define K_PATH_OF_INVITE_CRUSH              @"relation/user/roster/inv/beMyConcernedFriend"
#define K_PATH_OF_ANSWER_REQUEST            @"relation/user/roster/answerRequest"
#define K_PATH_OF_BREAK_FRIEND_RELATION     @"relation/user/roster/breakOutFromFriend"
#define K_PATH_OF_GET_MUTUAL_FRIENDS        @"relation/user/roster/findSharedFriends"

#endif
//relation --

///////////////////////////////////////////////////////////////////////////////////////////
//                                  contact
///////////////////////////////////////////////////////////////////////////////////////////
//contct++
#ifdef WWAN_TEST

#define K_HOST_NAME_OF_CONTACT_SERVER       @"contact.ishuangshuang.com"

#define K_PATH_OF_UPLOAD_CONTACT_INFO       @"user/contact/upload"
#define K_PATH_OF_GET_USERS_KNOW_ME         @"user/contact/getUsersKnowMe"

#else

#ifdef PM_TEST
#define K_HOST_NAME_OF_CONTACT_SERVER       @"192.168.50.8:8080"
#else
#define K_HOST_NAME_OF_CONTACT_SERVER       @"192.168.50.0:8080"
#endif

#define K_PATH_OF_UPLOAD_CONTACT_INFO       @"contact/user/contact/upload"
#define K_PATH_OF_GET_USERS_KNOW_ME         @"contact/user/contact/getUsersKnowMe"

#endif
//contact--

///////////////////////////////////////////////////////////////////////////////////////////
//                                  group
///////////////////////////////////////////////////////////////////////////////////////////
//group++
#ifdef WWAN_TEST

#define K_HOST_NAME_OF_GROUPCHAT_SERVER         @"115.29.224.151"

#define K_PATH_OF_CREATE_GROUP                  @"chatgroup/createGroup"
#define K_PATH_OF_GET_GROUP_INFO                @"chatgroup/getGroup"
#define K_PATH_OF_ADD_GROUP_MEMEBER             @"chatgroup/addGroupMember"
#define K_PATH_OF_REMOVE_GROUP_MEMEBER          @"chatgroup/deleteGroupMember"
#define K_PATH_OF_QUITGROUP                     @"chatgroup/quitGroup"
#define K_PATH_OF_ADD_FAVORITE_GROUP            @"chatgroup/addFavorite"
#define K_PATH_OF_GET_FAVORITE_GROUPS           @"chatgroup/getFavorite"
#define K_PATH_OF_UPDATE_FAVORITE_GROUP_INFO    @"chatgroup/updateFavorite"
#define K_PATH_OF_REMOVE_GROUP_FROM_FAVORITE    @"chatgroup/deleteFavorite"

#else

#ifdef PM_TEST
#define K_HOST_NAME_OF_GROUPCHAT_SERVER         @"192.168.50.8:8080"
#else
#define K_HOST_NAME_OF_GROUPCHAT_SERVER         @"192.168.50.0:8080"
#endif

#define K_PATH_OF_CREATE_GROUP                  @"groupchat/chatgroup/createGroup"
#define K_PATH_OF_GET_GROUP_INFO                @"groupchat/chatgroup/getGroup"
#define K_PATH_OF_ADD_GROUP_MEMEBER             @"groupchat/chatgroup/addGroupMember"
#define K_PATH_OF_REMOVE_GROUP_MEMEBER          @"groupchat/chatgroup/deleteGroupMember"
#define K_PATH_OF_QUITGROUP                     @"groupchat/chatgroup/quitGroup"
#define K_PATH_OF_ADD_FAVORITE_GROUP            @"groupchat/chatgroup/addFavorite"
#define K_PATH_OF_GET_FAVORITE_GROUPS           @"groupchat/chatgroup/getFavorite"
#define K_PATH_OF_UPDATE_FAVORITE_GROUP_INFO    @"groupchat/chatgroup/updateFavorite"
#define K_PATH_OF_REMOVE_GROUP_FROM_FAVORITE    @"groupchat/chatgroup/deleteFavorite"

#endif
//group--

///////////////////////////////////////////////////////////////////////////////////////////
//                                  profile
///////////////////////////////////////////////////////////////////////////////////////////
//profile++
#ifdef WWAN_TEST

#define K_HOST_NAME_OF_PROFILE_SERVER           @"profile.ishuangshuang.com"

#define K_PATH_OF_GET_MY_FOFILE                 @"mapi/getUserInfo?uid=%@"
#define K_PATH_OF_GET_USER_FOFILE               @"profile/user"
#define K_PATH_OF_SET_RELATION_TIME             @"profile/relationDate/update"
#define K_PATH_OF_REMOVE_BABY                   @"profile/baby/del"
#define K_PATH_OF_UPDATE_RECENT                 @"recent/update"
#define K_PATH_OF_GET_MY_RECENT                 @"recent/own"
#define K_PATH_OF_GET_USER_RECENT               @"recent/user"
#define K_PATH_UPDATA_NICKNAME_AND_GENDER       @"profile/update"

#else

#ifdef PM_TEST
#define K_HOST_NAME_OF_PROFILE_SERVER           @"192.168.50.8:8080"
#else
#define K_HOST_NAME_OF_PROFILE_SERVER           @"192.168.50.0:8080"
#endif

#define K_PATH_OF_GET_MY_FOFILE                 @"profile/profile/own"
#define K_PATH_OF_GET_USER_FOFILE               @"profile/profile/user"
#define K_PATH_OF_SET_RELATION_TIME             @"profile/profile/relationDate/update"
#define K_PATH_OF_REMOVE_BABY                   @"profile/profile/baby/del"
#define K_PATH_OF_UPDATE_RECENT                 @"profile/recent/update"
#define K_PATH_OF_GET_MY_RECENT                 @"profile/recent/own"
#define K_PATH_OF_GET_USER_RECENT               @"profile/recent/user"
#define K_PATH_UPDATA_NICKNAME_AND_GENDER       @"profile/profile/update"

#endif
//profile--

///////////////////////////////////////////////////////////////////////////////////////////
//                                  other
///////////////////////////////////////////////////////////////////////////////////////////
//other++
#ifdef WWAN_TEST
#define K_PATH_OTHER_SERVER                     @"stat.ishuangshuang.com"

#define K_PATH_OTHER_PUSHME                     @"count/pushme/magic.html"
#define K_PATH_OTHER_DEVICE_INFO                @"info/dev/iphone"
#else

#define K_PATH_OTHER_SERVER                     @"192.168.50.0:8080"

#define K_PATH_OTHER_PUSHME                     @"stat/count/pushme/magic.html"
#define K_PATH_OTHER_DEVICE_INFO                @"stat/info/dev/iphone"

#endif
//other--

//check update++
#ifdef WWAN_TEST
#define K_PATH_CHECK_UPDATE                     @"http://static.ishuangshuang.com/update/iphone.json"
#else

#ifdef PM_TEST
#define K_PATH_CHECK_UPDATE                     @"http://192.168.50.8:9000/update/iphone.json"
#else
#define K_PATH_CHECK_UPDATE                     @"http://192.168.50.0:9000/update/iphone.json"
#endif

#endif

//check update--
#ifdef WWAN_TEST
#define K_PATH_HTTP_SEND_SERVER                 @"115.29.224.151:8280/chat"
#define K_PATH_HTTP_SEND_MSG                    @"message/send"
#else
#define K_PATH_HTTP_SEND_SERVER                 @"192.168.50.0:8080"
#define K_PATH_HTTP_SEND_MSG                    @"groupchat/message/send"

#endif



#endif
