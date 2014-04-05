#import "CPDAOUserInfo.h"

#import "CPDBModelUserInfo.h"
#import "CPDBModelResource.h"
#import "CoreUtils.h"
#import "CPSystemEngine.h"
/**
 * 用户信息表
 */

@implementation CPDAOUserInfo

- (void) initilizeData
{
//    CPDBModelUserInfo * systemUserShuangShuang = [[CPDBModelUserInfo alloc]init];
//    [systemUserShuangShuang setName:@"shuangshuang"];
//    [systemUserShuangShuang setNickName:NSLocalizedString(@"SysUserCoupleTeam",nil)];
//    [systemUserShuangShuang setType:[NSNumber numberWithInt:101]];
//    [systemUserShuangShuang setSex:[NSNumber numberWithInt:0]];
//    [systemUserShuangShuang setLifeStatus:[NSNumber numberWithInt:0]];
//    [systemUserShuangShuang setDomain:@"@chat1.ishuangshuang.com"];
//    [systemUserShuangShuang setUpdateTime:[CoreUtils getLongFormatWithNowDate ]];
//    NSNumber * result = [self insertUserInfo:systemUserShuangShuang];
//    
//    CPDBModelUserInfo * systemUserSystem = [[CPDBModelUserInfo alloc]init];
//    [systemUserSystem setName:@"system"];
//    [systemUserSystem setNickName:NSLocalizedString(@"SysUserSysMsg",nil)];
//    [systemUserSystem setType:[NSNumber numberWithInt:102]];
//    [systemUserSystem setSex:[NSNumber numberWithInt:0]];
//    [systemUserSystem setLifeStatus:[NSNumber numberWithInt:0]];
//    [systemUserSystem setDomain:@"@chat1.ishuangshuang.com"];
//    [systemUserSystem setUpdateTime:[CoreUtils getLongFormatWithNowDate ]];
//    result = [self insertUserInfo:systemUserSystem];
//    
//    
//    CPDBModelUserInfo * systemUserXiaoShuang = [[CPDBModelUserInfo alloc]init];
//    [systemUserXiaoShuang setName:@"xiaoshuang"];
//    [systemUserXiaoShuang setNickName:NSLocalizedString(@"SysUserXiaoShuang",nil)];
//    [systemUserXiaoShuang setType:[NSNumber numberWithInt:103]];
//    [systemUserXiaoShuang setSex:[NSNumber numberWithInt:0]];
//    [systemUserXiaoShuang setLifeStatus:[NSNumber numberWithInt:0]];
//    [systemUserXiaoShuang setDomain:@"@chat1.ishuangshuang.com"];
//    [systemUserXiaoShuang setUpdateTime:[CoreUtils getLongFormatWithNowDate ]];
//    result = [self insertUserInfo:systemUserXiaoShuang];
    
}

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createUserInfoTable];
            [self initilizeData];
        }
    }
    return self;
}

