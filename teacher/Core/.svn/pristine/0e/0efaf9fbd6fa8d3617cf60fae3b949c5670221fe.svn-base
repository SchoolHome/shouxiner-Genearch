//
//  BaseDAO.m
//  
//
//  Created by wei yong on 12-3-6.
//

#import "BaseDAO.h"

@implementation BaseDAO
@synthesize db,abDb;

- (id)init
{
    self = [super init];
	if(self)
	{
		db = [[CPDataBaseManager getInstance] getDatabase];
        abDb = [[CPDataBaseManager getInstance] getAbDatabase];
	}
	
	return self;
}

-(NSNumber *)lastRowID
{
    return [NSNumber numberWithLongLong:[db lastInsertRowId]];
}
-(NSNumber *)lastAbDbRowID
{
    return [NSNumber numberWithLongLong:[abDb lastInsertRowId]];
}

- (void)dealloc 
{
//	[db release];
}
@end
