//
//  ImageUtil.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

@class CPUIModelMessageGroup;

@interface UIImage (Extras)  
-(UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize; 
//根据人数生成群头像
+(UIImage *)returnGroupImgByPeopleNumber:(CPUIModelMessageGroup *)modelMessageGroup;
+ (UIImage *)changeImage:(UIImage*) img Width:(float)width Height:(float)height;
+(UIImage *) scaleImage: (UIImage *)image scaleFactor:(float)scaleFloat;
- (UIImage*)imageByScalingAndCroppingForSizeExe:(CGSize)targetSize;
+(UIImageView *)returnGroupImgViewByPeopleNumber:(CPUIModelMessageGroup *)modelMessageGroup ;
+(UIImage *)groupHeader:(CPUIModelMessageGroup *) groupModel;
//好友墙的群头像处理
+(UIImage *)groupHeaderForFriendWall:(CPUIModelMessageGroup *) groupModel;
 //裁剪图片
//-(UIImage*)getSubImage:(CGRect)rect;
@end;