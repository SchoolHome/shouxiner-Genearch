#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 联系方式
 */

@class CPDBModelContactWay;
@interface CPDAOContactWay : BaseDAO


-(void)createContactWayTable;
-(NSNumber *)insertContactWay:(CPDBModelContactWay *)dbContactWay;
-(void)updateContactWayWithID:(NSNumber *)objID  obj:(CPDBModelContactWay *)dbContactWay;
-(CPDBModelContactWay *)getContactWayWithResultSet:(FMResultSet *)rs;
-(CPDBModelContactWay *)findContactWayWithID:(NSNumber *)id;
-(NSArray *)findAllContactWays;
-(void)deleteContactWayWithContactID:(NSNumber *)dbContactID;
-(NSArray *)findAllContactWaysByContactIDAsc;
@end
