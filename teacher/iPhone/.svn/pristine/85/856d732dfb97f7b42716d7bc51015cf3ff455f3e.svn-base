//
//  GroupProfileTableViewCell.h
//  iCouple
//
//  Created by qing zhang on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelUserInfo.h"
#import "HomeInfo.h"
#import "AGMedallionView.h"
#define btnDelTag 1001
@protocol GroupProfileTableViewCellDelegate <NSObject>

@optional
//恢复删除状态
-(void)recoverDeleteStatus;
//删除群成员
-(void)deleteGroupMember;
//跳转到profile
-(void)turnToProfileView:(NSInteger)memberTag;

@end
@interface GroupProfileTableViewCell : UITableViewCell
{
    BOOL isMoved;
}
@property (nonatomic , assign) id<GroupProfileTableViewCellDelegate> cellDelegate;
//@property (nonatomic , strong) CPUIModelMessageGroup *messageGroup;
- (id)initWithStyle:(UITableViewCellStyle)style 
    reuseIdentifier:(NSString *)reuseIdentifier 
          IndexPath:(NSIndexPath *)indexPath 
MessageGroupMember :(NSMutableArray *)groupMembers;

-(void)setContent:(NSIndexPath *)indexPath MessageGroupMember : (NSMutableArray *)groupMembers;

@end
