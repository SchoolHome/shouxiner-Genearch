//
//  CoreUtils.m
//  iCouple
//
//  Created by yong wei on 12-3-21.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CoreUtils.h"
#import <AddressBook/AddressBook.h>
#import <AVFoundation/AVFoundation.h>
#import "TPCMToAMR.h"
#import "UIDevice+IdentifierAddition.h"

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#define degreesToRadians(x) (M_PI * x / 180.0)

NSString *documentPath = nil;
@implementation CoreUtils

+(BOOL)stringIsNotNull:(NSString *)str
{
    if (str&&![@"" isEqualToString:str]&&![str isEqual:[NSNull null]])
    {
        return YES;
    }
    return NO;
}
+(NSString *)getGlobalDeviceIdentifier
{
    return [[UIDevice currentDevice] uniqueGlobalDeviceIdentifier];
}
+(NSString *)getDeviceIdentifier
{
    return [[UIDevice currentDevice] uniqueDeviceIdentifier];
}
+(NSString*)getCellularProviderName
{
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    NSString*cellularProviderName = [carrier carrierName];
//    NSString *mcc = [carrier mobileCountryCode];
//    NSString *mnc = [carrier mobileNetworkCode];
//    NSLog(@"cellularProviderName is %@,mcc is %@,mnc is %@",cellularProviderName,mcc,mnc);
    return cellularProviderName;
}
+(NSString*)getMobileCountryCode
{
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    NSString *mcc = [carrier mobileCountryCode];
    return mcc;
}
+(NSString*)getMobileNetworkCode
{
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    NSString *mnc = [carrier mobileNetworkCode];
    return mnc;
}
+(NSString *)getCountryCode 
{
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
} 
+(NSString *)getLanguageCode 
{
    return [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
}
+(BOOL)isJailbroken 
{  
    BOOL jailbroken = NO;  
    NSString *cydiaPath = @"/Applications/Cydia.app";  
    NSString *aptPath = @"/private/var/lib/apt/";  
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) 
    {  
        jailbroken = YES;  
    }  
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) 
    {  
        jailbroken = YES;  
    }  
    return jailbroken;  
}
+(NSString *)getDocumentPath
{
    if (documentPath)
    {
        return documentPath;
    }
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentPath = [paths objectAtIndex:0];
    return documentPath;
}
+(NSData *)getFileDataWithName:(NSString *)fileName
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = [NSString stringWithFormat:@"%@",fileName];    
    return [fm contentsAtPath:path];
}
+(BOOL)fileIsExistWithPah:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm fileExistsAtPath:path];
}
+(BOOL)copyFileWithSrcPath:(NSString *)srcPath andDstPath:(NSString *)dstPath
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL isSucess = [fm copyItemAtPath:srcPath toPath:dstPath error:&error];
    if (error)
    {
        CPLogError(@" %@",[error localizedDescription]);
    }
    return isSucess;
}
+(BOOL)moveFileWithSrcPath:(NSString *)srcPath andDstPath:(NSString *)dstPath
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL isSucess = [fm moveItemAtPath:srcPath toPath:dstPath error:&error];
    if (error)
    {
        CPLogError(@" %@",[error localizedDescription]);
    }
    return isSucess;
}
+(NSNumber *)getFileSizeWithName:(NSString *)fileName
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fm attributesOfItemAtPath:fileName error:nil];
    CPLogInfo(@"uuuuuuuuuuuuuuuu:%@    %@    %@",fileAttributes,fileName,[fileAttributes objectForKey:NSFileSize]);
    NSNumber * fileSizeBit = (NSNumber *)[fileAttributes objectForKey:NSFileSize];
    return [NSNumber numberWithInt:[fileSizeBit longLongValue]/1024];
}
+(NSData *)getFileDataWithPathName:(NSString *)filePathName
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *readableDBPath = [documentsDirectory stringByAppendingPathComponent:@"res/msg/"];
    NSString *path = [NSString stringWithFormat:@"%@/%@",documentsDirectory,filePathName];
    return [fm contentsAtPath:path];
}

