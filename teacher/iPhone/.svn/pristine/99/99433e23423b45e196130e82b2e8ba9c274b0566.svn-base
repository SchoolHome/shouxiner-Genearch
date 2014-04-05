//
//  FXPictureIcon.m
//  ShakeIcon
//
//  Created by 振杰 李 on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXPictureIcon.h"

@implementation FXPictureIcon
@synthesize imgview;
//114*114
- (id)initWithFrame:(CGRect)frame image:(UIImage *)img
{
    self=[self initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
        imgview=img;
        
        self.layer.borderColor=[[UIColor whiteColor] CGColor]; 
        
        self.layer.borderWidth=2;
        
        self.layer.shadowColor=[[UIColor whiteColor] CGColor];
        
        self.layer.shouldRasterize=YES;
        
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
    
    CGColorSpaceRef maskColorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGRect rrect=CGRectMake(2,0,rect.size.width-2,rect.size.height-2);
    
    CGContextRef mainMaskContextRef = CGBitmapContextCreate(NULL,
                                                            rect.size.width, 
                                                            rect.size.height, 
                                                            8, 
                                                            rect.size.width, 
                                                            maskColorSpaceRef, 
                                                            0);
    
    CGContextRef shineMaskContextRef = CGBitmapContextCreate(NULL,
                                                             rect.size.width, 
                                                             rect.size.height, 
                                                             8, 
                                                             rect.size.width, 
                                                             maskColorSpaceRef, 
                                                             0);
    
    CGColorSpaceRelease(maskColorSpaceRef);
    CGContextSetFillColorWithColor(mainMaskContextRef, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(shineMaskContextRef, [UIColor blackColor].CGColor);
    CGContextFillRect(mainMaskContextRef, rect);
    CGContextFillRect(shineMaskContextRef, rect);
    CGContextSetFillColorWithColor(mainMaskContextRef, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(shineMaskContextRef, [UIColor whiteColor].CGColor);
  
    
    CGFloat radius=10.0;
    
    CGFloat minx =CGRectGetMinX(rrect),midx= CGRectGetMidY(rrect),maxx= CGRectGetMaxX(rrect);
    
    CGFloat miny=CGRectGetMinY(rrect),midy=CGRectGetMidY(rrect),maxy=CGRectGetMaxY(rrect);
    
    CGContextMoveToPoint(mainMaskContextRef, minx, midy);
    
    CGContextAddArcToPoint(mainMaskContextRef, minx, miny, midx, miny, radius);
    
    CGContextAddArcToPoint(mainMaskContextRef, maxx, miny,maxx, midy, radius);
    
    CGContextAddArcToPoint(mainMaskContextRef, maxx, maxy, midx, maxy, radius);
    
    CGContextAddArcToPoint(mainMaskContextRef, minx, maxy, minx, midy, radius);
    
    CGContextFillPath(mainMaskContextRef);
    
    CGImageRef mainMaskImageRef = CGBitmapContextCreateImage(mainMaskContextRef);
    
    CGImageRef shineMaskImageRef = CGBitmapContextCreateImage(shineMaskContextRef);
    
    CGContextRelease(mainMaskContextRef);
    
    CGContextRelease(shineMaskContextRef);
    // Done with mask context
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contextRef);
    
    CGImageRef imageRef = CGImageCreateWithMask(self.imgview.CGImage, mainMaskImageRef);
    
    CGContextTranslateCTM(contextRef, 0, rect.size.height);
    CGContextScaleCTM(contextRef, 1.0, -1.0);
    
    CGContextSaveGState(contextRef);
    
    // Draw image
    CGContextDrawImage(contextRef, rect, imageRef);
    
    CGContextRestoreGState(contextRef);
    CGContextSaveGState(contextRef);
    
    CGContextRestoreGState(contextRef);
    
    CGContextSetLineWidth(contextRef,1.8);
    
    CGContextSetStrokeColorWithColor(contextRef, [UIColor whiteColor].CGColor);
    CGContextMoveToPoint(contextRef, minx, midy);
    CGContextAddArcToPoint(contextRef, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(contextRef, maxx, miny,maxx, midy, radius);
    CGContextAddArcToPoint(contextRef, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(contextRef, minx, maxy, minx, midy, radius);
    CGContextAddArcToPoint(contextRef, minx, miny, midy, miny, radius);
    CGContextStrokePath(contextRef);
    CGContextRestoreGState(contextRef);
}


@end
