//
//  CPDAOPetInfo.h
//  iCouple
//
//  Created by yl s on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseDAO.h"

@class CPDBModelPetInfo;
@class CPDBModelPetData;

@interface CPDAOPetInfo : BaseDAO

- (id)initWithStatusCode:(NSInteger)statusCode;
- (void)initDefautlData;

- (void)createPetInfoTable;

- (NSNumber *)insertPetInfo:(CPDBModelPetInfo *)dbPetInfo;
- (NSNumber *)insertPetData:(CPDBModelPetData *)dbPetData;

- (void)updatePetInfoWithID:(NSNumber *)objID obj:(CPDBModelPetInfo *)dbPetInfo;
- (void)updatePetDataWithID:(NSNumber *)objID obj:(CPDBModelPetData *)dbPetData;

- (CPDBModelPetInfo *)getPetInfoWithResultSet:(FMResultSet *)rs;
- (CPDBModelPetData *)getPetDataWithResultSet:(FMResultSet *)rs;

- (CPDBModelPetInfo *)findPetInfoWithID:(NSNumber *)id;
- (CPDBModelPetData *)findPetDataWithID:(NSNumber *)id;

- (NSArray *)findAllPetInfo;    //elem : CPDBModelPetInfo.
- (NSArray *)findAllPetData;    //elem : CPDBModelPetData.

@end
