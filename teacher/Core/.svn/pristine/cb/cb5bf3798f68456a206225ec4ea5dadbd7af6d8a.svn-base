#import "CPDAOUserInfoData.h"

#import "CPDBModelUserInfoData.h"
#import "CPSystemEngine.h"
/**
 * 用户信息数据
 */

@implementation CPDAOUserInfoData


- (void) initilizeData
{
    CPDBModelUserInfoData *shuangshuangUserInfoData = [[CPDBModelUserInfoData alloc] init];
    [shuangshuangUserInfoData setDataClassify:[NSNumber numberWithInt:USER_DATA_CLASSIFY_HEADER]];
    [shuangshuangUserInfoData setUserInfoID:[NSNumber numberWithInt:1]];
    [shuangshuangUserInfoData setResourceID:[NSNumber numberWithInt:1]];
    [shuangshuangUserInfoData setDataType:[NSNumber numberWithInt:USER_DATA_TYPE_IMG]];
    NSNumber * result = [self insertUserInfoData:shuangshuangUserInfoData];
    
    CPDBModelUserInfoData *systemUserInfoData = [[CPDBModelUserInfoData alloc] init];
    [systemUserInfoData setDataClassify:[NSNumber numberWithInt:USER_DATA_CLASSIFY_HEADER]];
    [systemUserInfoData setUserInfoID:[NSNumber numberWithInt:2]];
    [systemUserInfoData setResourceID:[NSNumber numberWithInt:2]];
    [systemUserInfoData setDataType:[NSNumber numberWithInt:USER_DATA_TYPE_IMG]];
    result = [self insertUserInfoData:systemUserInfoData];
    
    
    CPDBModelUserInfoData *xiaoshuangUserInfoData = [[CPDBModelUserInfoData alloc] init];
    [xiaoshuangUserInfoData setDataClassify:[NSNumber numberWithInt:USER_DATA_CLASSIFY_HEADER]];
    [xiaoshuangUserInfoData setUserInfoID:[NSNumber numberWithInt:3]];
    [xiaoshuangUserInfoData setResourceID:[NSNumber numberWithInt:3]];
    [xiaoshuangUserInfoData setDataType:[NSNumber numberWithInt:USER_DATA_TYPE_IMG]];
    result = [self insertUserInfoData:xiaoshuangUserInfoData];
    
}
- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createUserInfoDataTable];
            [self initilizeData];
        }
    }
    return self;
}

-(void)createUserInfoDataTable
{
    [db executeUpdate:@"CREATE TABLE user_info_data (id INTEGER PRIMARY KEY  AUTOINCREMENT,user_info_id INTEGER,data_classify INTEGER,data_type INTEGER,data_content TEXT,resource_id INTEGER,update_time INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertUserInfoData:(CPDBModelUserInfoData *)dbUserInfoData
{
    [db executeUpdate:@"insert into user_info_data (user_info_id,data_classify,data_type,data_content,resource_id,update_time) values (?,?,?,?,?,?)",
        dbUserInfoData.userInfoID,dbUserInfoData.dataClassify,dbUserInfoData.dataType,dbUserInfoData.dataContent,dbUserInfoData.resourceID,dbUserInfoData.updateTime];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateUserInfoDataWithID:(NSNumber *)objID  obj:(CPDBModelUserInfoData *)dbUserInfoData
{
    [db executeUpdate:@"update user_info_data set user_info_id=?,data_classify=?,data_type=?,data_content=?,resource_id=?,update_time=? where id =?",
dbUserInfoData.userInfoID,dbUserInfoData.dataClassify,dbUserInfoData.dataType,dbUserInfoData.dataContent,dbUserInfoData.resourceID,dbUserInfoData.updateTime,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelUserInfoData *)getUserInfoDataWithResultSet:(FMResultSet *)rs
{
    CPDBModelUserInfoData *dbUserInfoData = [[CPDBModelUserInfoData alloc] init];
    [dbUserInfoData setUserInfoDataID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbUserInfoData setUserInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"user_info_id"]]];
    [dbUserInfoData setDataClassify:[NSNumber numberWithInt:[rs intForColumn:@"data_classify"]]];
    [dbUserInfoData setDataType:[NSNumber numberWithInt:[rs intForColumn:@"data_type"]]];
    [dbUserInfoData setDataContent:[rs stringForColumn:@"data_content"]];
    [dbUserInfoData setResourceID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"resource_id"]]];
    [dbUserInfoData setUpdateTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_time"]]];
    return dbUserInfoData;
}
-(CPDBModelUserInfoData *)findUserInfoDataWithID:(NSNumber *)id
{
    CPDBModelUserInfoData *reUserInfoData = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from user_info_data where id = ?",id];
        if ([rs next])
        {
            reUserInfoData = [self getUserInfoDataWithResultSet:rs];
        }
        [rs close];
    }
    return reUserInfoData;
}
-(NSArray *)findAllUserInfoDatas
{
    FMResultSet *rs = [db executeQuery:@"select * from user_info_data"];
    NSMutableArray *UserInfoDataList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [UserInfoDataList addObject:[self getUserInfoDataWithResultSet:rs]];
    }
    [rs close];
    return UserInfoDataList;
}
-(NSArray *)findAllUserInfoDatasOrderByInfoID
{
    FMResultSet *rs = [db executeQuery:@"select * from user_info_data order by user_info_id asc"];
    NSMutableArray *UserInfoDataList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [UserInfoDataList addObject:[self getUserInfoDataWithResultSet:rs]];
    }
    [rs close];
    return UserInfoDataList;
}
-(void)deleteAllUserDatas
{
    [db executeUpdate:@"delete from user_info_data,user_info where user_info.id = user_info_data.user_info_id and user_info.type!=?",[NSNumber numberWithInt:6]];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteUserDataWithUserName:(NSString *)userName
{
    [db executeUpdate:@"delete from user_info_data ,user_info where user_info.id = user_info_data.user_info_id and  user_info.name = ?",userName];
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
-(CPDBModelUserInfoData *)findUserInfoDataWithUserID:(NSNumber *)userID andClassify:(NSNumber *)classify
{
    CPDBModelUserInfoData *reUserInfoData = nil;
    if (userID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from user_info_data where user_info_id = ? and data_classify=?",userID,classify];
        if ([rs next])
        {
            reUserInfoData = [self getUserInfoDataWithResultSet:rs];
        }
        [rs close];
    }
    return reUserInfoData;
}

-(NSArray *)findUserInfoDatasWithUserID:(NSNumber *)userID
{
    NSMutableArray *userInfoDataList = [[NSMutableArray alloc] init];
    if (userID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from user_info_data where user_info_id = ?",userID];
        while ([rs next])
        {
            CPDBModelUserInfoData *reUserInfoData = [self getUserInfoDataWithResultSet:rs];
            [userInfoDataList addObject:reUserInfoData];
        }
        [rs close];
    }
    return userInfoDataList;
}
@end

