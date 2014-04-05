#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 个人信息数据
 */

@class CPDBModelPersonalInfoData;
@interface CPDAOPersonalInfoData : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createPersonalInfoDataTable;
-(NSNumber *)insertPersonalInfoData:(CPDBModelPersonalInfoData *)dbPersonalInfoData;
-(void)updatePersonalInfoDataWithID:(NSNumber *)objID  obj:(CPDBModelPersonalInfoData *)dbPersonalInfoData;
-(CPDBModelPersonalInfoData *)getPersonalInfoDataWithResultSet:(FMResultSet *)rs;
-(CPDBModelPersonalInfoData *)findPersonalInfoDataWithID:(NSNumber *)id;
-(NSArray *)findAllPersonalInfoDatas;
-(CPDBModelPersonalInfoData *)findPersonalInfoDataWithPersonalID:(NSNumber *)personalID andClassify:(NSNumber *)classify;
-(NSArray *)findAllPersonalInfoDatasWithPersonalID:(NSNumber *)personalID;
@end
