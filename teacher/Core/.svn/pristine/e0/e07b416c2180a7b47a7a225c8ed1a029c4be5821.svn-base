#import "CPDAOUserInfoDataAddition.h"

#import "CPDBModelUserInfoDataAddition.h"


/**
 * 用户信息附加数据
 */

@implementation CPDAOUserInfoDataAddition

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createUserInfoDataAdditionTable];
        }
    }
    return self;
}

-(void)createUserInfoDataAdditionTable
{
    [db executeUpdate:@"CREATE TABLE user_info_data_addition (id INTEGER PRIMARY KEY  AUTOINCREMENT,user_info_data_id INTEGER,user_info_id INTEGER,data_classify INTEGER,data_type INTEGER,data_content TEXT,resource_id INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertUserInfoDataAddition:(CPDBModelUserInfoDataAddition *)dbUserInfoDataAddition
{
    [db executeUpdate:@"insert into user_info_data_addition (user_info_data_id,user_info_id,data_classify,data_type,data_content,resource_id) values (?,?,?,?,?,?)",
        dbUserInfoDataAddition.userInfoDataID,dbUserInfoDataAddition.userInfoID,dbUserInfoDataAddition.dataClassify,dbUserInfoDataAddition.dataType,dbUserInfoDataAddition.dataContent,dbUserInfoDataAddition.resourceID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateUserInfoDataAdditionWithID:(NSNumber *)objID  obj:(CPDBModelUserInfoDataAddition *)dbUserInfoDataAddition
{
    [db executeUpdate:@"update user_info_data_addition set user_info_data_id=?,user_info_id=?,data_classify=?,data_type=?,data_content=?,resource_id=? where id =?",
dbUserInfoDataAddition.userInfoDataID,dbUserInfoDataAddition.userInfoID,dbUserInfoDataAddition.dataClassify,dbUserInfoDataAddition.dataType,dbUserInfoDataAddition.dataContent,dbUserInfoDataAddition.resourceID,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelUserInfoDataAddition *)getUserInfoDataAdditionWithResultSet:(FMResultSet *)rs
{
    CPDBModelUserInfoDataAddition *dbUserInfoDataAddition = [[CPDBModelUserInfoDataAddition alloc] init];
    [dbUserInfoDataAddition setId:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbUserInfoDataAddition setUserInfoDataID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"user_info_data_id"]]];
    [dbUserInfoDataAddition setUserInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"user_info_id"]]];
    [dbUserInfoDataAddition setDataClassify:[NSNumber numberWithInt:[rs intForColumn:@"data_classify"]]];
    [dbUserInfoDataAddition setDataType:[NSNumber numberWithInt:[rs intForColumn:@"data_type"]]];
    [dbUserInfoDataAddition setDataContent:[rs stringForColumn:@"data_content"]];
    [dbUserInfoDataAddition setResourceID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"resource_id"]]];
    return dbUserInfoDataAddition;
}
-(CPDBModelUserInfoDataAddition *)findUserInfoDataAdditionWithID:(NSNumber *)id
{
    CPDBModelUserInfoDataAddition *reUserInfoDataAddition = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from user_info_data_addition where id = ?",id];
        if ([rs next])
        {
            reUserInfoDataAddition = [self getUserInfoDataAdditionWithResultSet:rs];
        }
        [rs close];
    }
    return reUserInfoDataAddition;
}
-(NSArray *)findAllUserInfoDataAdditions
{
    FMResultSet *rs = [db executeQuery:@"select * from user_info_data_addition"];
    NSMutableArray *UserInfoDataAdditionList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [UserInfoDataAdditionList addObject:[self getUserInfoDataAdditionWithResultSet:rs]];
    }
    [rs close];
    return UserInfoDataAdditionList;
}

@end