+(NSString *)convertMobileLabelToAbLabel:(NSString *)addBookLabel
{
	NSDictionary *abLabel = [NSDictionary dictionaryWithObjectsAndKeys:@"办公电话",kABWorkLabel,
                             @"家庭电话",kABHomeLabel,
                             @"其它电话",kABOtherLabel,
                             @"手机",kABPersonPhoneMobileLabel,
                             @"手机",kABPersonPhoneIPhoneLabel,
                             @"固定电话",kABPersonPhoneMainLabel,
                             @"其它电话",kABPersonPhonePagerLabel,
                             @"传真",kABPersonPhoneHomeFAXLabel,
                             @"传真",kABPersonPhoneWorkFAXLabel,
                             nil];
    NSString * retLabel = [abLabel objectForKey:addBookLabel];
    if (!retLabel)
    {
        return @"其它电话";
    }
	return retLabel;
}

+ (NSString*) filterMobileNumber:(NSString*)phoneNumber
{
    if (!phoneNumber)
    {
        return @"";
    }
    NSString* number = [NSString stringWithString:phoneNumber];
    NSString* number1 = [[[[[number stringByReplacingOccurrencesOfString:@" " withString:@""]
                           stringByReplacingOccurrencesOfString:@"-" withString:@""]
                          stringByReplacingOccurrencesOfString:@"(" withString:@""] 
                         stringByReplacingOccurrencesOfString:@")" withString:@""] 
                        stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    return number1;    
}
+(NSNumber *)getLongFormatWithDate:(NSDate *)date
{
    return [NSNumber numberWithLongLong:[date timeIntervalSince1970]*1000];
}

+(NSNumber *)getLongFormatWithNowDate
{
    NSDate *nowDate = [NSDate date];
    return [NSNumber numberWithLongLong:[nowDate timeIntervalSince1970]*1000];
}
+(NSDate *)getDateFormatWithLong:(NSNumber *)dateLong
{
    return [NSDate dateWithTimeIntervalSince1970:[dateLong longLongValue]/1000];
}
+(NSString *)getDateDescriptiontWithLong:(NSNumber *)dateLong
{
    return [[NSDate dateWithTimeIntervalSince1970:[dateLong longLongValue]/1000] description];
}
+(NSNumber *)getDateWithDesc:(NSString *)dateDesc
{
    return [CoreUtils getLongFormatWithDate:[NSDate dateFromRFC1123:dateDesc]];
}
+(NSNumber *)getLongFormatWithDateString:(NSString *)dateString
{
    if (![dateString isKindOfClass:[NSString class]]) 
    {
        return nil;
    }
//    NSLog(@"getLongFormatWithDateString is %@",dateString);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    NSDate *date = [dateFormatter dateFromString:dateString];
//    NSDate *date = [dateFormatter dateFromString:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
//    NSLog(@"getLongFormatWithDateString is %@",date);
    return [NSNumber numberWithLongLong:[date timeIntervalSince1970]*1000];
}
+(NSString *)getStringFormatWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    NSString *dateString = [dateFormatter stringFromDate:date];
//    NSLog(@"getStringFormatWithDate   %@",dateString);
    return dateString;
}
+(NSString *)getStringFormatWithNumber:(NSNumber *)dateNumber
{
    return [self getStringFormatWithDate:[self getDateFormatWithLong:dateNumber]];
}
+(NSString *)getStringNormalFormatWithNumber:(NSNumber *)dateNumber
{
    NSDate *date = [self getDateFormatWithLong:dateNumber];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (dateNumber > [self getLongFormatWithNowDate]) {
        [dateFormatter setDateFormat:@"MM-dd"];
    }else
    {
        [dateFormatter setDateFormat:@"HH:mm"];
    }
    
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    NSString *dateString = [dateFormatter stringFromDate:date];
    //    NSLog(@"getStringFormatWithDate   %@",dateString);
    return dateString;
}
+ (NSDate *)convertDateToLocalTime:(NSDate *)forDate {
    
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    
    int timeOffset = [nowTimeZone secondsFromGMTForDate:forDate];
    NSDate *newDate = [forDate dateByAddingTimeInterval:timeOffset];    
    return newDate;
    
}

