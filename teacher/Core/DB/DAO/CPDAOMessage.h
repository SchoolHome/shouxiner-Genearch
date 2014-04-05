#import <Foundation/Foundation.h>

#import "BaseDAO.h"


/**
 * 消息表
 */

@class CPDBModelMessage;
@interface CPDAOMessage : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createMessageTable;
-(NSNumber *)insertMessage:(CPDBModelMessage *)dbMessage;
-(void)updateMessageWithID:(NSNumber *)objID  obj:(CPDBModelMessage *)dbMessage;
-(CPDBModelMessage *)getMessageWithResultSet:(FMResultSet *)rs;
-(CPDBModelMessage *)findMessageWithID:(NSNumber *)id;
-(NSArray *)findAllMessages;
-(NSArray *)findAllMessagesByGroupID;
-(NSArray *)findAllMessagesWithGroupID:(NSNumber *)msgGroupID;
-(void)updateMessageWithID:(NSNumber *)msgID andStatus:(NSNumber *)status;
-(void)updateMessageWithGroupID:(NSNumber *)groupID andGroupServerID:(NSString *)groupServerID;
-(void)updateMessageWithGroupID:(NSNumber *)groupID andSendName:(NSString *)sendName;
-(void)resetMessageStateBySentError;

-(NSArray *)findMsgListByPageWithGroupID:(NSNumber *)msgGroupID last_msg_time:(NSNumber *)lastMsgTime max_msg_count:(NSInteger)maxMsgCount;
-(NSArray *)findMsgListByPageWithGroupID:(NSNumber *)msgGroupID max_msg_count:(NSInteger)maxMsgCount;
-(NSArray *)findMsgListByNewestTimeWithGroupID:(NSNumber *)msgGroupID newest_msg_time:(NSNumber *)newestMsgTime;
-(CPDBModelMessage *)findMessageWithSendID:(NSString *)sendName andContentType:(NSNumber *)contentType;
-(CPDBModelMessage *)findMessageWithResID:(NSNumber *)id;
@end
