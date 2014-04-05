#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 个人信息表
 */

@class CPDBModelPersonalInfo;
@interface CPDAOPersonalInfo : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createPersonalInfoTable;
-(NSNumber *)insertPersonalInfo:(CPDBModelPersonalInfo *)dbPersonalInfo;
-(void)updatePersonalInfoWithID:(NSNumber *)objID  obj:(CPDBModelPersonalInfo *)dbPersonalInfo;
-(CPDBModelPersonalInfo *)getPersonalInfoWithResultSet:(FMResultSet *)rs;
-(CPDBModelPersonalInfo *)findPersonalInfoWithID:(NSNumber *)id;
-(NSArray *)findAllPersonalInfos;
-(void)deletePersonalInfos;

-(void)updatePersonalInfoWithID:(NSNumber *)objID  andName:(NSString *)nickName andSex:(NSNumber *)sex andHiddenBaby:(NSNumber *)isHiddenBaby;
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andName:(NSString *)nickName andSex:(NSNumber *)sex andLifeStatus:(NSNumber *)lifeStatus;
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andSingleTime:(NSNumber *)singleTime;
-(void)updatePersonalInfoWithID:(NSNumber *)objID  andHasBaby:(NSNumber *)hasBaby;

@end
