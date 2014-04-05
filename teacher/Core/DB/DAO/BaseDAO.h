//
//  BaseDAO.h
//  
//
//  Created by wei yong on 12-3-6.
//

#import <Foundation/Foundation.h>

#import "FMResultSet.h"
#import "FMDatabaseAdditions.h"
#import "CPDataBaseManager.h"


@interface BaseDAO : NSObject 
{
    FMDatabase *db;
    FMDatabase *abDb;
}

@property (strong,nonatomic) FMDatabase *db;
@property (strong,nonatomic) FMDatabase *abDb;

-(NSNumber *)lastRowID;
-(NSNumber *)lastAbDbRowID;
@end
