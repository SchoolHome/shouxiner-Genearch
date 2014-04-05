//
//  SingleTextAlarmCell.h
//  iCouple
//
//  Created by wang shuo on 12-8-16.
//
//

#import <UIKit/UIKit.h>
#import "SingleSmallExpressionCell.h"

@interface SingleTextAlarmCell : SingleSmallExpressionCell
// 顶端标签
@property(nonatomic,strong) UILabel *dateLabel;

// 闹钟图片
@property(nonatomic,strong) UIImageView *alarmImage;

@property(nonatomic) CGSize size;
@end
