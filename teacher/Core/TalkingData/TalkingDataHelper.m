//
//  TalkingDataHelper.m
//  iCouple
//
//  Created by shuo wang on 12-7-3.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "TalkingDataHelper.h"
#import "TalkingData.h"

@interface TalkingDataHelper ()
-(NSString *) getEventName : (EventType) eventType;

-(NSString *) getEventLabelTypeName : (EventLabelType) eventLabelType;
-(NSString *) getLabelTypeName : (LabelType) labelType;

-(NSString *) getPageName : (PageType) pageType;
@end

static TalkingDataHelper *helper = nil;


@implementation TalkingDataHelper
+(TalkingDataHelper *) sharedInstance{
    if ( nil == helper ) {
        helper = [[TalkingDataHelper alloc] init];
    }
    return helper;
}

-(void) addEvent : (EventType) eventType{
    NSString *eventName = [self getEventName:eventType];
    [TalkingData trackEvent:eventName];
}

-(void) addEvent : (EventLabelType) eventLabelType label : (LabelType) labelType{
    NSString *eventLabelTypeName = [self getEventLabelTypeName:eventLabelType];
    NSString *labelTypeName = [self getLabelTypeName:labelType];
    [TalkingData trackEvent:eventLabelTypeName label:labelTypeName];
}

-(void) pageBegin : (PageType) pageType{
    NSString *pageName = [self getPageName:pageType];
    [TalkingData trackPageBegin:pageName];   
}

-(void) pageEnd : (PageType) pageType{
    NSString *pageName = [self getPageName:pageType];
    [TalkingData trackPageEnd:pageName];
}

-(NSString *) getEventName:(EventType)eventType{
    /*
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
     EventType_Enter_MainPage                                    // 进入首页的用户数
     
     // 0.7
     EventType_Click_TextAlarm,                                  // 点击文本识别出的闹钟按钮
     EventType_Click_TextAlarm_Sended,                           // 成功发送文本闹钟
     EventType_Click_PetAlarm,                                   // 点击Pet内小双闹钟
     EventType_Click_PetAlarm_Sended,                            // 发送小双闹钟
     */
    
    NSString *eventName = @"";
    switch (eventType) {
        case EventType_Enter_Register_UserInfor:
            eventName = @"进入注册step1";
            break;
        case EventType_Enter_Register_UserInfor_Success:
            eventName = @"完成注册step1";
            break;
        case EventType_Enter_Register_UserNameAndPassWord:
            eventName = @"进入注册step2";
            break;
        case EventType_Enter_Register_UserNameAndPassWord_Success:
            eventName = @"完成注册step2";
            break;
        case EventType_Enter_Register_BindingPhone:
            eventName = @"进入注册step3（验证码）";
            break;
        case EventType_Enter_Register_BindingPhone_Success:
            eventName = @"完成注册step3（验证码）";
            break;
        case EventType_Enter_Register_Reacquired_SecurityCode:
            eventName = @"点击重获验证码";
            break;
        case EventType_Enter_AddFriendAndCloseFriend:
            eventName = @"进入加好友、加蜜友列表";
            break;
        case EventType_Enter_SSRecommendOrConfirmButton:
            eventName = @"在加好友、加蜜友列表内点击邀请操作";
            break;
        case EventType_Enter_InviteContact:
            eventName = @"在加好友、加蜜友列表邀请联系人";
            break;
        case EventType_Enter_SMS:
            eventName = @"进入发短信界面";
            break;
        case EventType_SendSMS:
            eventName = @"邀请非产品用户时发送短信成功";
            break;
        case EventType_Received_Recommend:
            eventName = @"收到过双双推荐";
            break;
        case EventType_Click_Recommend_NotLabel:
            eventName = @"点击过双双推荐去看看";
            break;
        case EventType_Operation_InStrangerProfile:
            eventName = @"在陌生人profile中操作过";
            break;
        case EventType_Enter_MainPage:
            eventName = @"进入首页";
            break;
        case EventType_Click_TextAlarm:
            eventName = @"点击文本识别出的闹钟按钮";
            break;
        case EventType_Click_TextAlarm_Sended:
            eventName = @"成功发送文本闹钟";
            break;
        case EventType_Click_PetAlarm:
            eventName = @"点击Pet内小双闹钟";
            break;
        case EventType_Click_PetAlarm_Sended:
            eventName = @"发送小双闹钟";
            break;
        default:
            break;
    }
    return eventName;
}

