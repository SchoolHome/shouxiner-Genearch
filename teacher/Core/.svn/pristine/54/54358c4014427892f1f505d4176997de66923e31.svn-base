//
//  TalkingDataHelper.h
//  iCouple
//
//  Created by shuo wang on 12-7-3.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    EventType_Enter_Register_UserInfor,                         // 进入填写个人信息页面的用户数
    EventType_Enter_Register_UserInfor_Success,                 // 顺利完成个人信息填写页面的用户数
    EventType_Enter_Register_UserNameAndPassWord,               // 进入填写用户名密码页面的用户数
    EventType_Enter_Register_UserNameAndPassWord_Success,       // 顺利完成填写用户名密码页面的用户数
    EventType_Enter_Register_BindingPhone,                      // 进入填写验证码绑定手机页面的用户数
    EventType_Enter_Register_BindingPhone_Success,              // 顺利完成填写验证码绑定手机页面的用户数
    EventType_Enter_Register_Reacquired_SecurityCode,           // 点击重新获取验证码时
    
    EventType_Enter_AddFriendAndCloseFriend,                    // 进入到加好友或者加蜜友的用户数
    EventType_Enter_SSRecommendOrConfirmButton,                 // 点击双双推荐或者右上方确定按钮的用户数
    EventType_Enter_InviteContact,                              // 邀请多个联系人时调用（1）统计总共邀请了多少个联系人
    
    EventType_Enter_SMS,                                        // 进入到发短信邀请页面的用户数
    EventType_SendSMS,                                          // 实际发送了短信的用户数
    
    EventType_Received_Recommend,                               // 收到主动推荐消息（某某加入了双双）的用户数
    EventType_Click_Recommend_NotLabel,                         // 点击了主动推荐消息的用户数
    EventType_Operation_InStrangerProfile,                      // 在“陌生人profile”页面进行过操作的用户数
    EventType_Enter_MainPage,                                   // 进入首页的用户数
    
    // 0.7
    EventType_Click_TextAlarm,                                  // 点击文本识别出的闹钟按钮
    EventType_Click_TextAlarm_Sended,                           // 成功发送文本闹钟
    EventType_Click_PetAlarm,                                   // 点击Pet内小双闹钟
    EventType_Click_PetAlarm_Sended,                            // 发送小双闹钟
}EventType;

typedef enum{
    EventLabelType_Enter_Register_UserInfor,                    // 进入个人信息总Event
    EventLabelType_Enter_Register_UserNameAndPassWord,          // 进入用户名密码修改总Event
    EventLabelType_Enter_Register_BindingPhone,                 // 进入验证码绑定总Event
    
    EventLabelType_Enter_Stranger,                              // 进入陌生人Profile总Event
    EventLabelType_Enter_MainPage                               // 进入首页操作总Event
}EventLabelType;

typedef enum{
    LabelType_UserInfor_NextStep_UserHeadImageAndNickNameIsNull,// 点击下一步时，头像并且昵称都未填
    LabelType_UserInfor_NextStep_UserHeadImageIsNull,           // 点击下一步时，头像未填
    LabelType_UserInfor_NextStep_NickHeadImageIsNull,           // 点击下一步时，昵称未填
    
    LabelType_UserNameAndPassWord_NextStep_UserNameHasExist,    // 点击下一步时，用户名重名失败
    LabelType_UserNameAndPassWord_NextStep_PhoneNumberHasExist, // 点击下一步时，手机号重复失败
    LabelType_UserNameAndPassWord_NextStep_NetWorkError,        // 点击下一步时，网络连接错误
    
    LabelType_BindingPhone_NextStep_SecurityCodeError,          // 点击开始使用双双时，验证码错误
    LabelType_BindingPhone_NextStep_SecurityCodeIsNull,         // 点击开始使用双双时，验证码为空
    LabelType_BindingPhone_NextStep_NetWorkError,               // 点击开始使用双双时，网络连接错误
    
    LabelType_Click_Recommend_NotLabel,                         // 点击了主动推荐消息的用户数
    LabelType_Click_Stranger_Group,                             // 点击了群管理内陌生人头像进入“陌生人profile”页面的用户数
    LabelType_Click_StrangerImage_AddContact,                   // 点击了添加好友、蜜友页面内用户头像进入“陌生人profile”页面的用户数
    
    LabelType_MainPage_Click_UserHeadImage,                     // 点击头像进入Profile的用户数
    LabelType_MainPage_Click_MorePage,                          // 点击更多进入更多的用户数
    LabelType_MainPage_Click_Friends,                           // 点击首页大家button进入大家的用户数
    LabelType_MainPage_Click_FriendWall,                        // 点击好友信息墙
    LabelType_MainPage_Click_CloseFriendWall,                   // 点击蜜友信息墙
    LabelType_MainPage_Click_CoupleIM,                          // 点击couple IM
    
    // 0.7
    LabelType_MainPage_Click_Add_Friend,                        // 点击“添加好友”按钮
    LabelType_MainPage_Click_FriendButton                       // 点击“友”按钮
    
}LabelType;

typedef enum{
    PageType_Login,                                             // 1、	登录界面
    PageType_RegisterPage_StepOne,                              // 2、	注册界面步骤一
    PageType_RegisterPage_StepTwo,                              // 3、	注册界面步骤二
    PageType_RegisterPage_StepThree,                            // 4、	注册界面步骤三
    PageType_MainPage,                                          // 5、	首页界面
    PageType_MorePage,                                          // 6、	更多界面
    PageType_MainFriendWall,                                    // 7、	首页大家墙
    PageType_FriendWall,                                        // 8、	好友大家墙
    PageType_CloseFriendWall,                                   // 9、	蜜友大家墙
    PageType_FriendInforWall,                                   // 10、	好友信息墙
    PageType_CloseFriendInforWall,                              // 11、	蜜友信息墙
    PageType_CoupleIM,                                          // 12、	Couple IM界面
    PageType_SystemIM,                                          // 13、	系统消息IM界面
    PageType_StrangerProfile,                                   // 14、	非好友profile界面
    PageType_FriendProfile,                                     // 15、	好友profile界面
    
    PageType_AddContact_Friend,                                 // 16、	加关系－好友界面
    PageType_AddContact_CloseFriend,                            // 17、	加关系－蜜友界面
    PageType_AddContact_Like,                                   // 18、	加关系－喜欢界面
    PageType_AddContact_Couple,                                 // 19、	加关系－Couple界面
    PageType_FriendAndCloseFriend_IM,                           // 20、	好友，蜜友IM ＋ Profile界面
    PageType_ChooseCoupleOrMarried,                             // 21、	选择小情侣或小夫妻界面
    PageType_ChangePassWord,                                    // 22、	更改密码界面
    PageType_MySelfProfile,                                     // 23、	个人profile界面
    PageType_Groud_IM,                                          // 24、	群IM界面
    PageType_ShuangShuang_IM,                                   // 25、	小双IM界面
    PageType_Confirm_Relationship                               // 26、	请求关系确认界面
}PageType;

@interface TalkingDataHelper : NSObject
+(TalkingDataHelper *) sharedInstance;

-(void) addEvent : (EventType) eventType;
-(void) addEvent : (EventLabelType) eventLabelType label : (LabelType) labelType;

-(void) pageBegin : (PageType) pageType;
-(void) pageEnd : (PageType) pageType;


@end
