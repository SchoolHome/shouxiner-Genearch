#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 用户信息表
 */

@class CPDBModelUserInfo;
@interface CPDAOUserInfo : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createUserInfoTable;
-(NSNumber *)insertUserInfo:(CPDBModelUserInfo *)dbUserInfo;
-(void)updateUserInfoWithID:(NSNumber *)objID  obj:(CPDBModelUserInfo *)dbUserInfo;
-(CPDBModelUserInfo *)getUserInfoWithResultSet:(FMResultSet *)rs;
-(CPDBModelUserInfo *)findUserInfoWithID:(NSNumber *)id;
-(NSArray *)findAllUserInfos;
-(NSArray *)findAllUserInfosOrderByID;
-(NSArray *)findAllUserCommendInfos;
-(CPDBModelUserInfo *)findUserInfoWithAccount:(NSString *)account;

-(void)deleteRelationWithUserAccount:(NSString *)accountName;
-(void)deleteUserWithAccount:(NSString *)accountName;
-(void)updateUserRelationWithUserName:(NSString *)accountName relationType:(NSNumber *)type;
-(void)deleteAllUserInfos;
-(void)deleteFriendUserInfos;
-(void)deleteUserInfoWithAccount:(NSString *)account;
-(void)addRelationWithUserAccount:(NSString *)userAccount relation_account:(NSString *)relationAccount relation_type:(NSInteger)type;
@end
