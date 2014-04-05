//
//  CalculateCellHeight.h
//  iCouple
//
//  Created by shuo wang on 12-5-4.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateCellHeight : NSObject

//动态高度
+(CGFloat)heightOfSmallExpressionCell:(NSArray *)heightArray;

//动态高度
+(CGFloat)heightOfTextAlarmExpressionCell : (NSArray *)heightArray;

//动态高度
+(CGFloat)heightOfTextAlarmedExpressionCell : (NSArray *)heightArray;

//固定高度
+(CGFloat)heightOfMagicExpressionCell;

//语音未读闹钟消息高度
+(CGFloat)heightOfSoundAlarmCell:(BOOL) isMysticalSoundAlarm;
//语音已读闹钟消息高度
+(CGFloat)heightOfSoundAlarmedCell;
+(CGFloat)heightOfBreakSoundAlarmCell;

+(CGFloat)heightOfMagicExpressionCell:(UIImage *)image text:(NSString *)text;

//固定高度
+(CGFloat)heightOfSoundCell;

//动态高度
+(CGFloat)heightOfImageCell:(UIImage *)image;

//横竖屏幕不一样
+(CGFloat)heightOfVideoCell:(UIImage *)image;
//固定高度
+(CGFloat)heightOfSystemTextCell;
+(CGFloat)heightOfSystemTextCell:(NSString *)text;
//动态高度
+(CGFloat)heightOfSystemTextActionCell;

+(CGFloat)heightOfSystemTextActionCell:(NSString *)text;
@end
