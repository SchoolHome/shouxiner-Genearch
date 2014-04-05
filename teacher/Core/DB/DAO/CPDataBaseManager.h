//
//  
//
//  Created by wei yong on 12-3-6.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface CPDataBaseManager : NSObject 
{
    
    FMDatabase *cpDB;
    FMDatabase *cpAbDB;
    NSInteger statusAbCode;
    NSInteger statusCode;
}
@property (nonatomic,assign) NSInteger statusCode;
@property (nonatomic,assign) NSInteger statusAbCode;
-(BOOL)initAbDatabase;
-(void)closeDbDatabase;
- (FMDatabase *)getAbDatabase;
-(void)beginTransactionAbDB;
-(void)commitAbDB;


- (BOOL)initDatabaseWithLoginName:(NSString *)loginName;
- (void)closeDatabase;
- (FMDatabase *)getDatabase;
-(void)beginTransaction;
-(void)commit;
+(CPDataBaseManager *)getInstance;

@end
