#import "CPDAOPersonalInfo.h"

#import "CPDBModelPersonalInfo.h"


/**
 * 个人信息表
 */

@implementation CPDAOPersonalInfo

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createPersonalInfoTable];
        }
    }
    return self;
}

-(void)createPersonalInfoTable
{
    [db executeUpdate:@"CREATE TABLE personal_info (id INTEGER PRIMARY KEY  AUTOINCREMENT,server_id INTEGER,update_time INTEGER,name TEXT,nick_name TEXT,mobile_number TEXT,mobile_is_bind INTEGER,email_addr TEXT,email_is_bind INTEGER,sex INTEGER,life_status INTEGER,birthday TEXT,height INTEGER,weight INTEGER,three_sizes TEXT, citys TEXT,anniversary_meet TEXT,anniversary_marry TEXT,anniversary_dating TEXT,single_time INTEGER,has_baby INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertPersonalInfo:(CPDBModelPersonalInfo *)dbPersonalInfo
{
    [db executeUpdate:@"insert into personal_info (server_id,update_time,name,nick_name,mobile_number,mobile_is_bind,email_addr,email_is_bind,sex,life_status,birthday,height,weight,three_sizes, citys,anniversary_meet,anniversary_marry,anniversary_dating,single_time,has_baby) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        dbPersonalInfo.serverID,dbPersonalInfo.updateTime,dbPersonalInfo.name,dbPersonalInfo.nickName,dbPersonalInfo.mobileNumber,dbPersonalInfo.mobileIsBind,dbPersonalInfo.emailAddr,dbPersonalInfo.emailIsBind,dbPersonalInfo.sex,dbPersonalInfo.lifeStatus,dbPersonalInfo.birthday,dbPersonalInfo.height,dbPersonalInfo.weight,dbPersonalInfo.threeSizes,dbPersonalInfo.citys,dbPersonalInfo.anniversaryMeet,dbPersonalInfo.anniversaryMarry,dbPersonalInfo.anniversaryDating,dbPersonalInfo.singleTime,dbPersonalInfo.hasBaby];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updatePersonalInfoWithID:(NSNumber *)objID  obj:(CPDBModelPersonalInfo *)dbPersonalInfo
{
    [db executeUpdate:@"update personal_info set server_id=?,update_time=?,name=?,nick_name=?,mobile_number=?,mobile_is_bind=?,email_addr=?,email_is_bind=?,sex=?,life_status=?,birthday=?,height=?,weight=?,three_sizes=?, citys=?,anniversary_meet=?,anniversary_marry=?,anniversary_dating=?,single_time=?,has_baby=? where id =?",
dbPersonalInfo.serverID,dbPersonalInfo.updateTime,dbPersonalInfo.name,dbPersonalInfo.nickName,dbPersonalInfo.mobileNumber,dbPersonalInfo.mobileIsBind,dbPersonalInfo.emailAddr,dbPersonalInfo.emailIsBind,dbPersonalInfo.sex,dbPersonalInfo.lifeStatus,dbPersonalInfo.birthday,dbPersonalInfo.height,dbPersonalInfo.weight,dbPersonalInfo.threeSizes,dbPersonalInfo.citys,dbPersonalInfo.anniversaryMeet,dbPersonalInfo.anniversaryMarry,dbPersonalInfo.anniversaryDating,dbPersonalInfo.singleTime,dbPersonalInfo.hasBaby,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelPersonalInfo *)getPersonalInfoWithResultSet:(FMResultSet *)rs
{
    CPDBModelPersonalInfo *dbPersonalInfo = [[CPDBModelPersonalInfo alloc] init];
    [dbPersonalInfo setPersonalInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbPersonalInfo setServerID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"server_id"]]];
    [dbPersonalInfo setUpdateTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_time"]]];
    [dbPersonalInfo setName:[rs stringForColumn:@"name"]];
    [dbPersonalInfo setNickName:[rs stringForColumn:@"nick_name"]];
    [dbPersonalInfo setMobileNumber:[rs stringForColumn:@"mobile_number"]];
    [dbPersonalInfo setMobileIsBind:[NSNumber numberWithInt:[rs intForColumn:@"mobile_is_bind"]]];
    [dbPersonalInfo setEmailAddr:[rs stringForColumn:@"email_addr"]];
    [dbPersonalInfo setEmailIsBind:[NSNumber numberWithInt:[rs intForColumn:@"email_is_bind"]]];
    [dbPersonalInfo setSex:[NSNumber numberWithInt:[rs intForColumn:@"sex"]]];
    [dbPersonalInfo setLifeStatus:[NSNumber numberWithInt:[rs intForColumn:@"life_status"]]];
    [dbPersonalInfo setBirthday:[rs stringForColumn:@"birthday"]];
    [dbPersonalInfo setHeight:[NSNumber numberWithInt:[rs intForColumn:@"height"]]];
    [dbPersonalInfo setWeight:[NSNumber numberWithInt:[rs intForColumn:@"weight"]]];
    [dbPersonalInfo setThreeSizes:[rs stringForColumn:@"three_sizes"]];
    [dbPersonalInfo setCitys:[rs stringForColumn:@"citys"]];
    [dbPersonalInfo setAnniversaryMeet:[rs stringForColumn:@"anniversary_meet"]];
    [dbPersonalInfo setAnniversaryMarry:[rs stringForColumn:@"anniversary_marry"]];
    [dbPersonalInfo setAnniversaryDating:[rs stringForColumn:@"anniversary_dating"]];
    [dbPersonalInfo setSingleTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"single_time"]]];
    [dbPersonalInfo setHasBaby:[NSNumber numberWithInt:[rs intForColumn:@"has_baby"]]];
    return dbPersonalInfo;
}
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andName:(NSString *)nickName andSex:(NSNumber *)sex andHiddenBaby:(NSNumber *)isHiddenBaby
{
    [db executeUpdate:@"update personal_info set nick_name=?,sex=?,has_baby=? where id =?",nickName,sex,isHiddenBaby,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andName:(NSString *)nickName andSex:(NSNumber *)sex andLifeStatus:(NSNumber *)lifeStatus
{
    [db executeUpdate:@"update personal_info set nick_name=?,sex=?,life_status=? where id =?",nickName,sex,lifeStatus,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andSingleTime:(NSNumber *)singleTime
{
    [db executeUpdate:@"update personal_info set single_time=? where id =?",singleTime,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andHasBaby:(NSNumber *)hasBaby
{
    [db executeUpdate:@"update personal_info set has_baby=? where id =?",hasBaby,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelPersonalInfo *)findPersonalInfoWithID:(NSNumber *)id
{
    CPDBModelPersonalInfo *rePersonalInfo = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from personal_info where id = ?",id];
        if ([rs next])
        {
            rePersonalInfo = [self getPersonalInfoWithResultSet:rs];
        }
        [rs close];
    }
    return rePersonalInfo;
}
-(NSArray *)findAllPersonalInfos
{
    FMResultSet *rs = [db executeQuery:@"select * from personal_info"];
    NSMutableArray *PersonalInfoList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [PersonalInfoList addObject:[self getPersonalInfoWithResultSet:rs]];
    }
    [rs close];
    return PersonalInfoList;
}
-(void)deletePersonalInfos
{
    [db executeUpdate:@"delete from personal_info"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
@end

