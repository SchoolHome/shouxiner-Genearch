//
//  TPCMToAMR.h
//  TPCM2AMR
//
//  Created by lixiaosong on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPCMToAMR : NSObject
+ (int)doConvertOriginalPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath;
+ (int)doConvertTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath;
+ (int)doConvertAMRFromPath:(NSString *)amrPath toPCMPath:(NSString *)pcmPath;

+ (int)doConvertCsTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath;
+ (int)doConvertCqTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath;
+ (int)doConvertTTwTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath;
+ (int)doConvertAlarmTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath;
@end
