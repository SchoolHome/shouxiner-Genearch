#import <Foundation/Foundation.h>


/**
 * 群组成员
 */
@class CPUIModelUserInfo;
@interface CPUIModelMessageGroupMember : NSObject
{

    NSNumber *msgGroupMemID_;//成员主键
    NSNumber *msgGroupID_;//群ID
    NSString *mobileNumber_;//手机号
    NSString *userName_;//用户ID
    NSString *nickName_;//在群组里面的昵称
    NSString *sign_;//签名
    NSNumber *headerResourceID_;//头像本地资源ID
    NSString *headerPath_;//签名
    NSString *domain_;//

    CPUIModelUserInfo *userInfo_;
}

@property (strong,nonatomic) NSNumber *msgGroupMemID;
@property (strong,nonatomic) NSNumber *msgGroupID;
@property (strong,nonatomic) NSString *mobileNumber;
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *nickName;
@property (strong,nonatomic) NSString *sign;
@property (strong,nonatomic) NSString *headerPath;
@property (strong,nonatomic) NSNumber *headerResourceID;
@property (strong,nonatomic) NSString *domain;
@property (strong,nonatomic) CPUIModelUserInfo *userInfo;

-(BOOL)isHiddenMember;//是否是隐藏的群聊成员 YES:隐藏的群成员，不应显示在群的Profile中
@end
