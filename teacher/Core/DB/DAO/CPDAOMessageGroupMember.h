#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 群组成员
 */

@class CPDBModelMessageGroupMember;
@interface CPDAOMessageGroupMember : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createMessageGroupMemberTable;
-(NSNumber *)insertMessageGroupMember:(CPDBModelMessageGroupMember *)dbMessageGroupMember;
-(void)updateMessageGroupMemberWithID:(NSNumber *)objID  obj:(CPDBModelMessageGroupMember *)dbMessageGroupMember;
-(CPDBModelMessageGroupMember *)getMessageGroupMemberWithResultSet:(FMResultSet *)rs;
-(CPDBModelMessageGroupMember *)findMessageGroupMemberWithID:(NSNumber *)id;
-(CPDBModelMessageGroupMember *)findMessageGroupMemberWithID:(NSNumber *)groupID andUserName:(NSString *)userName;
-(NSArray *)findAllMessageGroupMembers;
-(NSArray *)findAllMessageGroupMembersWithGroupID:(NSNumber *)msgGroupID;
-(NSArray *)findAllMessageGroupMembersByOrderByGroupID;
-(void)deleteAllGroupMemsWithGroupID:(NSNumber *)msgGroupID;
-(void)deleteGroupMemWithMemName:(NSString *)memName andGroupID:(NSNumber *)msgGroupID;
@end
