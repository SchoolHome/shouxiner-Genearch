//
//  TFileOperator.h
//  iCouple
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFileOperator : NSObject{
    NSString * documentsDirectory;
    NSFileManager * fileManager;
    NSArray * fileArray;
    /*
     根目录下的文件夹
     */
    NSString * imageDirectory;
    NSString * stringDirectory;
    NSString * dataDirectory;
    
    /*
     图片文件夹
     */
    NSString * imageNormalDirectory;
    NSString * addRelationDirectory;
    NSString * loginPath;
    NSString * registerPath;
    
}
+ (TFileOperator *)sharedInstance;
- (void)doInitConfig;
- (void)doCreateDirectory;
- (void)doCopyBundleToDirectory;
- (BOOL)doFindFile:(NSString *)fileName;
- (void)doWriteStringToFile:(NSString *)fileName withContentString:(NSString *)contentString;
- (void)doWriteDataToFile:(NSString *)fileName withContentData:(NSData *)contentData;
- (void)doWriteImageToFile:(NSString *)fileName withContentImage:(UIImage *)contentImage;
- (void)doReadStringFromFile:(NSString *)fileName resultString:(NSString *)resultString;
- (void)doReadDataFromFile:(NSString *)fileName resultData:(NSData *)resultData;
- (void)doReadImageFromFile:(NSString *)fileName resultImage:(UIImage *)resultImage;
- (NSString *)doReadStringFromFile:(NSString *)fileName;
- (NSData *)doReadDataFromFile:(NSString *)fileName;
- (UIImage *)doReadImageFromFile:(NSString *)fileName;

- (void)doWriteFile;
- (void)doReadFile;


@end
