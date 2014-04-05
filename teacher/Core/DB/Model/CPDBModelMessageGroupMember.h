#import <Foundation/Foundation.h>


/**
 * 群组成员
 */

@interface CPDBModelMessageGroupMember : NSObject
{

    NSNumber *msgGroupMemID_;//成员主键
    NSNumber *msgGroupID_;//群ID
    NSString *mobileNumber_;//手机号
    NSString *userName_;//用户account
    NSString *nickName_;//在群组里面的昵称
    NSString *sign_;//签名
    NSNumber *headerResourceID_;//头像本地资源ID
    NSString *domain_;//
    NSString *headerPath_;//
}

@property (strong,nonatomic) NSNumber *msgGroupMemID;
@property (strong,nonatomic) NSNumber *msgGroupID;
@property (strong,nonatomic) NSString *mobileNumber;
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *nickName;
@property (strong,nonatomic) NSString *sign;
@property (strong,nonatomic) NSNumber *headerResourceID;
@property (strong,nonatomic) NSString *domain;
@property (strong,nonatomic) NSString *headerPath;
@end
