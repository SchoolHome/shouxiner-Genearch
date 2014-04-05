//
//  TBundleOperator.m
//  iCouple
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TBundleOperator.h"
@interface TBundleOperator(private)
- (void)doInitConfig;
- (NSBundle *)doGetImageNormalBundle;
@end
@implementation TBundleOperator
static TBundleOperator * sharedInstance = nil;
- (id)init{
    self = [super init];
    if(self){
        [self doInitConfig];
    }
    return self;
}
+ (TBundleOperator *)sharedInstance{
    if(sharedInstance == nil){
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}
+ (id)allocWithZone:(NSZone *)zone{
    return [self sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}
#pragma mark Action
- (void)doInitConfig{
    NSBundle * mainBundle = [NSBundle mainBundle];
    
    imageNormalPath = [mainBundle pathForResource:@"ImageNormal" ofType:@"bundle"];
    imageNormalBundle = [NSBundle bundleWithPath:imageNormalPath];
}
- (NSBundle *)doGetImageNormalBundle{
    return imageNormalBundle;
}


- (UIImage *)doGetImageFromImageNormalBundleWithFileName:(NSString *)fileName{
    NSString * imagePath = [imageNormalBundle pathForResource:fileName ofType:nil];
    UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}
@end
