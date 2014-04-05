#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 群组
 */

@class CPDBModelMessageGroup;
@interface CPDAOMessageGroup : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createMessageGroupTable;
-(NSNumber *)insertMessageGroup:(CPDBModelMessageGroup *)dbMessageGroup;
-(void)updateMessageGroupWithID:(NSNumber *)objID  obj:(CPDBModelMessageGroup *)dbMessageGroup;
-(CPDBModelMessageGroup *)getMessageGroupWithResultSet:(FMResultSet *)rs;
-(CPDBModelMessageGroup *)findMessageGroupWithID:(NSNumber *)id;
-(CPDBModelMessageGroup *)findMessageGroupWithCreatorName:(NSString *)creatorName;
-(CPDBModelMessageGroup *)findMessageGroupWithServerID:(NSString *)serverID;
-(NSArray *)findAllMessageGroups;
-(NSArray *)findAllMessageGroupsByID;
-(NSArray *)findAllMessageGroupsWithType:(NSNumber *)groupType;
-(NSArray *)findMessageGroupWithMemName:(NSString *)userName;
-(void)updateMessageGroupWithID:(NSString *)serverID  andGroupName:(NSString *)name;
-(void)updateMessageGroupWithID:(NSNumber *)msgGroupID  andGroupType:(NSNumber *)type;
-(void)updateMessageGroupUnReadedCountWithID:(NSNumber *)msgGroupID andCount:(NSNumber *)unReadedCount;
-(void)deleteGroupWithID:(NSNumber *)msgGroupID;
-(void)deleteGroupMsgsWithID:(NSNumber *)msgGroupID;
-(void)markMsgReadedWithGroupID:(NSNumber *)msgGroupID;
-(void)markMsgGroupReadedWithGroupID:(NSNumber *)msgGroupID;
-(void)markMsgReadTagWithMsgID:(NSNumber *)msgID;
-(void)updateUpdateTimeWithGroupID:(NSNumber *)msgGroupID andNewstTime:(NSNumber *)newstTime;
-(void)updateNewestMsgWithGroupID:(NSNumber *)msgGroupID andNewstTime:(NSNumber *)newstTime;
@end
