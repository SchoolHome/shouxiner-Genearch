//
//  UIImage+Utility.h
//  RoundView
//
//  Created by jhwang on 11-6-16.
//  Copyright 2011 Cybozu, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    UIImageRoundedCornerTopLeft = 1,
    UIImageRoundedCornerTopRight = 1 << 1,
    UIImageRoundedCornerBottomRight = 1 << 2,
    UIImageRoundedCornerBottomLeft = 1 << 3
} UIImageRoundedCorner;

@interface UIImage (Utility)
- (UIImage *)roundedRectWith:(float)radius cornerMask:(UIImageRoundedCorner)cornerMask;

@end
