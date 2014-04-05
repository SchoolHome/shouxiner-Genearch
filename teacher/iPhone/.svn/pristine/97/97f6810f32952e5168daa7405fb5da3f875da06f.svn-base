//
//  TPCMToAMR.m
//  TPCM2AMR
//
//  Created by lixiaosong on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TPCMToAMR.h"
//#import "AudioConfig.h"
#include "convertPcmToAmr.h"

#ifndef iCouple_AudioConfig_h
#define iCouple_AudioConfig_h

#define REMIND_PANEL [UIImage imageNamed:@"im_recording.png"]
#define ALERT_PANEL [UIImage imageNamed:@"im_recording_error.png"]
#define RUNTIME_HOME_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define TEMP_SAVE_PCM @"temp.caf"
#define TEMP_SAVE_AMR @"temp.amr"
#define TEMP_SAVE_WAV @"temp.wav"

#define TRANSTEMP_SAVE_PCM @"transtemp"


typedef enum {
    AUDIO_RECORD_TYPE_ORIGINAL,
    AUDIO_RECORD_TYPE_TRANSED
}AUDIO_RECORD_TYPE;
#endif

@implementation TPCMToAMR
+ (int)doConvertOriginalPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath{
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString * transtempPath = [NSString stringWithFormat:@"%@/%@",RUNTIME_HOME_PATH,TRANSTEMP_SAVE_PCM]; 
    const char * transtemp = [transtempPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * ctranstemp = const_cast<char *>(transtemp);
    
    printf("pcm:%s,amr:%s\n",cpcm,camr);
    char * ppcm;
    char * pamr;
    ppcm = const_cast<char *>(cpcm);
    pamr = const_cast<char *>(camr);
    
    int resultInt = 0;
    printf("tpath:%s",ctranstemp);
     if(convertPcmToAmr(ppcm, pamr,ctranstemp, false, 0, 0, 0)){
         resultInt = 1;
         printf("pcm2amr success\n");
     }
     else {
         resultInt = 0;
         printf("pcm2amr error\n");
     }
     
    return resultInt;
}
+ (int)doConvertTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath{
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString * transtempPath = [NSString stringWithFormat:@"%@/%@",RUNTIME_HOME_PATH,TRANSTEMP_SAVE_PCM]; 
    //NSString * transtempPath = [NSString stringWithFormat:@"%@",RUNTIME_HOME_PATH]; 
    const char * transtemp = [transtempPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * ctranstemp = const_cast<char *>(transtemp);
    
    printf("pcm:%s,amr:%s\n",cpcm,camr);
    char * ppcm;
    char * pamr;
    ppcm = const_cast<char *>(cpcm);
    pamr = const_cast<char *>(camr);
    
    int resultInt = 0;
    printf("tpath:%s",ctranstemp);
    if(convertPcmToAmr(ppcm, pamr,ctranstemp, true, 0, 6, 15)){
        resultInt = 1;
        printf("pcm2amr success\n");
    }
    else {
        resultInt = 0;
        printf("pcm2amr error\n");
    }
     
    /*
    if(convertPcmToAmr(ppcm, pamr,ctranstemp, false, 0, 0, 0)){
        printf("pcm2amr success\n");
    }
    else {
        printf("pcm2amr error\n");
    }
     */
    return resultInt;
}
+ (int)doConvertCsTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath{
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString * transtempPath = [NSString stringWithFormat:@"%@/%@",RUNTIME_HOME_PATH,TRANSTEMP_SAVE_PCM];
    //NSString * transtempPath = [NSString stringWithFormat:@"%@",RUNTIME_HOME_PATH];
    const char * transtemp = [transtempPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * ctranstemp = const_cast<char *>(transtemp);
    
    printf("pcm:%s,amr:%s\n",cpcm,camr);
    char * ppcm;
    char * pamr;
    ppcm = const_cast<char *>(cpcm);
    pamr = const_cast<char *>(camr);
    
    int resultInt = 0;
    printf("tpath:%s",ctranstemp);
    if(convertPcmToAmr(ppcm, pamr,ctranstemp, true, 0, 6, 5)){
        resultInt = 1;
        printf("pcm2amr success\n");
    }
    else {
        resultInt = 0;
        printf("pcm2amr error\n");
    }
    
    /*
     if(convertPcmToAmr(ppcm, pamr,ctranstemp, false, 0, 0, 0)){
     printf("pcm2amr success\n");
     }
     else {
     printf("pcm2amr error\n");
     }
     */
    return resultInt;
}

+ (int)doConvertAlarmTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath{
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString * transtempPath = [NSString stringWithFormat:@"%@/%@",RUNTIME_HOME_PATH,TRANSTEMP_SAVE_PCM];
    //NSString * transtempPath = [NSString stringWithFormat:@"%@",RUNTIME_HOME_PATH];
    const char * transtemp = [transtempPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * ctranstemp = const_cast<char *>(transtemp);
    
    printf("pcm:%s,amr:%s\n",cpcm,camr);
    char * ppcm;
    char * pamr;
    ppcm = const_cast<char *>(cpcm);
    pamr = const_cast<char *>(camr);
    
    int resultInt = 0;
    printf("tpath:%s",ctranstemp);
    if(convertPcmToAmr(ppcm, pamr,ctranstemp, true, 0, 5, 0)){
        resultInt = 1;
        printf("pcm2amr success\n");
    }
    else {
        resultInt = 0;
        printf("pcm2amr error\n");
    }
    
    /*
     if(convertPcmToAmr(ppcm, pamr,ctranstemp, false, 0, 0, 0)){
     printf("pcm2amr success\n");
     }
     else {
     printf("pcm2amr error\n");
     }
     */
    return resultInt;
}

+ (int)doConvertCqTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath{
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString * transtempPath = [NSString stringWithFormat:@"%@/%@",RUNTIME_HOME_PATH,TRANSTEMP_SAVE_PCM];
    //NSString * transtempPath = [NSString stringWithFormat:@"%@",RUNTIME_HOME_PATH];
    const char * transtemp = [transtempPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * ctranstemp = const_cast<char *>(transtemp);
    
    printf("pcm:%s,amr:%s\n",cpcm,camr);
    char * ppcm;
    char * pamr;
    ppcm = const_cast<char *>(cpcm);
    pamr = const_cast<char *>(camr);
    
    int resultInt = 0;
    printf("tpath:%s",ctranstemp);
    if(convertPcmToAmr(ppcm, pamr,ctranstemp, true, 0, 5, 0)){
        resultInt = 1;
        printf("pcm2amr success\n");
    }
    else {
        resultInt = 0;
        printf("pcm2amr error\n");
    }
    
    /*
     if(convertPcmToAmr(ppcm, pamr,ctranstemp, false, 0, 0, 0)){
     printf("pcm2amr success\n");
     }
     else {
     printf("pcm2amr error\n");
     }
     */
    return resultInt;
}
+ (int)doConvertTTwTransedPCMFromPath:(NSString *)pcmPath toAMRPath:(NSString *)amrPath{
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString * transtempPath = [NSString stringWithFormat:@"%@/%@",RUNTIME_HOME_PATH,TRANSTEMP_SAVE_PCM];
    //NSString * transtempPath = [NSString stringWithFormat:@"%@",RUNTIME_HOME_PATH];
    const char * transtemp = [transtempPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * ctranstemp = const_cast<char *>(transtemp);
    
    printf("pcm:%s,amr:%s\n",cpcm,camr);
    char * ppcm;
    char * pamr;
    ppcm = const_cast<char *>(cpcm);
    pamr = const_cast<char *>(camr);
    
    int resultInt = 0;
    printf("tpath:%s",ctranstemp);
    if(convertPcmToAmr(ppcm, pamr,ctranstemp, true, 0, 6, 0)){
        resultInt = 1;
        printf("pcm2amr success\n");
    }
    else {
        resultInt = 0;
        printf("pcm2amr error\n");
    }
    
    /*
     if(convertPcmToAmr(ppcm, pamr,ctranstemp, false, 0, 0, 0)){
     printf("pcm2amr success\n");
     }
     else {
     printf("pcm2amr error\n");
     }
     */
    return resultInt;
}

+ (int)doConvertAMRFromPath:(NSString *)amrPath toPCMPath:(NSString *)pcmPath{
    int resultInt;
    const char * camr = [amrPath cStringUsingEncoding:NSUTF8StringEncoding];
    const char * cpcm = [pcmPath cStringUsingEncoding:NSUTF8StringEncoding];
    char * pamr;
    char * ppcm;
    pamr = const_cast<char *>(camr);
    ppcm = const_cast<char *>(cpcm);
    if(convertAmrToWav(pamr, ppcm)){
        resultInt = 1;
        printf("amr2pcm success\n");
    }
    else{
        resultInt = 0;
        printf("amr2pcm error\n");
    }
    return resultInt;
}

@end