-(void)createUserInfoTable
{
    [db executeUpdate:@"CREATE TABLE user_info (id INTEGER PRIMARY KEY  AUTOINCREMENT,server_id INTEGER,update_time INTEGER,type INTEGER,name TEXT,nick_name TEXT,mobile_number TEXT,mobile_is_bind INTEGER,email_addr TEXT,email_is_bind INTEGER,sex INTEGER,life_status INTEGER,birthday TEXT,height INTEGER,weight INTEGER,three_sizes TEXT, citys TEXT,anniversary_meet TEXT,anniversary_marry TEXT,anniversary_dating TEXT,baby_name TEXT,domain TEXT,single_time INTEGER,has_baby INTEGER,couple_nick_name TEXT)"];
    [db executeUpdate:@"CREATE TABLE user_relation (own_account TEXT not null ,relation_account TEXT not null,type INTEGER) "];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertUserInfo:(CPDBModelUserInfo *)dbUserInfo
{
    if (!dbUserInfo.type) 
    {
        [dbUserInfo setType:[NSNumber numberWithInt:USER_RELATION_DEFAULT]];
    }
    if (!dbUserInfo.updateTime)
    {
        [dbUserInfo setUpdateTime:[CoreUtils getLongFormatWithNowDate]];
    }
    if (dbUserInfo.name)
    {
        [db executeUpdate:@"delete from user_info where name=?",dbUserInfo.name];
    }
    [db executeUpdate:@"insert into user_info (server_id,update_time,type,name,nick_name,mobile_number,mobile_is_bind,email_addr,email_is_bind,sex,life_status,birthday,height,weight,three_sizes, citys,anniversary_meet,anniversary_marry,anniversary_dating,baby_name,domain,single_time,has_baby,couple_nick_name) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        dbUserInfo.serverID,dbUserInfo.updateTime,dbUserInfo.type,dbUserInfo.name,dbUserInfo.nickName,dbUserInfo.mobileNumber,dbUserInfo.mobileIsBind,dbUserInfo.emailAddr,dbUserInfo.emailIsBind,dbUserInfo.sex,dbUserInfo.lifeStatus,dbUserInfo.birthday,dbUserInfo.height,dbUserInfo.weight,dbUserInfo.threeSizes,dbUserInfo.citys,dbUserInfo.anniversaryMeet,dbUserInfo.anniversaryMarry,dbUserInfo.anniversaryDating,dbUserInfo.babyName,dbUserInfo.domain,dbUserInfo.singleTime,dbUserInfo.hasBaby,dbUserInfo.coupleNickName];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateUserInfoWithID:(NSNumber *)objID  obj:(CPDBModelUserInfo *)dbUserInfo
{
    [db executeUpdate:@"update user_info set server_id=?,update_time=?,type=?,name=?,nick_name=?,mobile_number=?,mobile_is_bind=?,email_addr=?,email_is_bind=?,sex=?,life_status=?,birthday=?,height=?,weight=?,three_sizes=?, citys=?,anniversary_meet=?,anniversary_marry=?,anniversary_dating=?,baby_name=?,domain=?,single_time=?,has_baby=?,couple_nick_name=?  where id =?",
dbUserInfo.serverID,dbUserInfo.updateTime,dbUserInfo.type,dbUserInfo.name,dbUserInfo.nickName,dbUserInfo.mobileNumber,dbUserInfo.mobileIsBind,dbUserInfo.emailAddr,dbUserInfo.emailIsBind,dbUserInfo.sex,dbUserInfo.lifeStatus,dbUserInfo.birthday,dbUserInfo.height,dbUserInfo.weight,dbUserInfo.threeSizes,dbUserInfo.citys,dbUserInfo.anniversaryMeet,dbUserInfo.anniversaryMarry,dbUserInfo.anniversaryDating,dbUserInfo.babyName,dbUserInfo.domain,dbUserInfo.singleTime,dbUserInfo.hasBaby,dbUserInfo.coupleNickName,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSString *)getCoupleNameWithName:(NSString *)accountName
{
    NSString *coupleName = nil;
    if (accountName)
    {
        FMResultSet *rs = [db executeQuery:@"select relation_account from user_relation where own_account = ?",accountName];
        if ([rs next])
        {
            coupleName = [rs stringForColumn:@"relation_account"];
        }
        [rs close];
    }
    return coupleName;
}
-(CPDBModelUserInfo *)getUserInfoWithResultSet:(FMResultSet *)rs
{
    CPDBModelUserInfo *dbUserInfo = [[CPDBModelUserInfo alloc] init];
    [dbUserInfo setUserInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbUserInfo setServerID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"server_id"]]];
    [dbUserInfo setUpdateTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_time"]]];
    [dbUserInfo setType:[NSNumber numberWithInt:[rs intForColumn:@"type"]]];
    [dbUserInfo setName:[rs stringForColumn:@"name"]];
    [dbUserInfo setNickName:[rs stringForColumn:@"nick_name"]];
    [dbUserInfo setMobileNumber:[rs stringForColumn:@"mobile_number"]];
    [dbUserInfo setMobileIsBind:[NSNumber numberWithInt:[rs intForColumn:@"mobile_is_bind"]]];
    [dbUserInfo setEmailAddr:[rs stringForColumn:@"email_addr"]];
    [dbUserInfo setEmailIsBind:[NSNumber numberWithInt:[rs intForColumn:@"email_is_bind"]]];
    [dbUserInfo setSex:[NSNumber numberWithInt:[rs intForColumn:@"sex"]]];
    [dbUserInfo setLifeStatus:[NSNumber numberWithInt:[rs intForColumn:@"life_status"]]];
    [dbUserInfo setBirthday:[rs stringForColumn:@"birthday"]];
    [dbUserInfo setHeight:[NSNumber numberWithInt:[rs intForColumn:@"height"]]];
    [dbUserInfo setWeight:[NSNumber numberWithInt:[rs intForColumn:@"weight"]]];
    [dbUserInfo setThreeSizes:[rs stringForColumn:@"three_sizes"]];
    [dbUserInfo setCitys:[rs stringForColumn:@"citys"]];
    [dbUserInfo setAnniversaryMeet:[rs stringForColumn:@"anniversary_meet"]];
    [dbUserInfo setAnniversaryMarry:[rs stringForColumn:@"anniversary_marry"]];
    [dbUserInfo setAnniversaryDating:[rs stringForColumn:@"anniversary_dating"]];
    [dbUserInfo setBabyName:[rs stringForColumn:@"baby_name"]];
    [dbUserInfo setDomain:[rs stringForColumn:@"domain"]];
    [dbUserInfo setSingleTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"single_time"]]];
    [dbUserInfo setHasBaby:[NSNumber numberWithInt:[rs intForColumn:@"has_baby"]]];
    [dbUserInfo setCoupleNickName:[rs stringForColumn:@"couple_nick_name"]];
    NSString *coupleName = [self getCoupleNameWithName:dbUserInfo.name];
        
    if (coupleName)
    {
        [dbUserInfo setCoupleAccount:coupleName];
    }
    return dbUserInfo;
}
-(CPDBModelUserInfo *)findUserInfoWithID:(NSNumber *)id
{
    CPDBModelUserInfo *reUserInfo = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from user_info where id = ?",id];
        if ([rs next])
        {
            reUserInfo = [self getUserInfoWithResultSet:rs];
        }
        [rs close];
    }
    return reUserInfo;
}
-(NSArray *)findAllUserInfos
{
    FMResultSet *rs = [db executeQuery:@"select * from user_info"];
    NSMutableArray *UserInfoList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [UserInfoList addObject:[self getUserInfoWithResultSet:rs]];
    }
    [rs close];
    return UserInfoList;
}
-(NSArray *)findAllUserInfosOrderByID
{
    FMResultSet *rs = [db executeQuery:@"select * from user_info order by id asc"];
    NSMutableArray *UserInfoList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [UserInfoList addObject:[self getUserInfoWithResultSet:rs]];
    }
    [rs close];
    return UserInfoList;
}

