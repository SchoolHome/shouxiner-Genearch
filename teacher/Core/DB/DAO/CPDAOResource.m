#import "CPDAOResource.h"
#import "CPDBModelResource.h"
#import "CPDBModelUserInfoData.h"
#import "CPLGModelAccount.h"
#import "CPSystemEngine.h"
#import "CoreUtils.h"
/**
 * 资源
 */

@implementation CPDAOResource


- (void) initilizeData
{
//    CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
//    CPDBModelResource *dbRes = [[CPDBModelResource alloc] init];
//    [dbRes setFileName:@"B9E30860-FC07-42D7-B441-BF91A25E44EC.jpg"];
//    [dbRes setFilePrefix:[NSString stringWithFormat:@"%@/header/",myAccountModel.loginName]];
//    [dbRes setMark:[NSNumber numberWithInt:MARK_DOWNLOAD]];
//    [dbRes setServerUrl:@"/public/icon/fanxer.jpg"];
//    [dbRes setCreateTime:[CoreUtils getLongFormatWithNowDate ]];
//    [dbRes setObjID:[NSNumber numberWithInt:1]];
//    [dbRes setType:[NSNumber numberWithInt:USER_DATA_CLASSIFY_HEADER]];
//    [dbRes setObjType:[NSNumber numberWithInt:RESOURCE_FILE_CP_TYPE_HEADER]];
//    NSNumber * result = [self insertResource:dbRes];
//    
//    dbRes = [[CPDBModelResource alloc] init];
//    [dbRes setFileName:@"DF2E1A69-3471-45EE-9C4A-DDD3124B8AE1.jpg"];
//    [dbRes setFilePrefix:[NSString stringWithFormat:@"%@/header/",myAccountModel.loginName]];
//    [dbRes setMark:[NSNumber numberWithInt:MARK_DOWNLOAD]];
//    [dbRes setServerUrl:@"/public/icon/system.jpg"];
//    [dbRes setCreateTime:[CoreUtils getLongFormatWithNowDate ]];
//    [dbRes setObjID:[NSNumber numberWithInt:2]];
//    [dbRes setType:[NSNumber numberWithInt:USER_DATA_CLASSIFY_HEADER]];
//    [dbRes setObjType:[NSNumber numberWithInt:RESOURCE_FILE_CP_TYPE_HEADER]];
//    result = [self insertResource:dbRes];
//    
//    dbRes = [[CPDBModelResource alloc] init];
//    [dbRes setFileName:@"13D21C76-49BE-46C9-9A76-1DEB0A1C3757.jpg"];
//    [dbRes setFilePrefix:[NSString stringWithFormat:@"%@/header/",myAccountModel.loginName]];
//    [dbRes setMark:[NSNumber numberWithInt:MARK_DOWNLOAD]];
//    [dbRes setServerUrl:@"/public/icon/xiaoshuang.jpg"];
//    [dbRes setCreateTime:[CoreUtils getLongFormatWithNowDate ]];
//    [dbRes setObjID:[NSNumber numberWithInt:3]];
//    [dbRes setType:[NSNumber numberWithInt:USER_DATA_CLASSIFY_HEADER]];
//    [dbRes setObjType:[NSNumber numberWithInt:RESOURCE_FILE_CP_TYPE_HEADER]];
//    result = [self insertResource:dbRes];
}
- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode==1)
        {
            [self createResourceTable];
            [self initilizeData];
        }
    }
    return self;
}

-(void)createResourceTable
{
    [db executeUpdate:@"CREATE TABLE resource (id INTEGER PRIMARY KEY  AUTOINCREMENT,server_url TEXT,create_time INTEGER,file_name TEXT,file_prefix TEXT,type INTEGER,mime_type TEXT,mark INTEGER,obj_id INTEGER,obj_type INTEGER,media_time INTEGER,file_size INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(NSNumber *)insertResource:(CPDBModelResource *)dbResource
{
    [db executeUpdate:@"insert into resource (server_url,create_time,file_name,file_prefix,type,mime_type,mark,obj_id,obj_type,media_time,file_size) values (?,?,?,?,?,?,?,?,?,?,?)",
        dbResource.serverUrl,dbResource.createTime,dbResource.fileName,dbResource.filePrefix,dbResource.type,dbResource.mimeType,dbResource.mark,dbResource.objID,dbResource.objType,dbResource.mediaTime,dbResource.fileSize];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    return [self lastRowID];
}
-(void)updateResourceWithID:(NSNumber *)objID  obj:(CPDBModelResource *)dbResource
{
    [db executeUpdate:@"update resource set server_url=?,create_time=?,file_name=?,file_prefix=?,type=?,mime_type=?,mark=?,obj_id=?,obj_type=? ,media_time=?,file_size=? where id =?",
dbResource.serverUrl,dbResource.createTime,dbResource.fileName,dbResource.filePrefix,dbResource.type,dbResource.mimeType,dbResource.mark,dbResource.objID,dbResource.objType,dbResource.mediaTime,dbResource.fileSize,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(CPDBModelResource *)getResourceWithResultSet:(FMResultSet *)rs
{
    CPDBModelResource *dbResource = [[CPDBModelResource alloc] init];
    [dbResource setResID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]]];
    [dbResource setServerUrl:[rs stringForColumn:@"server_url"]];
    [dbResource setCreateTime:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"create_time"]]];
    [dbResource setFileName:[rs stringForColumn:@"file_name"]];
    [dbResource setFilePrefix:[rs stringForColumn:@"file_prefix"]];
    [dbResource setType:[NSNumber numberWithInt:[rs intForColumn:@"type"]]];
    [dbResource setMimeType:[rs stringForColumn:@"mime_type"]];
    [dbResource setMark:[NSNumber numberWithInt:[rs intForColumn:@"mark"]]];
    [dbResource setObjID:[NSNumber numberWithLongLong:[rs longLongIntForColumn:@"obj_id"]]];
    [dbResource setObjType:[NSNumber numberWithInt:[rs intForColumn:@"obj_type"]]];
    [dbResource setMediaTime:[NSNumber numberWithInt:[rs intForColumn:@"media_time"]]];
    [dbResource setFileSize:[NSNumber numberWithInt:[rs intForColumn:@"file_size"]]];
    return dbResource;
}
-(CPDBModelResource *)findResourceWithID:(NSNumber *)localID
{
    CPDBModelResource *reResource = nil;
    if (localID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from resource where id = ?",localID];
        if ([rs next])
        {
            reResource = [self getResourceWithResultSet:rs];
        }
        [rs close];
    }
    return reResource;
}

