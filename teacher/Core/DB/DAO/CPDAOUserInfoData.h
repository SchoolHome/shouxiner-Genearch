#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 用户信息数据
 */

@class CPDBModelUserInfoData;
@interface CPDAOUserInfoData : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;

-(void)createUserInfoDataTable;
-(NSNumber *)insertUserInfoData:(CPDBModelUserInfoData *)dbUserInfoData;
-(void)updateUserInfoDataWithID:(NSNumber *)objID  obj:(CPDBModelUserInfoData *)dbUserInfoData;
-(CPDBModelUserInfoData *)getUserInfoDataWithResultSet:(FMResultSet *)rs;
-(CPDBModelUserInfoData *)findUserInfoDataWithID:(NSNumber *)id;
-(NSArray *)findAllUserInfoDatas;
-(NSArray *)findAllUserInfoDatasOrderByInfoID;
-(void)deleteAllUserDatas;
-(void)deleteUserDataWithUserName:(NSString *)userName;
-(NSString *)getCoupleNameWithName:(NSString *)accountName;
-(CPDBModelUserInfoData *)findUserInfoDataWithUserID:(NSNumber *)userID andClassify:(NSNumber *)classify;
-(NSArray *)findUserInfoDatasWithUserID:(NSNumber *)userID;
@end
