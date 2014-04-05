//
//  TImageOperator.m
//  ShakeIcon
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TImageOperator.h"
#import "UIImage+Utility.h"
#import "ImageFilter.h"
@interface TImageOperator(private)
- (CGFloat) clamp:(CGFloat)pixel;
@end

@implementation TImageOperator

const CGFloat kRoundRadius = 20;
const CGFloat kReflectPercent = -0.25f;
const CGFloat kReflectOpacity = 0.3f;
const CGFloat kReflectDistance = 10.0f;

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,float ovalHeight)
{
    float fw,fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    //UIGraphicsPushContext(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    
    CGContextRestoreGState(context);
    CGContextClosePath(context);
    //UIGraphicsPopContext();
}

static TImageOperator * sharedInstance = nil;
- (id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}
+ (TImageOperator *)sharedInstance{
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

#pragma mark RoundedImage
- (UIImage *)doCreateCircleImage:(UIImage *)image{
    
    CGSize imageSize = image.size;
    UIImage *roundImage = [image roundedRectWith:imageSize.height/2
                                          cornerMask:UIImageRoundedCornerBottomLeft|UIImageRoundedCornerBottomRight|UIImageRoundedCornerTopLeft|UIImageRoundedCornerTopRight];
    return roundImage;

}
- (UIImage *)doCreateRoundImage:(UIImage *)image{
    CGSize imageSize = image.size;
    return [self doCreateRoundImage:image size:imageSize radius:kRoundRadius];
}
- (UIImage *)doCreateRoundImage:(UIImage *)image size:(CGSize)size{
    return [self doCreateRoundImage:image size:size radius:kRoundRadius];
}
- (UIImage *)doCreateRoundImage:(UIImage *)image size:(CGSize)size radius:(CGFloat)radius{
    CGFloat w = size.width;
    CGFloat h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return [UIImage imageWithCGImage:imageMasked];
}

#pragma mark ClipImage
-(UIImage *)doCreateClipImage:(UIImage *)image{
    CGFloat width = 100;
    CGFloat height = 30;
    CGRect imageRect = CGRectMake(0, 30, width, height);
    CGSize imageSize = CGSizeMake(width, height);
    
    UIGraphicsBeginImageContext(imageSize);
    [image drawInRect:imageRect];
    UIImage * clipImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return clipImage;
}
- (UIImage *)doCreateGrayImage:(UIImage *)image{
    
    int kRed = 1;
    int kGreen = 2;
    int kBlue = 4;
    
    int colors = kGreen;
    int m_width = image.size.width;
    int m_height = image.size.height;
    
    uint32_t *rgbImage = (uint32_t *) malloc(m_width * m_height * sizeof(uint32_t));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImage, m_width, m_height, 8, m_width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, m_width, m_height), [image CGImage]);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // now convert to grayscale
    uint8_t *m_imageData = (uint8_t *) malloc(m_width * m_height);
    for(int y = 0; y < m_height; y++) {
        for(int x = 0; x < m_width; x++) {
            uint32_t rgbPixel=rgbImage[y*m_width+x];
            uint32_t sum=0,count=0;
            if (colors & kRed) {sum += (rgbPixel>>24)&255; count++;}
            if (colors & kGreen) {sum += (rgbPixel>>16)&255; count++;}
            if (colors & kBlue) {sum += (rgbPixel>>8)&255; count++;}
            m_imageData[y*m_width+x]=sum/count;
        }
    }
    free(rgbImage);
    
    // convert from a gray scale image back into a UIImage
    uint8_t *result = (uint8_t *) calloc(m_width * m_height *sizeof(uint32_t), 1);
    
    // process the image back to rgb
    for(int i = 0; i < m_height * m_width; i++) {
        result[i*4]=0;
        int val=m_imageData[i];
        result[i*4+1]=val;
        result[i*4+2]=val;
        result[i*4+3]=val;
    }
    
    // create a UIImage
    colorSpace = CGColorSpaceCreateDeviceRGB();
    context = CGBitmapContextCreate(result, m_width, m_height, 8, m_width * sizeof(uint32_t), colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGImageRef image_ = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *resultUIImage = [UIImage imageWithCGImage:image_];
    CGImageRelease(image_);
    
    free(m_imageData);
    
    // make sure the data will be released by giving it to an autoreleased NSData
    [NSData dataWithBytesNoCopy:result length:m_width * m_height];
    
    return resultUIImage;
}
- (CGFloat) clamp:(CGFloat)pixel
{
    if(pixel > 255) return 255;
    else if(pixel < 0) return 0;
    return pixel;
}
- (UIImage*) doCreateSaturationImage:(CGFloat)s image:(UIImage *)srcImage
{
    CGImageRef inImage = srcImage.CGImage;
    CFDataRef ref = CGDataProviderCopyData(CGImageGetDataProvider(inImage)); 
    UInt8 * buf = (UInt8 *) CFDataGetBytePtr(ref); 
    int length = CFDataGetLength(ref);
    
    for(int i=0; i<length; i+=4)
    {
        int r = buf[i];
        int g = buf[i+1];
        int b = buf[i+2];
        
        CGFloat avg = (r + g + b) / 3.0;
        buf[i] = [self clamp:(r - avg) * s + avg];
        buf[i+1] = [self clamp:(g - avg) * s + avg];
        buf[i+2] = [self clamp:(b - avg) * s + avg];
         
    }
    
    CGContextRef ctx = CGBitmapContextCreate(buf,
                                             CGImageGetWidth(inImage), 
                                             CGImageGetHeight(inImage), 
                                             CGImageGetBitsPerComponent(inImage),
                                             CGImageGetBytesPerRow(inImage), 
                                             CGImageGetColorSpace(inImage),
                                             CGImageGetAlphaInfo(inImage));
    
    CGImageRef img = CGBitmapContextCreateImage(ctx);
    CFRelease(ref);
    CGContextRelease(ctx);
    return [UIImage imageWithCGImage:img];
}
- (UIImage *)doCreateSaturationImageWithImage:(UIImage *)srcImage{
    return [srcImage  saturate:1.5];
   // return [srcImage convertToGrayscale];
}
- (UIImage *)doCreateScaleImageWithSize:(CGSize)size image:(UIImage *)image{
    UIImage *sourceImage = image;  
    UIImage *newImage = nil;          
    CGSize imageSize = sourceImage.size;  
    CGFloat width = imageSize.width;  
    CGFloat height = imageSize.height;  
    CGFloat targetWidth = size.width;  
    CGFloat targetHeight = size.height;  
    CGFloat scaleFactor = 0.0;  
    CGFloat scaledWidth = targetWidth;  
    CGFloat scaledHeight = targetHeight;  
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);  
    if (CGSizeEqualToSize(imageSize, size) == NO)   
    {  
        CGFloat widthFactor = targetWidth / width;  
        CGFloat heightFactor = targetHeight / height;  
        if (widthFactor > heightFactor)   
            scaleFactor = widthFactor; // scale to fit height  
        else  
            scaleFactor = heightFactor; // scale to fit width  
        scaledWidth  = width * scaleFactor;  
        scaledHeight = height * scaleFactor;  
        // center the image  
        if (widthFactor > heightFactor)  
        {  
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;   
        }  
        else   
            if (widthFactor < heightFactor)  
            {  
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;  
            }  
    }         
    UIGraphicsBeginImageContext(size); // this will crop  
    CGRect thumbnailRect = CGRectZero;  
    thumbnailRect.origin = thumbnailPoint;  
    thumbnailRect.size.width  = scaledWidth;  
    thumbnailRect.size.height = scaledHeight;  
    [sourceImage drawInRect:thumbnailRect];  
    newImage = UIGraphicsGetImageFromCurrentImageContext();  
    if(newImage == nil)   
       // NSLog(@"could not scale image");  
    //pop the context to get back to the default  
    UIGraphicsEndImageContext();  
    return newImage;  
}
@end