-(NSString *) getEventLabelTypeName : (EventLabelType) eventLabelType{
    
    /*
     EventLabelType_Enter_Register_UserInfor,                    // 1、 进入个人信息总Event
     EventLabelType_Enter_Register_UserNameAndPassWord,          // 2、 进入用户名密码修改总Event
     EventLabelType_Enter_Register_BindingPhone,                 // 3、 进入验证码绑定总Event
     
     EventLabelType_Enter_Stranger,                              // 4、 进入陌生人Profile总Event
     EventLabelType_Enter_MainPage                               // 5、 进入首页操作总Event
     */
    
    NSString *eventLabelTypeName = @"";
    switch (eventLabelType) {
        case EventLabelType_Enter_Register_UserInfor:
            eventLabelTypeName = @"注册step1_event";
            break;
        case EventLabelType_Enter_Register_UserNameAndPassWord:
            eventLabelTypeName = @"注册step2_event";
            break;
        case EventLabelType_Enter_Register_BindingPhone:
            eventLabelTypeName = @"注册step3_event";
            break;
        case EventLabelType_Enter_Stranger:
            eventLabelTypeName = @"陌生人profile_event";
            break;
        case EventLabelType_Enter_MainPage:
            eventLabelTypeName = @"首页_event";
            break;
        default:
            break;
    }
    return eventLabelTypeName;
}

-(NSString *) getLabelTypeName : (LabelType) labelType{
    
    /*
     LabelType_UserInfor_NextStep_UserHeadImageAndNickNameIsNull,// 1、1 点击下一步时，头像并且昵称都未填
     LabelType_UserInfor_NextStep_UserHeadImageIsNull,           // 1、2 点击下一步时，头像未填
     LabelType_UserInfor_NextStep_NickHeadImageIsNull,           // 1、3 点击下一步时，昵称未填
     
     LabelType_UserNameAndPassWord_NextStep_UserNameHasExist,    // 2、1 点击下一步时，用户名重名失败
     LabelType_UserNameAndPassWord_NextStep_PhoneNumberHasExist, // 2、2 点击下一步时，手机号重复失败
     LabelType_UserNameAndPassWord_NextStep_NetWorkError,        // 2、3 点击下一步时，网络连接错误
     
     LabelType_BindingPhone_NextStep_SecurityCodeError,          // 3、1 点击开始使用双双时，验证码错误
     LabelType_BindingPhone_NextStep_SecurityCodeIsNull,         // 3、2 点击开始使用双双时，验证码为空
     LabelType_BindingPhone_NextStep_NetWorkError,               // 3、3 点击开始使用双双时，网络连接错误
     
     LabelType_Click_Recommend_NotLabel,                         // 4、1 点击了主动推荐消息的用户数
     LabelType_Click_Stranger_Group,                             // 4、2 点击了群管理内陌生人头像进入“陌生人profile”页面的用户数
     LabelType_Click_StrangerImage_AddContact,                   // 4、3 点击了添加好友、蜜友页面内用户头像进入“陌生人profile”页面的用户数
     
     LabelType_MainPage_Click_UserHeadImage,                     // 5、1 点击头像进入Profile的用户数
     LabelType_MainPage_Click_MorePage,                          // 5、2 点击更多进入更多的用户数
     LabelType_MainPage_Click_Friends,                           // 5、3 点击首页大家button进入大家的用户数
     LabelType_MainPage_Click_FriendWall,                        // 5、4 点击好友信息墙
     LabelType_MainPage_Click_CloseFriendWall,                   // 5、5 点击蜜友信息墙
     LabelType_MainPage_Click_CoupleIM                           // 5、6 点击couple IM
     
     // 0.7
     LabelType_MainPage_Click_Add_Friend,                        // 点击“添加好友”按钮
     LabelType_MainPage_Click_FriendButton                       // 点击“友”按钮
     */
    
    NSString *labelTypeName = @"";
    switch (labelType) {
        case LabelType_UserInfor_NextStep_UserHeadImageAndNickNameIsNull:
            labelTypeName = @"头像&昵称未填";
            break;
        case LabelType_UserInfor_NextStep_UserHeadImageIsNull:
            labelTypeName = @"头像未填";
            break;
        case LabelType_UserInfor_NextStep_NickHeadImageIsNull:
            labelTypeName = @"昵称未填";
            break;
        case LabelType_UserNameAndPassWord_NextStep_UserNameHasExist:
            labelTypeName = @"用户名重名失败";
            break;
        case LabelType_UserNameAndPassWord_NextStep_PhoneNumberHasExist:
            labelTypeName = @"手机号重复失败";
            break;
        case LabelType_UserNameAndPassWord_NextStep_NetWorkError:
            labelTypeName = @"网络连接错误";
            break;
        case LabelType_BindingPhone_NextStep_SecurityCodeError:
            labelTypeName = @"验证码错误";
            break;
        case LabelType_BindingPhone_NextStep_SecurityCodeIsNull:
            labelTypeName = @"验证码为空";
            break;
        case LabelType_BindingPhone_NextStep_NetWorkError:
            labelTypeName = @"网络连接错误";
            break;
        case LabelType_Click_Recommend_NotLabel:
            labelTypeName = @"点击了双双推荐去看看";
            break;
        case LabelType_Click_Stranger_Group:
            labelTypeName = @"群聊点击了陌生人头像";
            break;
        case LabelType_Click_StrangerImage_AddContact:
            labelTypeName = @"加关系列表点击了陌生人头像";
            break;
        case LabelType_MainPage_Click_UserHeadImage:
            labelTypeName = @"点击自己的头像";
            break;
        case LabelType_MainPage_Click_MorePage:
            labelTypeName = @"点击更多";
            break;
        case LabelType_MainPage_Click_Friends:
            labelTypeName = @"点击大家";
            break;
        case LabelType_MainPage_Click_FriendWall:
            labelTypeName = @"点击好友墙";
            break;
        case LabelType_MainPage_Click_CloseFriendWall:
            labelTypeName = @"点击蜜友墙";
            break;
        case LabelType_MainPage_Click_CoupleIM:
            labelTypeName = @"点击couple IM";
            break;
        case LabelType_MainPage_Click_Add_Friend:
            labelTypeName = @"点击“添加好友”按钮";
            break;
        case LabelType_MainPage_Click_FriendButton:
            labelTypeName = @"点击“友”按钮";
            break;
        default:
            break;
    }
    return labelTypeName;
}

