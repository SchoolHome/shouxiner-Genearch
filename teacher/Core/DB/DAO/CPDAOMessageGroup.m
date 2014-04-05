#import "CPDAOMessageGroup.h"

#import "CPDBModelMessageGroup.h"
#import "CoreUtils.h"

/**
 * 群组
 */

@implementation CPDAOMessageGroup

- (void)initilizeData
{
//    CPDBModelMessageGroup * messageGroup = [[CPDBModelMessageGroup alloc]init];
//    [messageGroup setType:[NSNumber numberWithInt:1]];
//    [messageGroup setRelationType:[NSNumber numberWithInt:1]];
//    [messageGroup setUnReadedCount:[NSNumber numberWithInt:0]];
//    [messageGroup setCreatorName:@"shuangshuang"];
//    [messageGroup setUpdateDate:[CoreUtils getLongFormatWithNowDate]];
//    NSNumber *result = [self insertMessageGroup:messageGroup];
//    
//    [messageGroup setType:[NSNumber numberWithInt:1]];
//    [messageGroup setRelationType:[NSNumber numberWithInt:1]];
//    [messageGroup setUnReadedCount:[NSNumber numberWithInt:0]];
//    [messageGroup setCreatorName:@"system"];
//    result = [self insertMessageGroup:messageGroup];
//
//    [messageGroup setType:[NSNumber numberWithInt:1]];
//    [messageGroup setRelationType:[NSNumber numberWithInt:2]];
//    [messageGroup setUnReadedCount:[NSNumber numberWithInt:0]];
//    [messageGroup setCreatorName:@"xiaoshuang"];
//    result = [self insertMessageGroup:messageGroup];
}

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createMessageGroupTable];
            [self initilizeData];
        }
    }
    return self;
}

