//
//  HomeInfo.m
//  iCouple
//
//  Created by qing zhang on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeInfo.h"
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessage.h"

@implementation HomeInfo
@synthesize currentViewControllerIndex = _currentViewControllerIndex,
                  home_viewcontrollers = _home_viewcontrollers,
                      isDeletingInCell = _isDeletingInCell,
                   deletedCellIndexRow = _deletedCellIndexRow,
                  deletedCellIndexPath = _deletedCellIndexPath,
              isGestureRecognizerBegin = _isGestureRecognizerBegin,
                    friendMessageArray = _friendMessageArray,
          closeFriendMessageDictionary = _closeFriendMessageDictionary,
          homeCloseSectionMutableArray = _homeCloseSectionMutableArray,
               deletedTaginCloseFriend = _deletedTaginCloseFriend,
           isDeletingInCloseFriendCell = _isDeletingInCloseFriendCell,
                imgAnimationFlag       = _imgAnimationFlag,
                deleteViewTag          = _deleteViewTag,
                homeCloseMessageGroups = _homeCloseMessageGroups,
              friendViewNeededBreakIce = _friendViewNeededBreakIce,
         closeFriendViewNeededBreakIce = _closeFriendViewNeededBreakIce,
                  coupleNeededBreakIce = _coupleNeededBreakIce,
                           oldMsgGroup = _oldMsgGroup;
static HomeInfo *sharedInstance = nil;
-(NSMutableArray *)homeCloseSectionMutableArray
{
    if (!_homeCloseSectionMutableArray) {
    _homeCloseSectionMutableArray = [[NSMutableArray alloc]init];
    }
    return _homeCloseSectionMutableArray;
}
-(NSMutableArray *)friendMessageArray
{
    if (!_friendMessageArray) {
        _friendMessageArray = [[NSMutableArray alloc] init];
        
    }
    return _friendMessageArray;
}
-(NSMutableDictionary *)closeFriendMessageDictionary
{
    if (!_closeFriendMessageDictionary) {
        _closeFriendMessageDictionary = [[NSMutableDictionary alloc] init];
    }
    return _closeFriendMessageDictionary;
}
-(NSMutableArray *)homeCloseMessageGroups
{
    if (!_homeCloseMessageGroups) {
        _homeCloseMessageGroups = [[NSMutableArray alloc] init];
    }
    return _homeCloseMessageGroups;
}
+(HomeInfo *)shareObject
{
 
    @synchronized(self) {
		if (sharedInstance == nil) {
			[[self alloc] init]; 
            
            
		}
	}
    return sharedInstance;
}