-(CPDBModelResource *)findResourceWithServerUrl:(NSString *)serverUrl
{
    CPDBModelResource *reResource = nil;
    if (serverUrl)
    {
        FMResultSet *rs = [db executeQuery:@"select * from resource where server_url = ? order by id desc",serverUrl];
        if ([rs next])
        {
            reResource = [self getResourceWithResultSet:rs];
        }
        [rs close];
    }
    return reResource;
}
-(CPDBModelResource *)findResourceWithServerUrl:(NSString *)serverUrl andObjID:(NSNumber *)objID andObjType:(NSNumber *)objType
{
    CPDBModelResource *reResource = nil;
    if (serverUrl)
    {
        FMResultSet *rs = [db executeQuery:@"select * from resource where server_url = ? and obj_id=? and obj_type=?",
                           serverUrl,objID,objType];
        if ([rs next])
        {
            reResource = [self getResourceWithResultSet:rs];
        }
        [rs close];
    }
    return reResource;
}
-(CPDBModelResource *)findResourceWithObjID:(NSNumber *)objID andResType:(NSNumber *)resType
{
    CPDBModelResource *reResource = nil;
    if (objID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from resource where obj_id=? and type=?",objID,resType];
        if ([rs next])
        {
            reResource = [self getResourceWithResultSet:rs];
        }
        [rs close];
    }
    return reResource;
}
-(CPDBModelResource *)findResourceWithObjID:(NSNumber *)objID andObjType:(NSNumber *)objType andType:(NSNumber *)type
{
    CPDBModelResource *reResource = nil;
    if (objID)
    {
        FMResultSet *rs = [db executeQuery:@"select * from resource where obj_id=? and obj_type=? and type=?",objID,objType,type];
        if ([rs next])
        {
            reResource = [self getResourceWithResultSet:rs];
        }
        [rs close];
    }
    return reResource;
}
-(NSArray *)findAllResources
{
    FMResultSet *rs = [db executeQuery:@"select * from resource"];
    NSMutableArray *ResourceList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ResourceList addObject:[self getResourceWithResultSet:rs]];
    }
    [rs close];
    return ResourceList;
}
-(NSArray *)findAllResourcesWithMark:(NSInteger)mark
{
    FMResultSet *rs = [db executeQuery:@"select * from resource where mark=?",[NSNumber numberWithInt:mark]];
    NSMutableArray *ResourceList = [[NSMutableArray alloc] init];
    while ([rs next])
    {
        [ResourceList addObject:[self getResourceWithResultSet:rs]];
    }
    [rs close];
    return ResourceList;
}
-(void)updateResourceWithID:(NSNumber *)objID mark:(NSInteger )mark
{
    [db executeUpdate:@"update resource set mark=? where id =?",[NSNumber numberWithInt:mark],objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateResourceWithID:(NSNumber *)objID updateTime:(NSNumber *)updateTime
{
    [db executeUpdate:@"update resource set create_time=? where id =?",updateTime,objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateResourceWithID:(NSNumber *)objID url:(NSString *)url
{
    [db executeUpdate:@"update resource set server_url=?,mark=? where id =?",url,[NSNumber numberWithInt:MARK_DEFAULT],objID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)updateObjIDWithResID:(NSNumber *)resID obj_id:(NSNumber *)objID
{
    [db executeUpdate:@"update resource set obj_id=? where id =?",objID,resID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}
-(void)delResourceWithResID:(NSNumber *)resID
{    
    [db executeUpdate:@"delete from resource where id = ?",resID];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}

@end

