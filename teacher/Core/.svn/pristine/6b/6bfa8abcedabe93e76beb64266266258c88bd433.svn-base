#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 宝宝信息数据
 */

@class CPDBModelBabyInfoData;
@interface CPDAOBabyInfoData : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createBabyInfoDataTable;
-(NSNumber *)insertBabyInfoData:(CPDBModelBabyInfoData *)dbBabyInfoData;
-(void)updateBabyInfoDataWithID:(NSNumber *)objID  obj:(CPDBModelBabyInfoData *)dbBabyInfoData;
-(CPDBModelBabyInfoData *)getBabyInfoDataWithResultSet:(FMResultSet *)rs;
-(CPDBModelBabyInfoData *)findBabyInfoDataWithID:(NSNumber *)id;
-(NSArray *)findAllBabyInfoDatas;

@end
