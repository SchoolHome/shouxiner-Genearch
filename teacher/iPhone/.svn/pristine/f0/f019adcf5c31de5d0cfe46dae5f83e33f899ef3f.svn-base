//
//  GroupProfileTableViewCell.m
//  iCouple
//
//  Created by qing zhang on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GroupProfileTableViewCell.h"
#import "ImageUtil.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "HPHeadView.h"
@implementation GroupProfileTableViewCell
@synthesize cellDelegate = _cellDelegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier IndexPath:(NSIndexPath *)indexPath MessageGroupMember : (NSMutableArray *)groupMembers{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.tag = 30001;
        // Initialization code
        [self setContent:indexPath MessageGroupMember:groupMembers];
    }
    return self;
}

//长按操作（删除）
-(void)longPress:(UIGestureRecognizer *)gesture{

    if ([[CPUIModelManagement sharedInstance].userMsgGroup.creatorName isEqualToString:[CPUIModelManagement sharedInstance].uiPersonalInfo.name]) {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if ([HomeInfo shareObject].deleteViewTag != -1) {
            if ([self.cellDelegate respondsToSelector:@selector(recoverDeleteStatus)]) {
                [self.cellDelegate recoverDeleteStatus];
            }
        }
        //-13,-13,27.5,27.5
        UIButton *btnDel = [UIButton buttonWithType:UIButtonTypeCustom];
        btnDel.backgroundColor = [UIColor clearColor];
        CGRect gestureRect = gesture.view.frame;
        [btnDel setFrame:CGRectMake(gestureRect.origin.x-23.f,gestureRect.origin.y-23.f,47.5f, 47.5f)];
        [btnDel setImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
        [btnDel setImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
        [btnDel setImageEdgeInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
        [btnDel addTarget:self action:@selector(removeGroupMember) forControlEvents:UIControlEventTouchUpInside];
        btnDel.tag = btnDelTag;
        [self addSubview:btnDel];        
        [HomeInfo shareObject].deleteViewTag = gesture.view.tag;
        
    }
 }
}

//删除群成员
-(void)removeGroupMember{
    if ([self.cellDelegate respondsToSelector:@selector(deleteGroupMember)]) {
        [[self viewWithTag:btnDelTag] removeFromSuperview];
        [self.cellDelegate deleteGroupMember];
     
    }
}

-(void)setContent:(NSIndexPath *)indexPath MessageGroupMember : (NSMutableArray *)groupMembers;{
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    for (int i = 0 ; i < groupMembers.count; i++) {
        CPUIModelMessageGroupMember *member = [groupMembers objectAtIndex:i];
        CPUIModelUserInfo *userInfo = member.userInfo;
        
        //背景框
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20+(55+20)*i,15, 55.f, 55.f)];
        bgView.backgroundColor = [UIColor clearColor];
        bgView.tag = indexPath.row *10 +i;
        [self addSubview:bgView]; 
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [bgView addGestureRecognizer:longPress];
        
        //头像上内阴影
        UIImageView *imageviewUserImgShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f,55.f,55.f)];
        imageviewUserImgShadow.image = [UIImage imageNamed:@"headpic_shadow_110x110.png"];
        imageviewUserImgShadow.userInteractionEnabled = NO;
        
        //头像
        UIImageView *imageviewHeadImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 55.f, 55.f)];
        imageviewHeadImg.layer.cornerRadius = 5.f;
        [imageviewHeadImg.layer setMasksToBounds:YES];
        [bgView addSubview:imageviewHeadImg];
        [imageviewHeadImg addSubview:imageviewUserImgShadow];
        
        //昵称
        UILabel *labelNickName = [[UILabel alloc] initWithFrame:CGRectMake(2.f, 61.f, 55-4.f, 12.f)];
        labelNickName.font = [UIFont systemFontOfSize:12.f];
        labelNickName.textColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.f];
        labelNickName.textAlignment = UITextAlignmentCenter;
        labelNickName.shadowColor = [UIColor colorWithRed:9/255.f green:9/255.f blue:11/255.f alpha:0.5f];
        labelNickName.backgroundColor = [UIColor clearColor];
        [bgView addSubview:labelNickName];
        
        //删除按钮
        if ([HomeInfo shareObject].deleteViewTag == bgView.tag) {
            UIButton *btnDel = (UIButton *)[self viewWithTag:btnDelTag];
            if (!btnDel) {
                btnDel = [UIButton buttonWithType:UIButtonTypeCustom];
                [btnDel setBackgroundColor:[UIColor clearColor]];
                [btnDel setFrame:CGRectMake(bgView.frame.origin.x-23.f, bgView.frame.origin.y-23.f, 47.5f, 47.5f)];
                [btnDel setImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
                [btnDel setImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
                [btnDel setImageEdgeInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
                [btnDel addTarget:self action:@selector(removeGroupMember) forControlEvents:UIControlEventTouchUpInside];
                btnDel.tag = btnDelTag;
                [self addSubview:btnDel];                                    
            }
        }
        
        //是否是你的couple
        if ([userInfo.name isEqualToString:[CPUIModelManagement sharedInstance].coupleModel.name]) {
            UIImageView *imageviewCoupleForMe = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_couple_red.png"]];
            [imageviewCoupleForMe setFrame:CGRectMake(0, 38.f, 17.f, 17.f)];
            [bgView addSubview:imageviewCoupleForMe];
        }else {
            
            //好友有couple
            if (userInfo.coupleAccount) {
                CPUIModelUserInfo *coupleUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:userInfo.coupleAccount];
                //好友couple是你的好友
                if (coupleUserInfo) {
                    HPHeadView *imageviewCoupleWithFriendForMe = [[HPHeadView alloc] initWithFrame:CGRectMake(0.f, 31.f, 25.f, 25.f)];
                    imageviewCoupleWithFriendForMe.borderWidth = 4.f;
                    [imageviewCoupleWithFriendForMe setCycleImage:[UIImage imageNamed:@"headcouple.png"]];
                    UIImage *coupleHeadImg = [UIImage imageWithContentsOfFile:coupleUserInfo.headerPath];
                    if (coupleHeadImg) {
                        [imageviewCoupleWithFriendForMe setBackImage:coupleHeadImg];
                    }else {
                        [imageviewCoupleWithFriendForMe setBackImage:[UIImage imageWithContentsOfFile:userInfo.selfCoupleHeaderImgPath]];
                    }
                    [bgView addSubview:imageviewCoupleWithFriendForMe];   
                }
                //不是你的好友
                else {
                    UIImageView *imageviewCoupleWithNotFriendForMe = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_coupleNotFriend.png"]];
                    [imageviewCoupleWithNotFriendForMe setFrame:CGRectMake(0, 38.f, 17.f, 17.f)];
                    [bgView addSubview:imageviewCoupleWithNotFriendForMe];
                }
            }
        }
        
        //userInfo存在证明好友存在，为空则证明不是你的好友
        /*********************王硕 2012－7－18***********************/
        NSString *headerPath = @"";
        NSString *nickName = @"";
        if(nil != userInfo){
            nickName = userInfo.nickName;
            headerPath = userInfo.headerPath;
        }else {
            nickName = member.nickName;
            headerPath = member.headerPath;
        }
        
        labelNickName.text = nickName;
        UIImage *image = [UIImage imageWithContentsOfFile:headerPath];
        if (image) {
            [imageviewHeadImg setImage:[image imageByScalingAndCroppingForSizeExe:CGSizeMake(55.f, 55.f)]];
        }else {
            [imageviewHeadImg setImage:[UIImage imageNamed:@"headpic_gray_man_110x110.png"]];
        }
        /*********************王硕 2012－7－18***********************/
    }
}

#pragma mark TouchMethod
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    isMoved = YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];

    
    if (touch.view.tag != 30001 ) {
        if (touch.view.tag !=[HomeInfo shareObject].deleteViewTag) {
            if ([self.cellDelegate respondsToSelector:@selector(turnToProfileView:)]) {
                [self.cellDelegate turnToProfileView:touch.view.tag];
            }
        }else {
            if ([self.cellDelegate respondsToSelector:@selector(deleteGroupMember)]) {
                [[self viewWithTag:btnDelTag] removeFromSuperview];
                [self.cellDelegate deleteGroupMember];
            }  
        }
    }
    
    if ([HomeInfo shareObject].deleteViewTag != -1) {
        if ([self.cellDelegate respondsToSelector:@selector(recoverDeleteStatus)]) {
            [self.cellDelegate recoverDeleteStatus];
        }        
    }
    isMoved = NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

@end
