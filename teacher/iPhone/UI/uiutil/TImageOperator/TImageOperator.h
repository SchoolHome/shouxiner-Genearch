//
//  TImageOperator.h
//  ShakeIcon
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@interface TImageOperator : NSObject
+ (TImageOperator *)sharedInstance;

- (UIImage *)doCreateCircleImage:(UIImage *)image;
- (UIImage *)doCreateRoundImage:(UIImage *)image;
- (UIImage *)doCreateRoundImage:(UIImage *)image size:(CGSize)size;
- (UIImage *)doCreateRoundImage:(UIImage *)image size:(CGSize)size radius:(CGFloat)radius;



- (UIImage *)doCreateClipImage:(UIImage *)image;
- (UIImage *)doCreateGrayImage:(UIImage *)image; 
- (UIImage*) doCreateSaturationImage:(CGFloat)s image:(UIImage *)srcImage;
- (UIImage *)doCreateSaturationImageWithImage:(UIImage *)srcImage;
- (UIImage *)doCreateScaleImageWithSize:(CGSize)size image:(UIImage *)image;
@end


