//
//  RegistHelper.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistHelper : NSObject{
    NSMutableDictionary *sessiondict;
}


-(void)setProperty:(NSString *)key Value:(NSObject *)object;

-(NSObject *)getProerty:(NSString *)key;

-(void)RemovePropertyForKey:(NSString *)key;

+(id)defaultHelper;
@end
