//
//  UIImage+ProportionalFill.m
//
//  Created by Matt Gemmell on 20/08/2008.
//  Copyright 2008 Instinctive Code.
//

#import "UIImage+ProportionalFill.h"


@implementation UIImage (MGProportionalFill)

- (UIImage*)imageByScalingAndCroppingForSizeEx:(CGSize)targetSize
{  
    
    UIImage *sourceImage = self;  
    
    UIImage *newImage = nil;          
    
    CGSize imageSize = sourceImage.size;  
    
    CGFloat width = imageSize.width;  
    
    CGFloat height = imageSize.height;  
    
    CGFloat targetWidth = targetSize.width;  
    
    CGFloat targetHeight = targetSize.height;  
    
    CGFloat scaleFactor = 0.0;  
    
    CGFloat scaledWidth = targetWidth;  
    
    CGFloat scaledHeight = targetHeight;  
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);  
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)   
        
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
    
   // UIGraphicsBeginImageContext(targetSize); // this will crop  
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0); // 0.0 for scale means "correct scale for device's main screen".
 
    CGRect thumbnailRect = CGRectZero;  
    
    thumbnailRect.origin = thumbnailPoint;  
    
    thumbnailRect.size.width  = scaledWidth;  
    
    thumbnailRect.size.height = scaledHeight;  
    
    [sourceImage drawInRect:thumbnailRect];  
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();  
    
    if(newImage == nil)   
        
        CPLogInfo(@"could not scale image");  
    
    //pop the context to get back to the default  
    
    UIGraphicsEndImageContext();  
    
    return newImage;  
    
}


- (UIImage *)imageToFitSize:(CGSize)fitSize method:(MGImageResizingMethod)resizeMethod
{
	float imageScaleFactor = 1.0;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
	if ([self respondsToSelector:@selector(scale)]) {
		imageScaleFactor = [self scale];
	}
#endif
	
    float sourceWidth = [self size].width * imageScaleFactor;
    float sourceHeight = [self size].height * imageScaleFactor;
    float targetWidth = fitSize.width;
    float targetHeight = fitSize.height;
    BOOL cropping = !(resizeMethod == MGImageResizeScale);
	
    // Calculate aspect ratios
    float sourceRatio = sourceWidth / sourceHeight;
    float targetRatio = targetWidth / targetHeight;
    
    // Determine what side of the source image to use for proportional scaling
    BOOL scaleWidth = (sourceRatio <= targetRatio);
    // Deal with the case of just scaling proportionally to fit, without cropping
    scaleWidth = (cropping) ? scaleWidth : !scaleWidth;
    
    // Proportionally scale source image
    float scalingFactor, scaledWidth, scaledHeight;
    if (scaleWidth) {
        scalingFactor = 1.0 / sourceRatio;
        scaledWidth = targetWidth;
        scaledHeight = round(targetWidth * scalingFactor);
    } else {
        scalingFactor = sourceRatio;
        scaledWidth = round(targetHeight * scalingFactor);
        scaledHeight = targetHeight;
    }
    float scaleFactor = scaledHeight / sourceHeight;
    
    // Calculate compositing rectangles
    CGRect sourceRect, destRect;
    if (cropping) {
        destRect = CGRectMake(0, 0, targetWidth, targetHeight);
        float destX = 0.0f, destY = 0.0f;
        if (resizeMethod == MGImageResizeCrop) {
            // Crop center
            destX = round((scaledWidth - targetWidth) / 2.0);
            destY = round((scaledHeight - targetHeight) / 2.0);
        } else if (resizeMethod == MGImageResizeCropStart) {
            // Crop top or left (prefer top)
            if (scaleWidth) {
				// Crop top
				destX = 0.0;
				destY = 0.0;
            } else {
				// Crop left
                destX = 0.0;
				destY = round((scaledHeight - targetHeight) / 2.0);
            }
        } else if (resizeMethod == MGImageResizeCropEnd) {
            // Crop bottom or right
            if (scaleWidth) {
				// Crop bottom
				destX = round((scaledWidth - targetWidth) / 2.0);
				destY = round(scaledHeight - targetHeight);
            } else {
				// Crop right
				destX = round(scaledWidth - targetWidth);
				destY = round((scaledHeight - targetHeight) / 2.0);
            }
        }
        sourceRect = CGRectMake(destX / scaleFactor, destY / scaleFactor, 
                                targetWidth / scaleFactor, targetHeight / scaleFactor);
    } else {
        sourceRect = CGRectMake(0, 0, sourceWidth, sourceHeight);
        destRect = CGRectMake(0, 0, scaledWidth, scaledHeight);
    }
    
    // Create appropriately modified image.
	UIImage *image = nil;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0) {
		UIGraphicsBeginImageContextWithOptions(destRect.size, NO, 1.0); // 0.0 for scale means "correct scale for device's main screen".
		CGImageRef sourceImg = CGImageCreateWithImageInRect([self CGImage], sourceRect); // cropping happens here.
		image = [UIImage imageWithCGImage:sourceImg scale:0.0 orientation:self.imageOrientation]; // create cropped UIImage.
        CPLogInfo(@"Dest rect:%f %f %f %f", destRect.origin.x,destRect.origin.y,destRect.size.width,destRect.size.height);
		[image drawInRect:destRect]; // the actual scaling happens here, and orientation is taken care of automatically.
		CGImageRelease(sourceImg);
		image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
	}
#endif
    CPLogInfo(@"Dest rect1:%f %f %f %f", destRect.origin.x,destRect.origin.y,destRect.size.width,destRect.size.height);
	if (!image) {
		// Try older method.
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		CGContextRef context = CGBitmapContextCreate(NULL, fitSize.width, fitSize.height, 8, (fitSize.width * 4), 
													 colorSpace, kCGImageAlphaPremultipliedLast);
		CGImageRef sourceImg = CGImageCreateWithImageInRect([self CGImage], sourceRect);
		CGContextDrawImage(context, destRect, sourceImg);
		CGImageRelease(sourceImg);
		CGImageRef finalImage = CGBitmapContextCreateImage(context);	
		CGContextRelease(context);
		CGColorSpaceRelease(colorSpace);
		image = [UIImage imageWithCGImage:finalImage];
		CGImageRelease(finalImage);
	}
	
    return image;
}


- (UIImage *)imageCroppedToFitSize:(CGSize)fitSize
{
    return [self imageToFitSize:fitSize method:MGImageResizeCrop];
}


- (UIImage *)imageScaledToFitSize:(CGSize)fitSize
{
    return [self imageToFitSize:fitSize method:MGImageResizeScale];
}


@end
