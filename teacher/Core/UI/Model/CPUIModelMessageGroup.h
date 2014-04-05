#import <Foundation/Foundation.h>


/**
 * 群组
 */
typedef enum 
{
    MSG_GROUP_UI_TYPE_DEFAULT = 0,
    MSG_GROUP_UI_TYPE_SINGLE  = 1,//单聊
    MSG_GROUP_UI_TYPE_MULTI   = 2,//多人会话
    MSG_GROUP_UI_TYPE_CONVER  = 3,//群聊
    MSG_GROUP_UI_TYPE_SINGLE_PRE  = 11,//
    MSG_GROUP_UI_TYPE_MULTI_PRE   = 12,//
    MSG_GROUP_UI_TYPE_CONVER_PRE  = 13,//
}
MsgGroupUIType;

typedef enum 
{
    MSG_GROUP_UI_RELATION_TYPE_DEFAULT = 0,
    MSG_GROUP_UI_RELATION_TYPE_COMMON  = 1,//好友的会话
    MSG_GROUP_UI_RELATION_TYPE_CLOSER  = 2,//密友的会话
    MSG_GROUP_UI_RELATION_TYPE_COUPLE  = 3//couple的会话
}
MsgGroupUIRelationType;

@class CPUIModelMessageGroupMember;
@interface CPUIModelMessageGroup : NSObject
{

    NSNumber *msgGroupID_;//主键,本地数据库
    NSNumber *type_;//群的类型，0单聊群，虚拟的群组  1普通群  2couple
    NSNumber *relationType_;//
    NSString *groupServerID_;//服务器对应的ID
    NSString *groupName_;//群名，某些类型可能没有名称
    NSNumber *groupHeaderResID_;//群头像对应的资源ID
    NSNumber *memoID_;//
    NSNumber *updateDate_;//group更新的时间
    NSString *creatorName_;//创建者的account
    NSNumber *unReadedCount_;//未读数
    
    NSArray *memberList_;
    NSArray *msgList_;
    
    NSArray *searchTextArray_;//字符的数组
    NSArray *searchTextPinyinArray_;//全拼的数组
    NSString *searchTextQuanPinWithChar_;//全拼的字符串
    NSString *searchTextQuanPinWithInt_;//全拼unicode数值的字符串
}

@property (strong,nonatomic) NSNumber *msgGroupID;
@property (strong,nonatomic) NSNumber *type;
@property (strong,nonatomic) NSNumber *relationType;
@property (strong,nonatomic) NSString *groupServerID;
@property (strong,nonatomic) NSString *groupName;
@property (strong,nonatomic) NSNumber *groupHeaderResID;
@property (strong,nonatomic) NSNumber *memoID;
@property (strong,nonatomic) NSNumber *updateDate;
@property (strong,nonatomic) NSString *creatorName;
@property (strong,nonatomic) NSNumber *unReadedCount;
@property (strong,nonatomic) NSArray *memberList;
@property (strong,nonatomic) NSArray *msgList;
@property (strong,nonatomic) NSArray *searchTextArray;
@property (strong,nonatomic) NSArray *searchTextPinyinArray;
@property (strong,nonatomic) NSString *searchTextQuanPinWithChar;
@property (strong,nonatomic) NSString *searchTextQuanPinWithInt;


-(NSInteger)msgGroupMemberRelation;//获取单聊的成员relation

-(NSComparisonResult) orderMsgGroupWithDate:(CPUIModelMessageGroup *)userMsgGroup;

-(NSString *)getMemHeaderWithName:(NSString *)userName;//根据account name获取此消息发送者的头像路径
-(CPUIModelMessageGroupMember *)getGroupMemWithName:(NSString *)userName;//根据userName获取对应的群成员信息，如果是自己，里面只有userName

-(BOOL)isMsgSingleGroup;//
-(BOOL)isMsgMultiGroup;//
-(BOOL)isMsgMultiConver;//
-(BOOL)isMsgConverGroup;//
-(void)initSearchData;

-(BOOL)isSysMsgGroup;
-(BOOL)isFriendCommonMsgGroup;//好友的group
-(BOOL)isFriendClosedMsgGroup;//密友的group
@end
