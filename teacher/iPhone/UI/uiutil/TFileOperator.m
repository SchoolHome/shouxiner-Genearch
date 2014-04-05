//
//  TFileOperator.m
//  iCouple
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TFileOperator.h"




@implementation TFileOperator
static TFileOperator * sharedInstance = nil;
- (id)init{
    self = [super init];
    if(self){
        [self doInitConfig];
    }
    return self;
}
+ (TFileOperator *)sharedInstance{
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
    documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    fileManager  = [NSFileManager defaultManager];
    [self doCreateDirectory];
    [self doCopyBundleToDirectory];
}
- (BOOL)doFindFile:(NSString *)fileName{
    return NO;
}
- (void)doCreateDirectory{
    NSError * error;
    imageDirectory = [documentsDirectory stringByAppendingPathComponent:@"imageDir"];
    stringDirectory = [documentsDirectory stringByAppendingPathComponent:@"stringDir"];
    dataDirectory = [documentsDirectory stringByAppendingPathComponent:@"dataDir"];
    [fileManager createDirectoryAtPath:imageDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    [fileManager createDirectoryAtPath:stringDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    [fileManager createDirectoryAtPath:dataDirectory withIntermediateDirectories:YES attributes:nil error:&error];
}
- (void)doCopyBundleToDirectory{
    imageNormalDirectory = [imageDirectory stringByAppendingPathComponent:@"ImageNormal"];
    addRelationDirectory = [imageDirectory stringByAppendingPathComponent:@"AddRelation"];
    [fileManager createDirectoryAtPath:addRelationDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    NSBundle * mainBundle = [NSBundle mainBundle];
    NSString * addRelationPath = [mainBundle pathForResource:@"AddRelation" ofType:@"bundle"];
    NSBundle * addRelationBundle = [NSBundle bundleWithPath:addRelationPath];
    
    NSArray * contents = [fileManager contentsOfDirectoryAtPath:addRelationPath error:nil];
    for(NSString * str in contents){
        NSString * bundlePath = [addRelationBundle pathForResource:str ofType:nil];
        NSString * docPath = [addRelationDirectory stringByAppendingPathComponent:str];
        BOOL exist = [fileManager fileExistsAtPath:docPath];
        if(exist == NO){
            [fileManager copyItemAtPath:bundlePath toPath:docPath error:nil];
            // NSLog(@"创建:%@",docPath);
        }
        else{
           // NSData * data = [[NSData alloc] initWithContentsOfFile:docPath];
            //NSLog(@"已经存在:%@,大小:%d",docPath,[data length]);
        }
    }

}
#pragma mark Write
- (void)doWriteStringToFile:(NSString *)fileName withContentString:(NSString *)contentString{
    NSString * endFileName = [stringDirectory stringByAppendingPathComponent:fileName];
    NSError * error;
    BOOL resultBool = [contentString writeToFile:endFileName atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if(resultBool == YES){
        
    }
    else{
        
    }
}
- (void)doWriteDataToFile:(NSString *)fileName withContentData:(NSData *)contentData{
    
}
- (void)doWriteImageToFile:(NSString *)fileName withContentImage:(UIImage *)contentImage{
    
}
#pragma mark Read
- (void)doReadStringFromFile:(NSString *)fileName resultString:(NSString *)resultString{
    NSString * endFileName = [stringDirectory stringByAppendingPathComponent:fileName];
    NSError * error;
    NSString * str =  [NSString stringWithContentsOfFile:endFileName encoding:NSUTF8StringEncoding error:&error];
    resultString = str;
}
- (void)doReadDataFromFile:(NSString *)fileName resultData:(NSData *)resultData{
    
}
- (void)doReadImageFromFile:(NSString *)fileName resultImage:(UIImage *)resultImage{

}
- (NSString *)doReadStringFromFile:(NSString *)fileName{
    NSString * endFileName = [stringDirectory stringByAppendingPathComponent:fileName];
    NSError * error;
    NSString * resultString =  [NSString stringWithContentsOfFile:endFileName encoding:NSUTF8StringEncoding error:&error];
    return resultString;
}
- (NSData *)doReadDataFromFile:(NSString *)fileName{
    return nil;
}
- (UIImage *)doReadImageFromFile:(NSString *)fileName{
    NSString * imagePath = [addRelationDirectory stringByAppendingPathComponent:fileName];
    UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}
- (void)doReadFile{  
    NSString * fileName = [documentsDirectory stringByAppendingPathComponent:@"hello.txt"];
    
    
    NSData * data = [NSData dataWithContentsOfFile:fileName];
    NSString * str2 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"fileArray:%@",fileArray);
    //NSLog(@"str2:%@",str2);
  
}
- (void)doWriteFile{
    NSString * fileName = [documentsDirectory stringByAppendingPathComponent:@"hello.txt"];
    NSString * str = @"hello";
    BOOL result = [str writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if(result == YES){
        
    }
    else{
        //NSLog(@"strw error");
    }
}
@end
