//
//  RegistHelper.m
//  iCouple
//
//  Created by 振杰 李 on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RegistHelper.h"

@implementation RegistHelper
static RegistHelper *manager;

-(id)init{
    
    self=[super init];
    if (self){
        sessiondict=[[NSMutableDictionary alloc] init];
    }
    return self;
}

+(id)defaultHelper{
    
    @synchronized (self)
    {
        if (manager == nil)
        {
            manager = [[RegistHelper alloc] init];
        }
    }
    return manager;
}

-(void)setProperty:(NSString *)key Value:(NSObject *)object{
    
    [sessiondict setValue:object forKey:key];
    
}

-(NSObject *)getProerty:(NSString *)key{
    
    return  [sessiondict valueForKey:key];
    
}


-(void)RemovePropertyForKey:(NSString *)key{
    [sessiondict removeObjectForKey:key];
}
@end
