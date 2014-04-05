//
//  RoundRectEGOImageButton.h
//  iStation
//
//  Created by 郑 帅 on 13-5-23.
//  Copyright (c) 2013年 北京友宝昂莱科技有限公司. All rights reserved.
//

#import "EGOImageButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Resize.h"

@protocol AddFace<NSObject>
@optional
- (void)showFace;
@end

@interface RoundRectEGOImageButton : EGOImageButton
{
	id<AddFace> addFaceDelegate;
}
@property(nonatomic,assign)id<AddFace> addFaceDelegate;
@property int targetID;
- (id)initWithPlaceholderImage:(UIImage*)anImage withFrame:(CGRect) frame ;
-(void)RemoveDefaultAction;
@end
