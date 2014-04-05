#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 用户信息附加数据
 */

@class CPDBModelUserInfoDataAddition;
@interface CPDAOUserInfoDataAddition : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;

-(void)createUserInfoDataAdditionTable;
-(NSNumber *)insertUserInfoDataAddition:(CPDBModelUserInfoDataAddition *)dbUserInfoDataAddition;
-(void)updateUserInfoDataAdditionWithID:(NSNumber *)objID  obj:(CPDBModelUserInfoDataAddition *)dbUserInfoDataAddition;
-(CPDBModelUserInfoDataAddition *)getUserInfoDataAdditionWithResultSet:(FMResultSet *)rs;
-(CPDBModelUserInfoDataAddition *)findUserInfoDataAdditionWithID:(NSNumber *)id;
-(NSArray *)findAllUserInfoDataAdditions;

@end
