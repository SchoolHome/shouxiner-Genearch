//
//  ExMessageModel.m
//  iCouple
//
//  Created by yong wei on 12-5-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "ExMessageModel.h"


@implementation ExMessageModel

@synthesize  messageModel = _messageModel , cellHeight = _cellHeight , headerDate = _headerDate , isShowHeaderDate = _isShowHeaderDate;
@synthesize expressionsParser = _expressionsParser , departedheight = _departedheight;
@synthesize isPlaySound = _isPlaySound;
@synthesize animationsState = _animationsState;
@synthesize isPlayAnimation = _isPlayAnimation;
@synthesize isShowAlarmTip = _isShowAlarmTip , isGroupMessageTable = _isGroupMessageTable;
@synthesize alarmHeight = _alarmHeight , isResoureBreak = _isResoureBreak;
@synthesize alarmDate = _alarmDate;
-(id) init{
    self = [super init];
    if (self) {
        self.isPlayAnimation = NO;
        self.isShowAlarmTip = NO;
        self.isResoureBreak = NO;
    }
    return self;
}

// 获取model里的图片
-(UIImage *) getUserImage{
    UIImage *userImage = nil;
    if ([self.messageModel.flag intValue] == MSG_FLAG_SEND) {
        // 发送方，直接读取大小
        userImage = [UIImage imageWithContentsOfFile:self.messageModel.filePath];
    }else {
        if ( [self.messageModel.sendState intValue] == MSG_SEND_STATE_DOWNING ) {
            // 接受方，当现在是下载状态时，采用默认图大小
            userImage = [UIImage imageNamed:@"btn_im_picture.png"];
        }else if ([self.messageModel.sendState intValue] == MSG_SEND_STATE_DOWN_SUCESS) {
            // 接收方，当现在是下载完成状态时，采用缩略图大小
            userImage = [UIImage imageWithContentsOfFile:self.messageModel.filePath];
            
            if (nil == userImage) {
                // 接收方，转换图片失败时，采用撕裂图大小
                userImage = [UIImage imageNamed:@"btn_im_losepicture_grey.png"];
                
            }
        }else if ([self.messageModel.sendState intValue] == MSG_SEND_STATE_DOWN_ERROR) {
            // 接收方，当现在时下载出错时，采用默认图片
            userImage = [UIImage imageNamed:@"btn_im_picture.png"];
        }else {
            /************************************临时使用，完善后删除**********************************************/
            // 接收方，当现在是下载完成状态时，采用缩略图大小
            userImage = [UIImage imageWithContentsOfFile:self.messageModel.filePath];
            // 接收方，转换图片失败时，采用默认图片
            if (nil == userImage) {
                userImage = [UIImage imageNamed:@"btn_im_picture.png"];
            }
            /************************************临时使用，完善后删除**********************************************/
        }
    }
    return userImage;
}

-(BOOL) hasUserVideoImage{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([self.messageModel.flag intValue] == MSG_FLAG_SEND) {
        if (![fileManager fileExistsAtPath:self.messageModel.thubFilePath]) {
            return NO;
        }else {
            return YES;
        }
    }else {
        if (![fileManager fileExistsAtPath:self.messageModel.thubFilePath]) {
            return NO;
        }else {
            return YES;
        }
    }
}

-(UIImage *) getUserVideoImage{
    UIImage *userImage = nil;
    
    if ([self hasUserVideoImage]) {
        // 如果存在图片，但是转换失败，使用缩略图
        userImage = [UIImage imageWithContentsOfFile:self.messageModel.thubFilePath];
        if ( nil == userImage) {
            userImage = [UIImage imageNamed:@"btn_im_losepicture_grey.png"];
        }
    }else {
        // 使用默认图
        userImage = [UIImage imageNamed:@"btn_im_picture.png"];
    }
    return userImage;
    
//    if ([self.messageModel.flag intValue] == MSG_FLAG_SEND) {
//        CPLogInfo(@"视频分离的第一桢路径：%@",self.messageModel.thubFilePath);
//        // 发送方，直接读取大小
//        userImage = [UIImage imageWithContentsOfFile:self.messageModel.thubFilePath];
//    }else {
//        // 如果本地不存在，则采用默认图片
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        if (![fileManager fileExistsAtPath:self.messageModel.thubFilePath]) {
//            userImage = [UIImage imageNamed:@"btn_im_picture.png"];
//            return userImage;
//        }
//        
//        // 接收方，当现在是下载完成状态时，采用缩略图大小
//        userImage = [UIImage imageWithContentsOfFile:self.messageModel.thubFilePath];
//        // 接收方，转换图片失败时，采用默认图片
//        if (nil == userImage) {
//            userImage = [UIImage imageNamed:@"btn_im_picture.png"];
//        }
//        
//        if ( [self.messageModel.sendState intValue] == MSG_SEND_STATE_DOWNING ) {
//            // 接受方，当现在是下载状态时，采用默认图大小
//            userImage = [UIImage imageNamed:@"btn_im_picture.png"];
//        }else if ([self.messageModel.sendState intValue] == MSG_SEND_STATE_DOWN_SUCESS) {
//            // 接收方，当现在是下载完成状态时，采用缩略图大小
//            userImage = [UIImage imageWithContentsOfFile:self.messageModel.thubFilePath];
//            // 接收方，转换图片失败时，采用默认图片
//            if (nil == userImage) {
//                userImage = [UIImage imageNamed:@"btn_im_picture.png"];
//            }
//        }else if ([self.messageModel.sendState intValue] == MSG_SEND_STATE_DOWN_ERROR) {
//            // 接收方，当现在时下载出错时，采用撕裂图大小
//            userImage = [UIImage imageNamed:@"btn_im_losepicture_grey.png"];
//        }else {
//            /************************************临时使用，完善后删除**********************************************/
//            // 接收方，当现在是下载完成状态时，采用缩略图大小
//            userImage = [UIImage imageWithContentsOfFile:self.messageModel.thubFilePath];
//            // 接收方，转换图片失败时，采用默认图片
//            if (nil == userImage) {
//                userImage = [UIImage imageNamed:@"btn_im_picture.png"];
//            }
//            /************************************临时使用，完善后删除**********************************************/
//        }
//        
//        
//    }
//    return userImage;
}

@end
