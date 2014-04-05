#import "CPDAOMessage.h"

#import "CPDBModelMessage.h"
#import "CoreUtils.h"

/**
 * 消息表
 */

@implementation CPDAOMessage

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createMessageTable];
        }
    }
    return self;
}

-(void)createMessageTable
{
    [db executeUpdate:@"CREATE TABLE message (id INTEGER PRIMARY KEY  AUTOINCREMENT,group_id INTEGER,msg_sender_id TEXT,msg_group_server_id TEXT,mobile TEXT,flag INTEGER,send_state INTEGER,date INTEGER,is_readed INTEGER,msg_text TEXT,content_type INTEGER,location_info TEXT,attach_res_id INTEGER,magic_msg_id TEXT,pet_msg_id TEXT,body_content TEXT,uuid_ask TEXT,msg_owner_name TEXT)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertMessage:(CPDBModelMessage *)dbMessage
{
    CPLogInfo(@"msgText:%@",dbMessage.msgText);
    if (!dbMessage.isReaded)
    {
        [dbMessage setIsReaded:[NSNumber numberWithInt:MSG_STATUS_IS_READED]];
    }
    if (!dbMessage.date)
    {
        [dbMessage setDate:[CoreUtils getLongFormatWithNowDate]];
    }
    NSLog(@"-10- %@",dbMessage);
    NSString *sqlstr = [NSString stringWithFormat:@"insert into message (group_id,msg_sender_id,msg_group_server_id,mobile,flag,send_state,date,is_readed,msg_text,content_type,location_info,attach_res_id,magic_msg_id,pet_msg_id,body_content,uuid_ask,msg_owner_name) values (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@)",
                        dbMessage.msgGroupID,dbMessage.msgSenderID,dbMessage.msgGroupServerID,dbMessage.mobile,dbMessage.flag,dbMessage.sendState,dbMessage.date,dbMessage.isReaded,dbMessage.msgText,dbMessage.contentType,dbMessage.locationInfo,dbMessage.attachResID,dbMessage.magicMsgID,dbMessage.petMsgID,dbMessage.bodyContent,dbMessage.uuidAsk,dbMessage.msgOwnerName];
    NSLog(@"-11- %@",sqlstr);
    [db executeUpdate:@"insert into message (group_id,msg_sender_id,msg_group_server_id,mobile,flag,send_state,date,is_readed,msg_text,content_type,location_info,attach_res_id,magic_msg_id,pet_msg_id,body_content,uuid_ask,msg_owner_name) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        dbMessage.msgGroupID,dbMessage.msgSenderID,dbMessage.msgGroupServerID,dbMessage.mobile,dbMessage.flag,dbMessage.sendState,dbMessage.date,dbMessage.isReaded,dbMessage.msgText,dbMessage.contentType,dbMessage.locationInfo,dbMessage.attachResID,dbMessage.magicMsgID,dbMessage.petMsgID,dbMessage.bodyContent,dbMessage.uuidAsk,dbMessage.msgOwnerName];
    NSLog(@"-12- %@",dbMessage);
    if ([db hadError])
    {
        NSLog(@"-13- %@",dbMessage);
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateMessageWithID:(NSNumber *)objID  obj:(CPDBModelMessage *)dbMessage
{
    [db executeUpdate:@"update message set group_id=?,msg_sender_id=?,msg_group_server_id=?,mobile=?,flag=?,send_state=?,date=?,is_readed=?,msg_text=?,content_type=?,location_info=?,attach_res_id=?,magic_msg_id=?,pet_msg_id=?,body_content=?,uuid_ask=?,msg_owner_name=? where id =?",
dbMessage.msgGroupID,dbMessage.msgSenderID,dbMessage.msgGroupServerID,dbMessage.mobile,dbMessage.flag,dbMessage.sendState,dbMessage.date,dbMessage.isReaded,dbMessage.msgText,dbMessage.contentType,dbMessage.locationInfo,dbMessage.attachResID,dbMessage.magicMsgID,dbMessage.petMsgID,dbMessage.bodyContent,dbMessage.uuidAsk,dbMessage.msgOwnerName,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelMessage *)getMessageWithResultSet:(FMResultSet *)rs
{
    CPDBModelMessage *dbMessage = [[CPDBModelMessage alloc] init];
    [dbMessage setMsgID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbMessage setMsgGroupID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"group_id"]]];
    [dbMessage setMsgSenderID:[rs stringForColumn:@"msg_sender_id"]];
    [dbMessage setMsgGroupServerID:[rs stringForColumn:@"msg_group_server_id"]];
    [dbMessage setMobile:[rs stringForColumn:@"mobile"]];
    [dbMessage setFlag:[NSNumber numberWithInt:[rs intForColumn:@"flag"]]];
    [dbMessage setSendState:[NSNumber numberWithInt:[rs intForColumn:@"send_state"]]];
    [dbMessage setDate:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"date"]]];
    [dbMessage setIsReaded:[NSNumber numberWithInt:[rs intForColumn:@"is_readed"]]];
    [dbMessage setMsgText:[rs stringForColumn:@"msg_text"]];
    [dbMessage setContentType:[NSNumber numberWithInt:[rs intForColumn:@"content_type"]]];
    [dbMessage setLocationInfo:[rs stringForColumn:@"location_info"]];
    [dbMessage setAttachResID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"attach_res_id"]]];
    [dbMessage setMagicMsgID:[rs stringForColumn:@"magic_msg_id"]];
    [dbMessage setPetMsgID:[rs stringForColumn:@"pet_msg_id"]];
    [dbMessage setBodyContent:[rs stringForColumn:@"body_content"]];
    [dbMessage setUuidAsk:[rs stringForColumn:@"uuid_ask"]];
    [dbMessage setMsgOwnerName:[rs stringForColumn:@"msg_owner_name"]];
    return dbMessage;
}
-(CPDBModelMessage *)findMessageWithID:(NSNumber *)id
{
    CPDBModelMessage *reMessage = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from message where id = ?",id];
        if ([rs next])
        {
            reMessage = [self getMessageWithResultSet:rs];
        }
        [rs close];
    }
    return reMessage;
}

