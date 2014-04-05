#import <Foundation/Foundation.h>
#import "BaseDAO.h"


/**
 * 资源
 */

@class CPDBModelResource;
@interface CPDAOResource : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
-(void)createResourceTable;
-(NSNumber *)insertResource:(CPDBModelResource *)dbResource;
-(void)updateResourceWithID:(NSNumber *)objID  obj:(CPDBModelResource *)dbResource;
-(CPDBModelResource *)getResourceWithResultSet:(FMResultSet *)rs;
-(CPDBModelResource *)findResourceWithID:(NSNumber *)id;
-(CPDBModelResource *)findResourceWithServerUrl:(NSString *)serverUrl;
-(CPDBModelResource *)findResourceWithServerUrl:(NSString *)serverUrl andObjID:(NSNumber *)objID andObjType:(NSNumber *)objType;
-(CPDBModelResource *)findResourceWithObjID:(NSNumber *)objID andResType:(NSNumber *)resType;
-(CPDBModelResource *)findResourceWithObjID:(NSNumber *)objID andObjType:(NSNumber *)objType andType:(NSNumber *)type;
-(NSArray *)findAllResources;
-(NSArray *)findAllResourcesWithMark:(NSInteger)mark;
-(void)updateResourceWithID:(NSNumber *)objID mark:(NSInteger )mark;
-(void)updateResourceWithID:(NSNumber *)objID updateTime:(NSNumber *)updateTime;
-(void)updateResourceWithID:(NSNumber *)objID url:(NSString *)url;
-(void)updateObjIDWithResID:(NSNumber *)resID obj_id:(NSNumber *)objID;
-(void)delResourceWithResID:(NSNumber *)resID;
@end