-(void)createMessageGroupTable
{
    [db executeUpdate:@"CREATE TABLE message_group (id INTEGER PRIMARY KEY  AUTOINCREMENT,type INTEGER,relation_type INTEGER,group_server_id TEXT,group_name TEXT,group_header_res_ID INTEGER,memo_id INTEGER,update_date INTEGER,creator_name TEXT,un_readed_count INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertMessageGroup:(CPDBModelMessageGroup *)dbMessageGroup
{
    if (!dbMessageGroup.updateDate)
    {
        [dbMessageGroup setUpdateDate:[CoreUtils getLongFormatWithNowDate]];
    }
    if (!dbMessageGroup.unReadedCount)
    {
        [dbMessageGroup setUnReadedCount:[NSNumber numberWithInt:0]];
    }
    [db executeUpdate:@"insert into message_group (type,relation_type,group_server_id,group_name,group_header_res_ID,memo_id,update_date,creator_name,un_readed_count) values (?,?,?,?,?,?,?,?,?)",
        dbMessageGroup.type,dbMessageGroup.relationType,dbMessageGroup.groupServerID,dbMessageGroup.groupName,dbMessageGroup.groupHeaderResID,dbMessageGroup.memoID,dbMessageGroup.updateDate,dbMessageGroup.creatorName,dbMessageGroup.unReadedCount];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateMessageGroupWithID:(NSNumber *)objID  obj:(CPDBModelMessageGroup *)dbMessageGroup
{
    [db executeUpdate:@"update message_group set type=?,relation_type = ?,group_server_id=?,group_name=?,group_header_res_ID=?,memo_id=?,update_date=?,creator_name=?,un_readed_count=? where id =?",
dbMessageGroup.type,dbMessageGroup.relationType,dbMessageGroup.groupServerID,dbMessageGroup.groupName,dbMessageGroup.groupHeaderResID,dbMessageGroup.memoID,dbMessageGroup.updateDate,dbMessageGroup.creatorName,dbMessageGroup.unReadedCount,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelMessageGroup *)getMessageGroupWithResultSet:(FMResultSet *)rs
{
    CPDBModelMessageGroup *dbMessageGroup = [[CPDBModelMessageGroup alloc] init];
    [dbMessageGroup setMsgGroupID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbMessageGroup setType:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"type"]]];
    [dbMessageGroup setRelationType:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"relation_type"]]];
    [dbMessageGroup setGroupServerID:[rs stringForColumn:@"group_server_id"]];
    [dbMessageGroup setGroupName:[rs stringForColumn:@"group_name"]];
    [dbMessageGroup setGroupHeaderResID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"group_header_res_ID"]]];
    [dbMessageGroup setMemoID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"memo_id"]]];
    [dbMessageGroup setUpdateDate:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_date"]]];
    [dbMessageGroup setCreatorName:[rs stringForColumn:@"creator_name"]];
    [dbMessageGroup setUnReadedCount:[NSNumber numberWithInt:[rs intForColumn:@"un_readed_count"]]];
    return dbMessageGroup;
}
-(CPDBModelMessageGroup *)findMessageGroupWithID:(NSNumber *)id
{
    CPDBModelMessageGroup *reMessageGroup = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from message_group where id = ?",id];
        if ([rs next])
        {
            reMessageGroup = [self getMessageGroupWithResultSet:rs];
        }
        [rs close];
    }
    return reMessageGroup;
}
-(CPDBModelMessageGroup *)findMessageGroupWithCreatorName:(NSString *)creatorName
{
    CPDBModelMessageGroup *reMessageGroup = nil;
    if (creatorName)
    {
        FMResultSet *rs = [db executeQuery:@"select * from message_group where creator_name = ?",creatorName];
        if ([rs next])
        {
            reMessageGroup = [self getMessageGroupWithResultSet:rs];
        }
        [rs close];
    }
    return reMessageGroup;
}
-(CPDBModelMessageGroup *)findMessageGroupWithServerID:(NSString *)serverID
{
    CPDBModelMessageGroup *reMessageGroup = nil;
    if (serverID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from message_group where group_server_id = ?",serverID];
        if ([rs next])
        {
            reMessageGroup = [self getMessageGroupWithResultSet:rs];
        }
        [rs close];
    }
    return reMessageGroup;
}
-(NSArray *)findAllMessageGroups
{
    FMResultSet *rs = [db executeQuery:@"select * from message_group"];
    NSMutableArray *MessageGroupList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [MessageGroupList addObject:[self getMessageGroupWithResultSet:rs]];
    }
    [rs close];
    return MessageGroupList;
}
-(NSArray *)findAllMessageGroupsByID
{
    FMResultSet *rs = [db executeQuery:@"select * from message_group order by id asc"];
    NSMutableArray *MessageGroupList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [MessageGroupList addObject:[self getMessageGroupWithResultSet:rs]];
    }
    [rs close];
    return MessageGroupList;
}
-(NSArray *)findAllMessageGroupsWithType:(NSNumber *)groupType
{
    FMResultSet *rs = [db executeQuery:@"select * from message_group where type=?",groupType];
    NSMutableArray *MessageGroupList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [MessageGroupList addObject:[self getMessageGroupWithResultSet:rs]];
    }
    [rs close];
    return MessageGroupList;
}
-(NSArray *)findMessageGroupWithMemName:(NSString *)userName
{
    FMResultSet *rs = [db executeQuery:@"select message_group.* from message_group,message_group_member where message_group.id=message_group_member.group_id and message_group_member.user_name=?",userName];
    NSMutableArray *messageGroupList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        CPDBModelMessageGroup *dbMsgGroup = [self getMessageGroupWithResultSet:rs];
        if ([dbMsgGroup.type integerValue]==MSG_GROUP_TYPE_SINGLE||[dbMsgGroup.type integerValue]==MSG_GROUP_TYPE_SINGLE_PRE)
        {
            [messageGroupList addObject:dbMsgGroup];
        }
    }
    [rs close];
    return messageGroupList;
}
-(void)updateMessageGroupWithID:(NSString *)serverID  andGroupName:(NSString *)name
{
    [db executeUpdate:@"update message_group set group_name=? , update_date=? where group_server_id =?",
     name,[CoreUtils getLongFormatWithNowDate],serverID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateMessageGroupWithID:(NSNumber *)msgGroupID  andGroupType:(NSNumber *)type
{
    [db executeUpdate:@"update message_group set type=? , update_date=? where id =?",
     type,[CoreUtils getLongFormatWithNowDate],msgGroupID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateMessageGroupUnReadedCountWithID:(NSNumber *)msgGroupID andCount:(NSNumber *)unReadedCount
{
    [db executeUpdate:@"update message_group set un_readed_count=?  where id = ?",unReadedCount,msgGroupID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteGroupWithID:(NSNumber *)msgGroupID
{
    CPLogInfo(@"-100-");
    [db executeUpdate:@"delete from message where group_id = ?",msgGroupID];
    [db executeUpdate:@"delete from message_group_member where group_id = ?",msgGroupID];
    [db executeUpdate:@"delete from message_group where id=?",msgGroupID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)deleteGroupMsgsWithID:(NSNumber *)msgGroupID
{
    CPLogInfo(@"-101");
    [db executeUpdate:@"delete from message where group_id = ?",msgGroupID];
    [db executeUpdate:@"update message_group set un_readed_count = 0  where id = ?",msgGroupID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}

-(void)markMsgReadedWithGroupID:(NSNumber *)msgGroupID
{
    [db executeUpdate:@"update message set is_readed = 0  where is_readed=1 and group_id = ?",msgGroupID];
    [db executeUpdate:@"update message_group set un_readed_count = 0  where id = ?",msgGroupID];
    if ([db hadError]) 
    {
		CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
-(void)markMsgGroupReadedWithGroupID:(NSNumber *)msgGroupID
{
    [db executeUpdate:@"update message_group set un_readed_count = 0  where id = ?",msgGroupID];
    if ([db hadError]) 
    {
		CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
-(void)markMsgReadTagWithMsgID:(NSNumber *)msgID
{
    [db executeUpdate:@"update message set is_readed = 0  where id = ?",msgID];
    if ([db hadError]) 
    {
		CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
-(void)updateUpdateTimeWithGroupID:(NSNumber *)msgGroupID andNewstTime:(NSNumber *)newstTime
{
    [db executeUpdate:@"update message_group set update_date = ?  where id = ?",newstTime,msgGroupID];
    if ([db hadError]) 
    {
		CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
-(void)updateNewestMsgWithGroupID:(NSNumber *)msgGroupID andNewstTime:(NSNumber *)newstTime
{
    CPDBModelMessageGroup *dbMsgGroup = [self findMessageGroupWithID:msgGroupID];
    NSInteger newUnreadedCount = [dbMsgGroup.unReadedCount integerValue]+1;
//    NSLog(@"msgGroupID is %@ ,newUnreadedCount is %d",msgGroupID,newUnreadedCount);
    [db executeUpdate:@"update message_group set un_readed_count = ? ,update_date = ?  where id = ?",
     [NSNumber numberWithInt:newUnreadedCount],newstTime,msgGroupID];
    if ([db hadError]) 
    {
		CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}
@end

