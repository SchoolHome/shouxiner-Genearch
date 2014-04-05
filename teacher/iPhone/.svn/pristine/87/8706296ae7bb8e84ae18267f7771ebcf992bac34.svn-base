//
//  HomeInfo.h
//  iCouple
//
//  Created by qing zhang on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "CPUIModelMessageGroup.h"
#import "DateUtil.h"
typedef enum 
{
    home_viewcontrollers_friends = 1,
    home_viewcontrollers_couple  = 3,
    home_viewcontrollers_closefriend = 2
}HomeViewControllers;

typedef enum 
{
    COUPLEICEBREAK_STATUS_InIceBreak = 1,
    COUPLEICEBREAK_STATUS_InNormal = 2
}COUPLEICEBREAK_STATUS;
@interface HomeInfo : NSObject
{

}
@property (nonatomic)CPUIModelMessageGroup *oldMsgGroup;
//groupProfile删除标记
@property (nonatomic)NSInteger deleteViewTag;
//是否正在删除
@property (nonatomic) BOOL isDeletingInCell;
//当前删除状态下cell的index
@property (nonatomic)NSInteger deletedCellIndexRow;
//当前删除状态下cell的index
@property (nonatomic , strong)NSIndexPath *deletedCellIndexPath;
//密友删除的标示
@property (nonatomic)NSInteger deletedTaginCloseFriend;
//密友界面是否正在删除
@property (nonatomic)BOOL isDeletingInCloseFriendCell;
//当前显示的controller
@property (nonatomic)NSInteger currentViewControllerIndex;
@property (nonatomic) BOOL isGestureRecognizerBegin;
@property (nonatomic , assign) HomeViewControllers home_viewcontrollers;

//朋友的信息array
@property (nonatomic , strong) NSMutableArray *friendMessageArray;

//密友的section数组
@property (nonatomic , strong) NSMutableArray *homeCloseSectionMutableArray;
@property (nonatomic , strong) NSMutableArray *homeCloseMessageGroups;
//密友的信息字典
@property (nonatomic , strong) NSMutableDictionary *closeFriendMessageDictionary;
@property (nonatomic) BOOL imgAnimationFlag;
//好友数据是否需要刷新
@property (nonatomic) BOOL friendDataNeedRefresh;
//密友数据是否需要刷新
@property (nonatomic) BOOL closeFriendDataNeedRefresh;
//好友墙是否是破冰状态
@property (nonatomic) BOOL friendViewNeededBreakIce;
//密友墙是否是破冰状态
@property (nonatomic) BOOL closeFriendViewNeededBreakIce;
//couple是否是破冰状态,YES 表示目前不在破冰状态，NO表示当前就在破冰状态
@property (nonatomic) int coupleNeededBreakIce;
+(HomeInfo *)shareObject;
//取消删除状态后重置相关属性
-(void)setStatusOff;
//取消密友删除状态下重置相关属性
-(void)setStatusOffInCloseFriend;
//根据人数生成群头像
-(UIImage *)returnGroupImgByPeopleNumber:(CPUIModelMessageGroup *)modelMessageGroup;
//更新数据
-(void)updateData;
-(CGSize)returnSizeForLabelText:(UILabel *)label;
@end
@interface UIImage (Category)
//根据高和宽生成制定的image
- (UIImage*)transformWidth:(CGFloat)width 
					height:(CGFloat)height;
@end