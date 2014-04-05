#import "CPDAOPersonalInfoDataAddition.h"

#import "CPDBModelPersonalInfoDataAddition.h"


/**
 * 个人信息附加数据
 */

@implementation CPDAOPersonalInfoDataAddition

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createPersonalInfoDataAdditionTable];
        }
    }
    return self;
}

-(void)createPersonalInfoDataAdditionTable
{
    [db executeUpdate:@"CREATE TABLE personal_info_data_addition (id INTEGER PRIMARY KEY  AUTOINCREMENT,personal_info_data_id INTEGER,personal_info_id INTEGER,data_classify INTEGER,data_type INTEGER,data_content TEXT,resource_id INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertPersonalInfoDataAddition:(CPDBModelPersonalInfoDataAddition *)dbPersonalInfoDataAddition
{
    [db executeUpdate:@"insert into personal_info_data_addition (personal_info_data_id,personal_info_id,data_classify,data_type,data_content,resource_id) values (?,?,?,?,?,?)",
        dbPersonalInfoDataAddition.personalInfoDataID,dbPersonalInfoDataAddition.personalInfoID,dbPersonalInfoDataAddition.dataClassify,dbPersonalInfoDataAddition.dataType,dbPersonalInfoDataAddition.dataContent,dbPersonalInfoDataAddition.resourceID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updatePersonalInfoDataAdditionWithID:(NSNumber *)objID  obj:(CPDBModelPersonalInfoDataAddition *)dbPersonalInfoDataAddition
{
    [db executeUpdate:@"update personal_info_data_addition set personal_info_data_id=?,personal_info_id=?,data_classify=?,data_type=?,data_content=?,resource_id=? where id =?",
dbPersonalInfoDataAddition.personalInfoDataID,dbPersonalInfoDataAddition.personalInfoID,dbPersonalInfoDataAddition.dataClassify,dbPersonalInfoDataAddition.dataType,dbPersonalInfoDataAddition.dataContent,dbPersonalInfoDataAddition.resourceID,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelPersonalInfoDataAddition *)getPersonalInfoDataAdditionWithResultSet:(FMResultSet *)rs
{
    CPDBModelPersonalInfoDataAddition *dbPersonalInfoDataAddition = [[CPDBModelPersonalInfoDataAddition alloc] init];
    [dbPersonalInfoDataAddition setId:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbPersonalInfoDataAddition setPersonalInfoDataID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"personal_info_data_id"]]];
    [dbPersonalInfoDataAddition setPersonalInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"personal_info_id"]]];
    [dbPersonalInfoDataAddition setDataClassify:[NSNumber numberWithInt:[rs intForColumn:@"data_classify"]]];
    [dbPersonalInfoDataAddition setDataType:[NSNumber numberWithInt:[rs intForColumn:@"data_type"]]];
    [dbPersonalInfoDataAddition setDataContent:[rs stringForColumn:@"data_content"]];
    [dbPersonalInfoDataAddition setResourceID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"resource_id"]]];
    return dbPersonalInfoDataAddition;
}
-(CPDBModelPersonalInfoDataAddition *)findPersonalInfoDataAdditionWithID:(NSNumber *)id
{
    CPDBModelPersonalInfoDataAddition *rePersonalInfoDataAddition = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from personal_info_data_addition where id = ?",id];
        if ([rs next])
        {
            rePersonalInfoDataAddition = [self getPersonalInfoDataAdditionWithResultSet:rs];
        }
        [rs close];
    }
    return rePersonalInfoDataAddition;
}
-(NSArray *)findAllPersonalInfoDataAdditions
{
    FMResultSet *rs = [db executeQuery:@"select * from personal_info_data_addition"];
    NSMutableArray *PersonalInfoDataAdditionList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [PersonalInfoDataAdditionList addObject:[self getPersonalInfoDataAdditionWithResultSet:rs]];
    }
    [rs close];
    return PersonalInfoDataAdditionList;
}

@end

