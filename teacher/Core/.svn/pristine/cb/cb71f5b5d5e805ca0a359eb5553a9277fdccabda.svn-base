#import "CPDAOContactWay.h"

#import "CPDBModelContactWay.h"


/**
 * 联系方式
 */

@implementation CPDAOContactWay

- (id)init
{
    self = [super init];
    if(self)
    {
        if ([[CPDataBaseManager getInstance] statusAbCode]==1)
        {
            [self createContactWayTable];
        }
    }
    return self;
}

-(void)createContactWayTable
{
    [abDb executeUpdate:@"CREATE TABLE contact_way (id INTEGER PRIMARY KEY  AUTOINCREMENT,contact_id INTEGER,reg_type INTEGER,type INTEGER,name TEXT,value TEXT,region TEXT)"];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }
}
-(NSNumber *)insertContactWay:(CPDBModelContactWay *)dbContactWay
{
    [abDb executeUpdate:@"insert into contact_way (contact_id,reg_type,type,name,value,region) values (?,?,?,?,?,?)",
        dbContactWay.contactID,dbContactWay.regType,dbContactWay.type,dbContactWay.name,dbContactWay.value,dbContactWay.regionNumber];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }
    return [self lastAbDbRowID];
}
-(void)updateContactWayWithID:(NSNumber *)objID  obj:(CPDBModelContactWay *)dbContactWay
{
    [abDb executeUpdate:@"update contact_way set contact_id=?,reg_type=?,type=?,name=?,value=?,region=? where id =?",
dbContactWay.contactID,dbContactWay.regType,dbContactWay.type,dbContactWay.name,dbContactWay.value,dbContactWay.regionNumber,objID];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }
}
-(CPDBModelContactWay *)getContactWayWithResultSet:(FMResultSet *)rs
{
    CPDBModelContactWay *dbContactWay = [[CPDBModelContactWay alloc] init];
    [dbContactWay setContactWayID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbContactWay setContactID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"contact_id"]]];
    [dbContactWay setRegType:[NSNumber numberWithInt:[rs intForColumn:@"reg_type"]]];
    [dbContactWay setType:[NSNumber numberWithInt:[rs intForColumn:@"type"]]];
    [dbContactWay setName:[rs stringForColumn:@"name"]];
    [dbContactWay setValue:[rs stringForColumn:@"value"]];
    [dbContactWay setRegionNumber:[rs stringForColumn:@"region"]];
    return dbContactWay;
}
-(CPDBModelContactWay *)findContactWayWithID:(NSNumber *)id
{
    CPDBModelContactWay *reContactWay = nil;
    if (id)
    {
        FMResultSet *rs = [abDb executeQuery:@"select * from contact_way where id = ?",id];
        if ([rs next])
        {
            reContactWay = [self getContactWayWithResultSet:rs];
        }
        [rs close];
    }
    return reContactWay;
}
-(NSArray *)findAllContactWays
{
    FMResultSet *rs = [abDb executeQuery:@"select * from contact_way"];
    NSMutableArray *ContactWayList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ContactWayList addObject:[self getContactWayWithResultSet:rs]];
    }
    [rs close];
    return ContactWayList;
}
-(NSArray *)findAllContactWaysByContactIDAsc
{
    FMResultSet *rs = [abDb executeQuery:@"select * from contact_way order by contact_id asc"];
    NSMutableArray *ContactWayList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ContactWayList addObject:[self getContactWayWithResultSet:rs]];
    }
    [rs close];
    return ContactWayList;
}
-(void)deleteContactWayWithContactID:(NSNumber *)dbContactID
{
    [abDb executeUpdate:@"delete from contact_way where contact_id =?",dbContactID];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }

}
@end

