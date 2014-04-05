#import "CPDAOContact.h"

#import "CPDBModelContact.h"

#import "CoreUtils.h"
/**
 * 联系人
 */

@implementation CPDAOContact

- (id)init
{
    self = [super init];
    if(self)
    {
        if ([[CPDataBaseManager getInstance] statusAbCode]==1)
        {
            [self createContactTable];
        }
    }
    return self;
}

-(void)createContactTable
{
    [abDb executeUpdate:@"CREATE TABLE contact (id INTEGER PRIMARY KEY  AUTOINCREMENT,ab_person_id INTEGER,update_time INTEGER,first_name TEXT,last_name TEXT,full_name TEXT,sync_time INTEGER,sync_mark INTEGER,header_photo_path TEXT)"];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }
}
-(NSNumber *)insertContact:(CPDBModelContact *)dbContact
{
    [abDb executeUpdate:@"insert into contact (ab_person_id,update_time,first_name,last_name,full_name,sync_time,sync_mark,header_photo_path) values (?,?,?,?,?,?,?,?)",
        dbContact.abPersonID,[CoreUtils getLongFormatWithNowDate],dbContact.firstName,dbContact.lastName,dbContact.fullName,dbContact.syncTime,dbContact.syncMark,dbContact.headerPhotoPath];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }
    return [self lastAbDbRowID];
}
-(void)updateContactWithID:(NSNumber *)objID  obj:(CPDBModelContact *)dbContact
{
    [abDb executeUpdate:@"update contact set ab_person_id=?,update_time=?,first_name=?,last_name=?,full_name=?,sync_time=?,sync_mark=?,header_photo_path=? where id =?",
dbContact.abPersonID,[CoreUtils getLongFormatWithNowDate],dbContact.firstName,dbContact.lastName,dbContact.fullName,dbContact.syncTime,dbContact.syncMark,dbContact.headerPhotoPath,objID];
    if ([abDb hadError])
    {
        CPLogError(@"Err %d: %@", [abDb lastErrorCode], [abDb lastErrorMessage]);
    }
}
-(CPDBModelContact *)getContactWithResultSet:(FMResultSet *)rs
{
    CPDBModelContact *dbContact = [[CPDBModelContact alloc] init];
    [dbContact setContactID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbContact setAbPersonID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"ab_person_id"]]];
    [dbContact setUpdateTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_time"]]];
    [dbContact setFirstName:[rs stringForColumn:@"first_name"]];
    [dbContact setLastName:[rs stringForColumn:@"last_name"]];
    [dbContact setFullName:[rs stringForColumn:@"full_name"]];
    [dbContact setSyncTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"sync_time"]]];
    [dbContact setSyncMark:[NSNumber numberWithInt:[rs intForColumn:@"sync_mark"]]];
    [dbContact setHeaderPhotoPath:[rs stringForColumn:@"header_photo_path"]];
    return dbContact;
}
-(CPDBModelContact *)findContactWithID:(NSNumber *)id
{
    CPDBModelContact *reContact = nil;
    if (id)
    {
        FMResultSet *rs = [abDb executeQuery:@"select * from contact where id = ?",id];
        if ([rs next])
        {
            reContact = [self getContactWithResultSet:rs];
        }
        [rs close];
    }
    return reContact;
}
-(CPDBModelContact *)findContactWithAbPersonID:(NSNumber *)abPersonID
{
    CPDBModelContact *reContact = nil;
    if (abPersonID)
    {
        FMResultSet *rs = [abDb executeQuery:@"select * from contact where ab_person_id = ?",abPersonID];
        if ([rs next])
        {
            reContact = [self getContactWithResultSet:rs];
        }
        [rs close];
    }
    return reContact;
}
-(NSArray *)findAllContacts
{
    FMResultSet *rs = [abDb executeQuery:@"select * from contact"];
    NSMutableArray *ContactList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ContactList addObject:[self getContactWithResultSet:rs]];
    }
    [rs close];
    return ContactList;
}
-(NSArray *)findAllContactsAsc
{
    FMResultSet *rs = [abDb executeQuery:@"select * from contact order by id asc"];
    NSMutableArray *ContactList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ContactList addObject:[self getContactWithResultSet:rs]];
    }
    [rs close];
    return ContactList;
}
-(NSArray *)findAllContactsAscWithUpdateDate:(NSNumber *)update
{
    FMResultSet *rs = [abDb executeQuery:@"select * from contact where update_time>? order by id asc",update];
    NSMutableArray *ContactList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ContactList addObject:[self getContactWithResultSet:rs]];
    }
    [rs close];
    return ContactList;
}

@end

