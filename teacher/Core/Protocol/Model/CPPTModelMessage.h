#import <Foundation/Foundation.h>


/**
 * 消息表
 */

@interface CPPTModelMessage : NSObject
{

    NSNumber *msgID_;//消息主键
    NSNumber *msgGroupID_;//群ID
    NSString *msgServerID_;//消息在服务器的ID
    NSString *mobile_;//手机号
    NSNumber *userID_;//用户ID
    NSNumber *flag_;// 1 : 发送; 2 : 接收
    NSNumber *sendState_;// 0 :发送中 ;1发送成功 2发送失败 
    NSNumber *date_;//发送或者接受的时间
    NSNumber *isReaded_;//是否已读
    NSString *msgText_;//消息文本内容
    NSNumber *contentType_;//内容类型
    NSString *locationInfo_;//地理位置信息
    NSNumber *attachResID_;//附件对应的资源ID

}

@property (strong,nonatomic) NSNumber *msgID;
@property (strong,nonatomic) NSNumber *msgGroupID;
@property (strong,nonatomic) NSString *msgServerID;
@property (strong,nonatomic) NSString *mobile;
@property (strong,nonatomic) NSNumber *userID;
@property (strong,nonatomic) NSNumber *flag;
@property (strong,nonatomic) NSNumber *sendState;
@property (strong,nonatomic) NSNumber *date;
@property (strong,nonatomic) NSNumber *isReaded;
@property (strong,nonatomic) NSString *msgText;
@property (strong,nonatomic) NSNumber *contentType;
@property (strong,nonatomic) NSString *locationInfo;
@property (strong,nonatomic) NSNumber *attachResID;

@end