+(BOOL)writeToFileWithData:(NSData *)data file_name:(NSString *)fileName andPath:(NSString *)path
{
    BOOL isSucess = NO;
    if (data)
    {
        NSError *error;
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/",path];
        NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:filePath];
        
        BOOL success = [fm createDirectoryAtPath:writableDBPath withIntermediateDirectories:YES attributes:nil error:&error];
//        CPLogInfo(@"db's path is  %@",writableDBPath);
        if(!success)
        {
            CPLogError(@"error: %@", [error localizedDescription]);
        }
        NSString *path = [NSString stringWithFormat:@"%@/%@",writableDBPath,fileName];
        isSucess = [data writeToFile:path atomically:YES];
    }
    return isSucess;
}
+(BOOL)createPath:(NSString *)path
{
    BOOL isSucess = NO;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@",path];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:filePath];
    
    BOOL success = [fm createDirectoryAtPath:writableDBPath withIntermediateDirectories:YES attributes:nil error:&error];
    if(!success)
    {
        CPLogError(@"error: %@", [error localizedDescription]);
    }
    return isSucess;
}
+(NSString *)getUUID
{
	CFUUIDRef     myUUID;
	CFStringRef   myUUIDString;
	
	myUUID = CFUUIDCreate(kCFAllocatorDefault);
	myUUIDString = CFUUIDCreateString(kCFAllocatorDefault, myUUID);
    CFRelease(myUUID);
	//return (__bridge NSString *)myUUIDString;
    return CFBridgingRelease(myUUIDString);
}

+(NSString *)filterResponseDescWithCode:(NSNumber *)resultCode
{
    NSString *responseDesc = nil;
    NSString *resDes = [NSString stringWithFormat:@"ResponseCode_%@",resultCode];
    responseDesc = NSLocalizedString(resDes,nil);
    if (!responseDesc||[@"" isEqualToString:responseDesc]||[responseDesc hasPrefix:@"ResponseCode"])
    {
        responseDesc = NSLocalizedString(@"ResponseCodeDefault",nil);
    }
    return responseDesc;
}
+(NSNumber *)getMediaTimeWithUrl:(NSURL *)url
{
    AVURLAsset* videoAsset = [[AVURLAsset alloc]initWithURL:url options:nil];  
//    NSLog(@"ooooooooooooooooooooooo:%@",[NSNumber numberWithInt:videoAsset.duration.value]);
//    NSLog(@"ooooooooooooooooooooooo:%@",[NSNumber numberWithInt:videoAsset.duration.timescale]);
    
    NSInteger videoValue = videoAsset.duration.value;
    NSInteger videoTimeScale = videoAsset.duration.timescale;
    NSInteger videoTime = videoValue/videoTimeScale;
    if (videoValue%videoTimeScale>0)
    {
        videoTime ++;
    }
    if(videoTime==0&&videoTimeScale>0)
    {
        videoTime = 1;
    }
    CPLogInfo(@"getMediaTimeWithUrl     %@",[NSNumber numberWithInt:videoTime]);
    return [NSNumber numberWithInt:videoTime];
}
+(NSDictionary *)convertMpeg4WithUrl:(NSURL *)url andDstFilePath:(NSString *)dstFilePath
{
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc] init];
    BOOL isSucess = YES;
    AVMutableComposition* mixComposition = [AVMutableComposition composition];  

    AVURLAsset* videoAsset = [[AVURLAsset alloc]initWithURL:url options:nil];
    
    NSInteger videoValue = videoAsset.duration.value;
    NSInteger videoTimeScale = videoAsset.duration.timescale;
    NSInteger videoTime = videoValue/videoTimeScale;
    if (videoValue%videoTimeScale>0)
    {
        videoTime ++;
    }
    NSNumber *mediaTime = [NSNumber numberWithInt:videoTime];
    
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:videoAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(360,480);
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(1, 60) actualTime:NULL error:&error];
    
    UIImage *uiImg = [UIImage imageWithCGImage:img];
    NSData *imgData = UIImageJPEGRepresentation(uiImg, 0.5f);
        
    
    AVMutableCompositionTrack *compositionVideoTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeVideo   
                                                                                   preferredTrackID:kCMPersistentTrackID_Invalid];  
    [compositionVideoTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, videoAsset.duration)   
                                   ofTrack:[[videoAsset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0]   
                                    atTime:kCMTimeZero error:nil];
    
    AVAssetTrack *sourceVideo = [[videoAsset tracksWithMediaType:AVMediaTypeVideo]lastObject];
    [compositionVideoTrack setPreferredTransform:sourceVideo.preferredTransform];
    AVAssetExportSession* _assetExport = [[AVAssetExportSession alloc] initWithAsset:videoAsset
                                                                          presetName:AVAssetExportPresetPassthrough]; 
    
    NSURL *exportUrl = [NSURL fileURLWithPath:dstFilePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:dstFilePath]){
        [[NSFileManager defaultManager] removeItemAtPath:dstFilePath error:nil];  
    }  
    
    _assetExport.outputFileType = AVFileTypeMPEG4; 
    //    _assetExport.outputFileType = @"com.apple.quicktime-movie"; //AVFileTypeMPEG4 
    
    CPLogInfo(@"file type %@",_assetExport.outputFileType);  
    _assetExport.outputURL = exportUrl;  
    _assetExport.shouldOptimizeForNetworkUse = YES;  
    __block NSNumber *fileSize = nil;
    [_assetExport exportAsynchronouslyWithCompletionHandler:  
     ^(void ) {        
         if (_assetExport.status == AVAssetExportSessionStatusCompleted) 
         {
             CPLogInfo(@"convert mpeg-4 completed");
             fileSize = [self getFileSizeWithName:dstFilePath];
         } else 
         {
             CPLogInfo(@"convert mpeg-4  error %@ ||  %@ ||%@ ||%@||%d",
                   _assetExport.debugDescription,_assetExport.description,[_assetExport.error localizedDescription],
                   [_assetExport.error localizedFailureReason],[_assetExport.error code]);
         }
     }         
     ];
    if (error)
    {
        CPLogError(@"convert mpeg-4 error is  %@",[error localizedDescription]);
    }
        
    NSString *thubFilePath = [NSString stringWithFormat:@"%@.jpg",[dstFilePath substringToIndex:[dstFilePath rangeOfString:@"."].location]];
    [imgData writeToFile:thubFilePath atomically:YES];
