#import "CPDAOPersonalInfoData.h"

#import "CPDBModelPersonalInfoData.h"


/**
 * 个人信息数据
 */

@implementation CPDAOPersonalInfoData

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createPersonalInfoDataTable];
        }
    }
    return self;
}

-(void)createPersonalInfoDataTable
{
    [db executeUpdate:@"CREATE TABLE personal_info_data (id INTEGER PRIMARY KEY  AUTOINCREMENT,personal_info_id INTEGER,data_classify INTEGER,data_type INTEGER,data_content TEXT,resource_id INTEGER,update_time INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertPersonalInfoData:(CPDBModelPersonalInfoData *)dbPersonalInfoData
{
    [db executeUpdate:@"insert into personal_info_data (personal_info_id,data_classify,data_type,data_content,resource_id,update_time) values (?,?,?,?,?,?)",
        dbPersonalInfoData.personalInfoID,dbPersonalInfoData.dataClassify,dbPersonalInfoData.dataType,dbPersonalInfoData.dataContent,dbPersonalInfoData.resourceID,dbPersonalInfoData.updateTime];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updatePersonalInfoDataWithID:(NSNumber *)objID  obj:(CPDBModelPersonalInfoData *)dbPersonalInfoData
{
    [db executeUpdate:@"update personal_info_data set personal_info_id=?,data_classify=?,data_type=?,data_content=?,resource_id=?,update_time=? where id =?",
dbPersonalInfoData.personalInfoID,dbPersonalInfoData.dataClassify,dbPersonalInfoData.dataType,dbPersonalInfoData.dataContent,dbPersonalInfoData.resourceID,dbPersonalInfoData.updateTime,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelPersonalInfoData *)getPersonalInfoDataWithResultSet:(FMResultSet *)rs
{
    CPDBModelPersonalInfoData *dbPersonalInfoData = [[CPDBModelPersonalInfoData alloc] init];
    [dbPersonalInfoData setPersonalInfoDataID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbPersonalInfoData setPersonalInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"personal_info_id"]]];
    [dbPersonalInfoData setDataClassify:[NSNumber numberWithInt:[rs intForColumn:@"data_classify"]]];
    [dbPersonalInfoData setDataType:[NSNumber numberWithInt:[rs intForColumn:@"data_type"]]];
    [dbPersonalInfoData setDataContent:[rs stringForColumn:@"data_content"]];
    [dbPersonalInfoData setResourceID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"resource_id"]]];
    [dbPersonalInfoData setUpdateTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_time"]]];
    return dbPersonalInfoData;
}
-(CPDBModelPersonalInfoData *)findPersonalInfoDataWithID:(NSNumber *)id
{
    CPDBModelPersonalInfoData *rePersonalInfoData = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from personal_info_data where id = ?",id];
        if ([rs next])
        {
            rePersonalInfoData = [self getPersonalInfoDataWithResultSet:rs];
        }
        [rs close];
    }
    return rePersonalInfoData;
}
-(NSArray *)findAllPersonalInfoDatas
{
    FMResultSet *rs = [db executeQuery:@"select * from personal_info_data"];
    NSMutableArray *PersonalInfoDataList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [PersonalInfoDataList addObject:[self getPersonalInfoDataWithResultSet:rs]];
    }
    [rs close];
    return PersonalInfoDataList;
}
-(NSArray *)findAllPersonalInfoDatasWithPersonalID:(NSNumber *)personalID
{
    FMResultSet *rs = [db executeQuery:@"select * from personal_info_data where personal_info_id=?",personalID];
    NSMutableArray *PersonalInfoDataList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [PersonalInfoDataList addObject:[self getPersonalInfoDataWithResultSet:rs]];
    }
    [rs close];
    return PersonalInfoDataList;
}
-(CPDBModelPersonalInfoData *)findPersonalInfoDataWithPersonalID:(NSNumber *)personalID andClassify:(NSNumber *)classify
{
    CPDBModelPersonalInfoData *rePersonalInfoData = nil;
    if (personalID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from personal_info_data where personal_info_id = ? and data_classify=?",personalID,classify];
        if ([rs next])
        {
            rePersonalInfoData = [self getPersonalInfoDataWithResultSet:rs];
        }
        [rs close];
    }
    return rePersonalInfoData;
}
@end

