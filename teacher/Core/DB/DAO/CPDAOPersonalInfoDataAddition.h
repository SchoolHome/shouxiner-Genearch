#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 个人信息附加数据
 */

@class CPDBModelPersonalInfoDataAddition;
@interface CPDAOPersonalInfoDataAddition : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createPersonalInfoDataAdditionTable;
-(NSNumber *)insertPersonalInfoDataAddition:(CPDBModelPersonalInfoDataAddition *)dbPersonalInfoDataAddition;
-(void)updatePersonalInfoDataAdditionWithID:(NSNumber *)objID  obj:(CPDBModelPersonalInfoDataAddition *)dbPersonalInfoDataAddition;
-(CPDBModelPersonalInfoDataAddition *)getPersonalInfoDataAdditionWithResultSet:(FMResultSet *)rs;
-(CPDBModelPersonalInfoDataAddition *)findPersonalInfoDataAdditionWithID:(NSNumber *)id;
-(NSArray *)findAllPersonalInfoDataAdditions;

@end
