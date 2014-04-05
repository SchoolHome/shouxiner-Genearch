//
//  GDDB.m
//  
//
//  Created by wei yong on 12-3-6.
//

#import "CPDataBaseManager.h"

#define CP_DB       @"COUPLE_DB01.db"
#define CP_AB_DB    @"COUPLE_AB_DB01.db"

@implementation CPDataBaseManager
@synthesize statusCode,statusAbCode;

static CPDataBaseManager *instance = nil;

+(CPDataBaseManager *)getInstance
{
	@synchronized(self)
	{
		if (instance==nil) 
		{
			instance = [[CPDataBaseManager alloc]init];
		}
	}
	return instance;
}
- (id) init
{
    self = [super init];
    if (self)
    {
        BOOL isSucess = [self initAbDatabase];
        CPLogInfo(@"begin init db %d",isSucess);
    }
    return self;
}
+(id)allocWithZone:(NSZone *)zone
{
	@synchronized(self)
	{
		if (instance==nil) 
        {
			instance = [super allocWithZone:zone];
			return instance;
		}
	}
	return nil;
}

- (BOOL)initDatabaseWithLoginName:(NSString *)loginName
{
    if (!loginName)
    {
        loginName = @"";
        CPLogError(@"error,login name is null");
    }
    NSString *dbPath = [NSString stringWithFormat:@"%@/%@",loginName,CP_DB];
    CPLogInfo(@"dbpath is  %@",dbPath);
	BOOL success;
	NSError *error;
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:dbPath];
	NSString *loginNamePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",loginName]];
    
	success = [fm fileExistsAtPath:writableDBPath];
	CPLogInfo(@"db's path is  %@",writableDBPath);
    self.statusCode = 0;
	if(!success)
    {
        success = [fm createDirectoryAtPath:loginNamePath withIntermediateDirectories:YES attributes:nil error:&error];

        if (success)
        {
            //如果不存在，标记一下，利于数据库建表
            self.statusCode = 1;
            NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbPath];
            CPLogInfo(@"%@",defaultDBPath);
            success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
            if(!success)
            {
                CPLogError(@"error: %@", [error localizedDescription]);
            }
            success = YES;
        }
    }
	
	if(success)
    {
		cpDB = [FMDatabase databaseWithPath:writableDBPath];
		if ([cpDB open]) 
        {
			[cpDB setShouldCacheStatements:YES];
		}else
        {
			CPLogError(@"Failed to open database.");
			success = NO;
		}
	}
	
	return success;
}


- (void)closeDatabase
{
    [cpDB clearCachedStatements];
	[cpDB close];
}

-(void)beginTransaction
{
    [cpDB beginTransaction];
}
-(void)commit
{
    [cpDB commit];
}
- (FMDatabase *)getDatabase
{
    return cpDB;
}

-(BOOL)initAbDatabase
{
    BOOL success;
	NSError *error;
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:CP_AB_DB];
	
	success = [fm fileExistsAtPath:writableDBPath];
	CPLogInfo(@"db's path is  %@",writableDBPath);
	if(!success)
    {
        //如果不存在，标记一下，利于数据库建表
        self.statusAbCode = 1;
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:CP_AB_DB];
		CPLogInfo(@"%@",defaultDBPath);
		success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if(!success)
        {
			CPLogError(@"error: %@", [error localizedDescription]);
		}
		success = YES;
	}
	
	if(success)
    {
		cpAbDB = [FMDatabase databaseWithPath:writableDBPath];
		if ([cpAbDB open]) 
        {
			[cpAbDB setShouldCacheStatements:YES];
		}else
        {
			CPLogError(@"Failed to open ab database.");
			success = NO;
		}
	}
	
	return success;
}
-(void)closeDbDatabase
{
    [cpAbDB close];
}
- (FMDatabase *)getAbDatabase
{
    return cpAbDB;
}
-(void)beginTransactionAbDB
{
    [cpAbDB beginTransaction];
}
-(void)commitAbDB
{
    [cpAbDB commit];
}

- (void)dealloc
{
	[self closeDatabase];
	[self closeDbDatabase];
}


@end