-(NSString *) getPageName : (PageType) pageType{
    /*
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
     PageType_FriendProfile                                      // 15、	好友profile界面
     
     PageType_AddContact_Friend,                                 // 16、	加关系－好友界面
     PageType_AddContact_CloseFriend,                            // 17、	加关系－蜜友界面
     PageType_AddContact_Like,                                   // 18、	加关系－喜欢界面
     PageType_AddContact_Couple,                                 // 19、	加关系－Couple界面
     PageType_FriendAndCloseFriend_IM,                           // 20、	好友，蜜友IM ＋ Profile界面
     PageType_ChooseCoupleOrMarried,                             // 21、	选择小情侣或小夫妻界面
     PageType_ChangePassWord,                                    // 22、	更改密码界面
     PageType_MySelfProfile,                                     // 23、	个人profile界面
     PageType_Groud_IM,                                          // 24、	群IM界面
     PageType_ShuangShuang_IM                                    // 25、	小双IM界面
     PageType_Confirm_Relationship                               // 26、	请求关系确认界面
     */
    NSString *pageName = @"";
    switch (pageType) {
        case PageType_Login:
            pageName = @"登录界面";
            break;
        case PageType_RegisterPage_StepOne:
            pageName = @"注册界面步骤一";
            break;
        case PageType_RegisterPage_StepTwo:
            pageName = @"注册界面步骤二";
            break;
        case PageType_RegisterPage_StepThree:
            pageName = @"注册界面步骤三";
            break;
        case PageType_MainPage:
            pageName = @"首页界面";
            break;
        case PageType_MorePage:
            pageName = @"更多界面";
            break;
        case PageType_MainFriendWall:
            pageName = @"首页大家墙";
            break;
        case PageType_FriendWall:
            pageName = @"好友大家墙";
            break;
        case PageType_CloseFriendWall:
            pageName = @"蜜友大家墙";
            break;
        case PageType_FriendInforWall:
            pageName = @"好友信息墙";
            break;
        case PageType_CloseFriendInforWall:
            pageName = @"蜜友信息墙";
            break;
        case PageType_CoupleIM:
            pageName = @"Couple IM界面";
            break;
        case PageType_SystemIM:
            pageName = @"系统消息IM界面";
            break;
        case PageType_StrangerProfile:
            pageName = @"非好友profile界面";
            break;
        case PageType_FriendProfile:
            pageName = @"好友profile界面";
            break;
        case PageType_AddContact_Friend:
            pageName = @"加关系－好友界面";
            break;
        case PageType_AddContact_CloseFriend:
            pageName = @"加关系－蜜友界面";
            break;
        case PageType_AddContact_Like:
            pageName = @"加关系－喜欢界面";
            break;
        case PageType_AddContact_Couple:
            pageName = @"加关系－Couple界面";
            break;
        case PageType_FriendAndCloseFriend_IM:
            pageName = @"好友、蜜友IM+Profile界面";
            break;
        case PageType_ChooseCoupleOrMarried:
            pageName = @"Couple 类型选择界面";
            break;
        case PageType_ChangePassWord:
            pageName = @"密码更改界面";
            break;
        case PageType_MySelfProfile:
            pageName = @"个人Profile界面";
            break;
        case PageType_Groud_IM:
            pageName = @"群IM界面";
            break;
        case PageType_ShuangShuang_IM:
            pageName = @"小双IM界面";
            break;
        case PageType_Confirm_Relationship:
            pageName = @"请求关系确认界面";
            break;
        default:
            break;
    }
    return pageName;
}

@end
