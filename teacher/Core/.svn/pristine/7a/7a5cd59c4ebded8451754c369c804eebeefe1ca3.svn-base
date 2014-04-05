#import <Foundation/Foundation.h>


/**
 * 群组
 */

@interface CPPTModelMessageGroup : NSObject
{

    NSNumber *msgGroupID_;//主键,本地数据库
    NSNumber *type_;//群的类型，0单聊群，虚拟的群组  1普通群  2couple
    NSString *groupServerID_;//服务器对应的ID
    NSString *groupName_;//群名，某些类型可能没有名称
    NSNumber *groupHeaderResID_;//群头像对应的资源ID
    NSNumber *memoID_;//

    NSArray *memberList_;
    NSArray *msgList_;
}

@property (strong,nonatomic) NSNumber *msgGroupID;
@property (strong,nonatomic) NSNumber *type;
@property (strong,nonatomic) NSString *groupServerID;
@property (strong,nonatomic) NSString *groupName;
@property (strong,nonatomic) NSNumber *groupHeaderResID;
@property (strong,nonatomic) NSNumber *memoID;

@property (strong,nonatomic) NSArray *memberList;
@property (strong,nonatomic) NSArray *msgList;
@end
