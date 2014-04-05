//
//  RegistInfo.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistInfo : NSObject{
    NSString *nikename;
    NSInteger sex;
    NSDictionary *imgdict;
    NSInteger lifestatus;
}
@property (strong,nonatomic) NSString *nikename;
@property (nonatomic) NSInteger sex;
@property (strong,nonatomic) NSDictionary *imgdict;
@property (nonatomic) NSInteger lifestatus;

@end