-(NSArray *)findAllUserCommendInfos
{
    FMResultSet *rs = [db executeQuery:@"select * from user_info where type=?",[NSNumber numberWithInt:USER_RELATION_COMMEND]];
    NSMutableArray *UserInfoList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [UserInfoList addObject:[self getUserInfoWithResultSet:rs]];
    }
    [rs close];
    return UserInfoList;
}
-(CPDBModelUserInfo *)findUserInfoWithAccount:(NSString *)account
{
    CPDBModelUserInfo *reUserInfo = nil;
    if (account)
    {
        FMResultSet *rs = [db executeQuery:@"select * from user_info where name = ?",account];
        if ([rs next])
        {
            reUserInfo = [self getUserInfoWithResultSet:rs];
        }
        [rs close];
    }
    return reUserInfo;
}

-(void)deleteRelationWithUserAccount:(NSString *)accountName
{
    [db executeUpdate:@"delete from user_relation where own_account=?",accountName];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteUserWithAccount:(NSString *)accountName
{
    [db executeUpdate:@"delete from user_relation where own_account=? or relation_account=?",accountName,accountName];
    [db executeUpdate:@"delete from user_info where name=?",accountName];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateUserRelationWithUserName:(NSString *)accountName relationType:(NSNumber *)type
{
    [db executeUpdate:@"update user_relation set type=?  where own_account=? or relation_account=?",type,accountName,accountName];
    [db executeUpdate:@"update user_info set type=?  where name=?",type,accountName];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteAllUserInfos
{
    [db executeUpdate:@"delete from user_info"];
    [db executeUpdate:@"delete from user_relation"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteFriendUserInfos
{
    [db executeUpdate:@"delete from user_info where type<?",[NSNumber numberWithInt:USER_RELATION_COMMEND]];
    [db executeUpdate:@"delete from user_relation"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteUserInfoWithAccount:(NSString *)account
{
    [db executeUpdate:@"delete from user_info where name=?",account];
    [db executeUpdate:@"delete from user_relation where own_account = ? or relation_account=?",account,account];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)addRelationWithUserAccount:(NSString *)userAccount relation_account:(NSString *)relationAccount relation_type:(NSInteger)type
{
    [db executeUpdate:@"insert into user_relation (own_account,relation_account,type)  values (?,?,?)",userAccount,relationAccount,[NSNumber numberWithInt:type]];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
@end