+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (sharedInstance == nil) {
            sharedInstance   =   [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

- (id) copyWithZone:(NSZone*)zone
{
    return self;
}
-(id)init
{
    self   = [super init];
    if (self) {
        [self setStatusOff];
        [self updateData];
        self.deleteViewTag = -1;
    }
    return  self;
}
-(void)setStatusOff
{
    
   self.deletedCellIndexRow = -1;
   self.isDeletingInCell = NO;
    
}
-(void)setStatusOffInCloseFriend
{
    self.isDeletingInCloseFriendCell = NO;
    self.deletedTaginCloseFriend = -1;
}
-(void)updateData
{
    if(self.homeCloseSectionMutableArray.count > 0)
    {
        [self.homeCloseSectionMutableArray removeAllObjects];
    }
    if (self.friendMessageArray.count > 0) {
        [self.friendMessageArray removeAllObjects];
    }
    if ([self.closeFriendMessageDictionary allKeys].count > 0) {
        [self.closeFriendMessageDictionary removeAllObjects];
    }
    if (self.homeCloseMessageGroups.count >0) {
        [self.homeCloseMessageGroups removeAllObjects];
    }
    self.friendDataNeedRefresh = YES;
    self.closeFriendDataNeedRefresh = YES;
    
    NSArray *messageGroupList = [NSArray arrayWithArray:[[CPUIModelManagement sharedInstance] userMessageGroupList]];

    //self.friendMessageArray =
    NSString *lastMessageStr = @"";
    NSMutableArray *messageArrInSameDate = [[NSMutableArray alloc] init];

    for (int i = 0 ; i < messageGroupList.count; i++) {
        CPUIModelMessageGroup *group = [messageGroupList objectAtIndex:i];
        if (![group isSysMsgGroup]) {
        BOOL friendIceBreak = [[[NSUserDefaults standardUserDefaults] objectForKey:@"friendIceBreak"] boolValue];
        BOOL closeFriendIceBreak = [[[NSUserDefaults standardUserDefaults] objectForKey:@"closeFriendIceBreak"] boolValue];
            if ([group isFriendCommonMsgGroup] && !friendIceBreak) {
                //self.friendViewNeededBreakIce = YES;
                [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"friendIceBreak"];
            }else if([group isFriendClosedMsgGroup] && !closeFriendIceBreak)
            {
                [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"closeFriendIceBreak"];
                if (!friendIceBreak) {
                [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"friendIceBreak"];    
                }
            }
        }
        NSNumber *relationType = group.relationType;  
        NSInteger type = [group.type integerValue];
        if ([relationType integerValue] == MSG_GROUP_UI_RELATION_TYPE_COMMON && (type == MSG_GROUP_UI_TYPE_SINGLE || type == MSG_GROUP_UI_TYPE_MULTI || type == MSG_GROUP_UI_TYPE_CONVER)) {
//            CPUIModelMessageGroupMember *member = [group.memberList objectAtIndex:0];
//            CPUIModelUserInfo *userInfo = member.userInfo;
            [self.friendMessageArray addObject:group];    
        }else if([relationType integerValue] == MSG_GROUP_UI_RELATION_TYPE_CLOSER && (type == MSG_GROUP_UI_TYPE_SINGLE || type == MSG_GROUP_UI_TYPE_MULTI || type == MSG_GROUP_UI_TYPE_CONVER)) {
            [self.homeCloseMessageGroups addObject:group];

            NSDate *messageDate;
            if (group.msgList.count == 0) {
                messageDate =[NSDate dateWithTimeIntervalSince1970:[group.updateDate longLongValue]/1000];
            }else {
                CPUIModelMessage *message = [group.msgList objectAtIndex:group.msgList.count-1];
                if ([message.date longLongValue]/1000 > [group.updateDate longLongValue]/1000) {
                    messageDate = [NSDate dateWithTimeIntervalSince1970:[message.date longLongValue]/1000];
                }else {
                    messageDate = [NSDate dateWithTimeIntervalSince1970:[group.updateDate longLongValue]/1000];
                }
            }
            //NSString *messageStr = [[HomeInfo shareObject] compareDate:messageDate];
            NSString *messageStr = [[[DateUtil alloc] init] compareDateForCloseFriend:messageDate];
            if ([messageStr isEqualToString:lastMessageStr]) {
                [messageArrInSameDate addObject:group];
                if (i == messageGroupList.count - 1) {
                    [self.closeFriendMessageDictionary setValue:[NSMutableArray arrayWithArray:messageArrInSameDate] forKey:messageStr];
                }
            }else {
                
                
                //当时间变化时存入字典中，并移除临时的row数组
                if (messageArrInSameDate.count > 0 ) {
                    [self.closeFriendMessageDictionary setValue:[NSMutableArray arrayWithArray:messageArrInSameDate] forKey:lastMessageStr];
                    [messageArrInSameDate removeAllObjects];
                }
                
                if ([self.closeFriendMessageDictionary objectForKey:messageStr]) {
                    messageArrInSameDate = [self.closeFriendMessageDictionary objectForKey:messageStr];
                }else {
                    [self.homeCloseSectionMutableArray addObject:messageStr];
                }
                
                [messageArrInSameDate addObject:group];
                [self.closeFriendMessageDictionary setValue:messageArrInSameDate forKey:messageStr];
                lastMessageStr = messageStr;
            }
            
        }
    }
}
-(UIImage *)returnGroupImgByPeopleNumber:(CPUIModelMessageGroup *)modelMessageGroup ;
{
    
   // UIView *groupBGView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 55, 55)];
    UIImageView *bgImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headpic_group_110x110.png"]];
    [bgImageview setFrame:CGRectMake(10, 10, 55, 55)];
    for (int i = 0; i < 4; i++) {
        UIImageView *contentImageview;
        if (i >= modelMessageGroup.memberList.count) {
                contentImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headpic_group_40x40.png"]];            
        }else {
            CPUIModelMessageGroupMember *member =  [modelMessageGroup.memberList objectAtIndex:i];   
            CPUIModelUserInfo *userInfo = member.userInfo;
            UIImage *image = [UIImage imageWithContentsOfFile:userInfo.headerPath];
            
            if (!image) {
                contentImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headpic_group_40x40.png"]];                            
                //image = [UIImage imageNamed:@"headpic_40x40.png"];
                
            }else {
                //contentImageview = [[UIImageView alloc] initWithImage:[image transformWidth:20.f height:20.f]];
                contentImageview = [[UIImageView alloc] initWithImage:image];
                //[contentImageview.image transformWidth:20.f height:20.f];
            }            
        }
        if (i < 2) {
            [contentImageview setFrame:CGRectMake(25*i+5, 5.f, 20.f, 20.f)];
        }else {
            [contentImageview setFrame:CGRectMake(25*(i-2)+5, 30.f, 20.f, 20.f)];
        }

        contentImageview.layer.cornerRadius = 3.f;
        contentImageview.layer.masksToBounds = YES;
        [bgImageview addSubview:contentImageview];
    }
    UIGraphicsBeginImageContext(bgImageview.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [bgImageview.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return tImage;
    
}
-(CGSize)returnSizeForLabelText:(UILabel *)label
{
    CGSize size = [label.text sizeWithFont:label.font];
    if (size.width > 150) {
        return CGSizeMake(150, size.height);
    }
    return size;
}
-(CGSize)returnSizeForTextAndFont:(NSString *)text : (UIFont *)font
{
    return [text sizeWithFont:font];
}
@end
@implementation UIImage (Category)

- (UIImage*)transformWidth:(CGFloat)width 
					height:(CGFloat)height {
	
	CGFloat destW = width;
	CGFloat destH = height;
	CGFloat sourceW = width;
	CGFloat sourceH = height;
    
	CGImageRef imageRef = self.CGImage;
	CGContextRef bitmap = CGBitmapContextCreate(NULL, 
												destW, 
												destH,
												CGImageGetBitsPerComponent(imageRef), 
												4*destW, 
												CGImageGetColorSpace(imageRef),
												(kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
	
	CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
	
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;
}
@end