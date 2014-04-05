#import "CPDAOBabyInfoData.h"

#import "CPDBModelBabyInfoData.h"


/**
 * 宝宝信息数据
 */

@implementation CPDAOBabyInfoData

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createBabyInfoDataTable];
        }
    }
    return self;
}

-(void)createBabyInfoDataTable
{
    [db executeUpdate:@"CREATE TABLE baby_info_data (id INTEGER PRIMARY KEY  AUTOINCREMENT,user_info_id INTEGER,name INTEGER,sex INTEGER,header_res_id INTEGER,birthday INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertBabyInfoData:(CPDBModelBabyInfoData *)dbBabyInfoData
{
    [db executeUpdate:@"insert into baby_info_data (user_info_id,name,sex,header_res_id,birthday) values (?,?,?,?,?)",
        dbBabyInfoData.userInfoID,dbBabyInfoData.name,dbBabyInfoData.sex,dbBabyInfoData.headerResID,dbBabyInfoData.birthday];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateBabyInfoDataWithID:(NSNumber *)objID  obj:(CPDBModelBabyInfoData *)dbBabyInfoData
{
    [db executeUpdate:@"update baby_info_data set user_info_id=?,name=?,sex=?,header_res_id=?,birthday=? where id =?",
dbBabyInfoData.userInfoID,dbBabyInfoData.name,dbBabyInfoData.sex,dbBabyInfoData.headerResID,dbBabyInfoData.birthday,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelBabyInfoData *)getBabyInfoDataWithResultSet:(FMResultSet *)rs
{
    CPDBModelBabyInfoData *dbBabyInfoData = [[CPDBModelBabyInfoData alloc] init];
    [dbBabyInfoData setBabyInfoDataID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbBabyInfoData setUserInfoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"user_info_id"]]];
    [dbBabyInfoData setName:[NSNumber numberWithInt:[rs intForColumn:@"name"]]];
    [dbBabyInfoData setSex:[NSNumber numberWithInt:[rs intForColumn:@"sex"]]];
    [dbBabyInfoData setHeaderResID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"header_res_id"]]];
    [dbBabyInfoData setBirthday:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"birthday"]]];
    return dbBabyInfoData;
}
-(CPDBModelBabyInfoData *)findBabyInfoDataWithID:(NSNumber *)id
{
    CPDBModelBabyInfoData *reBabyInfoData = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from baby_info_data where id = ?",id];
        if ([rs next])
        {
            reBabyInfoData = [self getBabyInfoDataWithResultSet:rs];
        }
        [rs close];
    }
    return reBabyInfoData;
}
-(NSArray *)findAllBabyInfoDatas
{
    FMResultSet *rs = [db executeQuery:@"select * from baby_info_data"];
    NSMutableArray *BabyInfoDataList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [BabyInfoDataList addObject:[self getBabyInfoDataWithResultSet:rs]];
    }
    [rs close];
    return BabyInfoDataList;
}

@end

