//
//  MediaUtils.m
//  iCouple
//
//  Created by yong wei on 12-5-12.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MediaUtils.h"
#import <AVFoundation/AVFoundation.h>

@implementation MediaUtils

-(void)convertMpeg4WithUrl:(NSURL *)url
{
    //    AVURLAsset* audioAsset = [[AVURLAsset alloc]initWithURL:audioUrl options:nil];  
    AVURLAsset* videoAsset = [[AVURLAsset alloc]initWithURL:url options:nil];  
    
    
    AVMutableComposition* mixComposition = [AVMutableComposition composition];  
    
    AVMutableCompositionTrack *compositionCommentaryTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio   
                                                                                        preferredTrackID:kCMPersistentTrackID_Invalid];  
    //    [compositionCommentaryTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset.duration)   
    //                                        ofTrack:[[audioAsset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0]   
    //                                         atTime:kCMTimeZero error:nil];  
    
    AVMutableCompositionTrack *compositionVideoTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeVideo   
                                                                                   preferredTrackID:kCMPersistentTrackID_Invalid];  
    [compositionVideoTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, videoAsset.duration)   
                                   ofTrack:[[videoAsset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0]   
                                    atTime:kCMTimeZero error:nil];  
    
    AVAssetExportSession* _assetExport = [[AVAssetExportSession alloc] initWithAsset:mixComposition   
                                                                          presetName:AVAssetExportPresetPassthrough];     
    
    NSString* videoName = @"export.mp4";  
    
    NSString *exportPath = [NSTemporaryDirectory() stringByAppendingPathComponent:videoName];  
    NSURL    *exportUrl = [NSURL fileURLWithPath:exportPath];  
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:exportPath])   
    {  
        [[NSFileManager defaultManager] removeItemAtPath:exportPath error:nil];  
    }  
    
    _assetExport.outputFileType = AVFileTypeMPEG4; 
    //    _assetExport.outputFileType = @"com.apple.quicktime-movie"; //AVFileTypeMPEG4 
    
//    NSLog(@"file type %@",_assetExport.outputFileType);  
    _assetExport.outputURL = exportUrl;  
    _assetExport.shouldOptimizeForNetworkUse = YES;  
    
    [_assetExport exportAsynchronouslyWithCompletionHandler:  
     ^(void ) {        
         // your completion code here  
     }         
     ];
}
-(void)convertMpeg4ThumbImgWithUrl:(NSURL *)url
{
    AVURLAsset* videoAsset = [[AVURLAsset alloc]initWithURL:url options:nil];  
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:videoAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(320,480);
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(10, 10) actualTime:NULL error:&error];
    if (error != nil)
    {
        //
    }
}

@end
