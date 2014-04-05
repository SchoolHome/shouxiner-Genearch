//
//  TBundleOperator.h
//  iCouple
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBundleOperator : NSObject
{
    NSString * imageNormalPath;
    NSBundle * imageNormalBundle;
}
+ (TBundleOperator *)sharedInstance;
- (UIImage *)doGetImageFromImageNormalBundleWithFileName:(NSString *)fileName;
@end