//    [NSThread sleepForTimeInterval:3*1000];
    [resDic setObject:[NSNumber numberWithBool:isSucess] forKey:convertMpeg4IsSucess];
    if (fileSize) 
    {
        [resDic setObject:fileSize forKey:convertMpeg4FileSize];
    }
    [resDic setObject:mediaTime forKey:convertMpeg4MediaTime];
    return resDic;
}
-(void)convertMpeg4ThumbImgWithUrl:(NSURL *)url
{
    AVURLAsset* videoAsset = [[AVURLAsset alloc]initWithURL:url options:nil];  
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:videoAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(320,480);
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(10, 10) actualTime:NULL error:&error];
    
    UIImage *uiImg = [UIImage imageWithCGImage:img];
    NSData *imgData = UIImageJPEGRepresentation(uiImg, 0.5f);
    
    
    if (error != nil)
    {
        //
    }
}
+(BOOL)convertPCM:(NSString *)pcmPath toAMR:(NSString *)amrPath transType:(NSInteger )transformType
{
    BOOL isSucess = NO;
    switch (transformType)
    {
        case CONVERT_PCM_TYPE_CS:
            isSucess = [TPCMToAMR doConvertCsTransedPCMFromPath:pcmPath toAMRPath:amrPath];
            break;
        case CONVERT_PCM_TYPE_CQ:
            isSucess = [TPCMToAMR doConvertCqTransedPCMFromPath:pcmPath toAMRPath:amrPath];
            break;
        case CONVERT_PCM_TYPE_TTW:
            isSucess = [TPCMToAMR doConvertTTwTransedPCMFromPath:pcmPath toAMRPath:amrPath];
            break;
        case CONVERT_PCM_TYPE_DEFAULT:
            isSucess = [TPCMToAMR doConvertTransedPCMFromPath:pcmPath toAMRPath:amrPath];
            break;
        case CONVERT_PCM_TYPE_ALARM:
            isSucess = [TPCMToAMR doConvertAlarmTransedPCMFromPath:pcmPath toAMRPath:amrPath];
            break;
        default:
            isSucess = [TPCMToAMR doConvertOriginalPCMFromPath:pcmPath toAMRPath:amrPath];
            break;
    }
    return isSucess;
}
@end