-(CPDBModelMessage *)findMessageWithResID:(NSNumber *)id{
    CPDBModelMessage *reMessage = nil;
    if (id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from message where attach_res_id = ?",id];
        if ([rs next])
        {
            reMessage = [self getMessageWithResultSet:rs];
        }
        [rs close];
    }
    return reMessage;
}

-(NSArray *)findAllMessages
{
    FMResultSet *rs = [db executeQuery:@"select * from message"];
    NSMutableArray *MessageList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [MessageList addObject:[self getMessageWithResultSet:rs]];
    }
    [rs close];
    return MessageList;
}
-(NSArray *)findAllMessagesByGroupID
{
    FMResultSet *rs = [db executeQuery:@"select * from message order by group_id asc"];
    NSMutableArray *MessageList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [MessageList addObject:[self getMessageWithResultSet:rs]];
    }
    [rs close];
    return MessageList;
}
-(NSArray *)findAllMessagesWithGroupID:(NSNumber *)msgGroupID
{
    FMResultSet *rs = [db executeQuery:@"select * from message where group_id=? order by date asc",msgGroupID];
    NSMutableArray *MessageList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [MessageList addObject:[self getMessageWithResultSet:rs]];
    }
    [rs close];
    return MessageList;
}
-(void)updateMessageWithID:(NSNumber *)msgID andStatus:(NSNumber *)status
{
    [db executeUpdate:@"update message set send_state=? where id =?" , status,msgID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateMessageWithGroupID:(NSNumber *)groupID andGroupServerID:(NSString *)groupServerID
{
    FMResultSet *rs = [db executeQuery:@"select count(*) from message where msg_group_server_id =? and group_id is null ",groupServerID];
    int unReadedCount = 0;
    if ([rs next])
    {
        unReadedCount = [rs intForColumnIndex:0];
    }
    [db executeUpdate:@"update message set group_id=? where msg_group_server_id =? and group_id is null " , groupID,groupServerID];
    if (unReadedCount>0) 
    {
        [db executeUpdate:@"update message_group set un_readed_count=?  where id = ?",[NSNumber numberWithInt:unReadedCount],groupID];
    }
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateMessageWithGroupID:(NSNumber *)groupID andSendName:(NSString *)sendName
{
    FMResultSet *rs = [db executeQuery:@"select count(*) from message where msg_owner_name =? and group_id is null ",sendName];
    int unReadedCount = 0;
    if ([rs next])
    {
        unReadedCount = [rs intForColumnIndex:0];
    }
    [db executeUpdate:@"update message set group_id=? where msg_owner_name =? and group_id is null " , groupID,sendName];
    if (unReadedCount>0)
    {
        [db executeUpdate:@"update message_group set un_readed_count=?  where id = ?",[NSNumber numberWithInt:unReadedCount],groupID];
    }
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)resetMessageStateBySentError
{
    [db executeUpdate:@"update message set send_state=? where send_state=? ",
     [NSNumber numberWithInt:MSG_STATE_SEND_ERROR],
     [NSNumber numberWithInt:MSG_STATE_SENDING]];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSArray *)findMsgListByPageWithGroupID:(NSNumber *)msgGroupID max_msg_count:(NSInteger)maxMsgCount
{
    if (msgGroupID)
    {
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];//group by date 
        FMResultSet *rs = [db executeQuery:@"select * from message where group_id = ? order by date desc limit 0,?",
                           msgGroupID,[NSNumber numberWithInt:maxMsgCount]];
        while ([rs next]) 
        {
            [resultArray addObject:[self getMessageWithResultSet:rs]];
        }
        [rs close];
        if ([db hadError]) 
        {
            CPLogInfo(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        }
        return resultArray;
    }
    return nil;
}
-(NSArray *)findMsgListByPageWithGroupID:(NSNumber *)msgGroupID last_msg_time:(NSNumber *)lastMsgTime max_msg_count:(NSInteger)maxMsgCount
{
    if (msgGroupID)
    {
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];//group by date 
        FMResultSet *rs = [db executeQuery:@"select * from message where group_id = ? and date < ? order by date desc limit 0,?",
                           msgGroupID,lastMsgTime,[NSNumber numberWithInt:maxMsgCount]];
        while ([rs next]) 
        {
            [resultArray addObject:[self getMessageWithResultSet:rs]];
        }
        [rs close];
        return resultArray;
    }
    return nil;
}
-(NSArray *)findMsgListByNewestTimeWithGroupID:(NSNumber *)msgGroupID newest_msg_time:(NSNumber *)newestMsgTime
{
    if (msgGroupID)
    {
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];//group by date 
        FMResultSet *rs = [db executeQuery:@"select * from message where group_id = ? and date >= ? order by date desc",
                           msgGroupID,newestMsgTime];
        while ([rs next]) 
        {
            [resultArray addObject:[self getMessageWithResultSet:rs]];
        }
        [rs close];
        return resultArray;
    }
    return nil;
}
-(CPDBModelMessage *)findMessageWithSendID:(NSString *)sendName andContentType:(NSNumber *)contentType
{
    CPDBModelMessage *reMessage = nil;
    if (sendName&&contentType)
    {
        FMResultSet *rs = [db executeQuery:@"select * from message where msg_sender_id = ? and content_type=?",sendName,contentType];
        if ([rs next])
        {
            reMessage = [self getMessageWithResultSet:rs];
        }
        [rs close];
    }
    return reMessage;
}
@end

