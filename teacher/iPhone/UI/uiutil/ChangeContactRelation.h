//
//  ChangeContactRelation.h
//  iCouple
//
//  Created by qing zhang on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
@interface ChangeContactRelation : NSObject

-(NSArray *)ChangeContactRelationByUserInfo : (CPUIModelUserInfo *)userInfo;

-(BOOL)hasCoupleOrNot : (CPUIModelUserInfo *)userInfo;
@end
