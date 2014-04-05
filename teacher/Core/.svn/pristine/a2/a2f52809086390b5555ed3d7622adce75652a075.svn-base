#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 联系人
 */

@class CPDBModelContact;
@interface CPDAOContact : BaseDAO


-(void)createContactTable;
-(NSNumber *)insertContact:(CPDBModelContact *)dbContact;
-(void)updateContactWithID:(NSNumber *)objID  obj:(CPDBModelContact *)dbContact;
-(CPDBModelContact *)getContactWithResultSet:(FMResultSet *)rs;
-(CPDBModelContact *)findContactWithID:(NSNumber *)id;
-(NSArray *)findAllContacts;
-(CPDBModelContact *)findContactWithAbPersonID:(NSNumber *)abPersonID;
-(NSArray *)findAllContactsAsc;
-(NSArray *)findAllContactsAscWithUpdateDate:(NSNumber *)update;
@end
