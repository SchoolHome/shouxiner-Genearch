//
//  GroupUserItemView.m
//  iCouple
//
//  Created by shuo wang on 12-7-20.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "GroupUserItemView.h"
#import <QuartzCore/QuartzCore.h>
#import "HPHeadView.h"
#import "CPUIModelManagement.h"
#import "ImageUtil.h"
#import "CPUIModelPersonalInfo.h"
#import "CPUIModelMessageGroup.h"

@interface GroupUserItemView ()
//@property(nonatomic,strong) UIButton *delButton;


-(void) loadView : (CPUIModelMessageGroupMember *)groupMember;
-(void) longPress:(UIGestureRecognizer *)gesture;
-(void) tapGroupUserItem:(UIGestureRecognizer *)gesture;
//删除群成员
-(void)removeGroupMember;
@end

@implementation GroupUserItemView
@synthesize userNickName = _userNickName , key = _key;
@synthesize delButton = _delButton , isDel = _isDel;
@synthesize delegate = _delegate , member = _member;

-(id) initGroupUserItem:(CPUIModelMessageGroupMember *)groupMember{
    self = [super init];
    if (self) {
        self.isDel = NO;
        [self loadView : groupMember];
    }
    return self;
}

// 初始化
-(void) loadView : (CPUIModelMessageGroupMember *)groupMember{
    self.member = groupMember;
    CPUIModelUserInfo *userInfo = groupMember.userInfo;
    
    self.backgroundColor = [UIColor clearColor];
    
    // 添加手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
    
    UITapGestureRecognizer *tapGestureRecognizer;
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGroupUserItem:)];
    [self addGestureRecognizer:tapGestureRecognizer];
    
    
    
    //头像上内阴影
    UIImageView *imageviewUserImgShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f,55.f,55.f)];
    imageviewUserImgShadow.image = [UIImage imageNamed:@"headpic_shadow_110x110.png"];
    imageviewUserImgShadow.userInteractionEnabled = NO;
    
    //头像
    UIImageView *imageviewHeadImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 55.f, 55.f)];
    imageviewHeadImg.layer.cornerRadius = 5.f;
    [imageviewHeadImg.layer setMasksToBounds:YES];
    [self addSubview:imageviewHeadImg];
    [imageviewHeadImg addSubview:imageviewUserImgShadow];
    
    //昵称
    self.userNickName = [[UILabel alloc] initWithFrame:CGRectMake(2.f, 58.f, 55-4.f, 15.f)];
    self.userNickName.font = [UIFont systemFontOfSize:12.f];
    self.userNickName.textColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.f];
    self.userNickName.textAlignment = UITextAlignmentCenter;
    self.userNickName.shadowColor = [UIColor colorWithRed:9/255.f green:9/255.f blue:11/255.f alpha:0.5f];
    self.userNickName.backgroundColor = [UIColor clearColor];
    [self addSubview:self.userNickName];
    
    //是否是你的couple
    if ([userInfo.name isEqualToString:[CPUIModelManagement sharedInstance].coupleModel.name]) {
        UIImageView *imageviewCoupleForMe = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_couple_red.png"]];
        [imageviewCoupleForMe setFrame:CGRectMake(0, 38.f, 17.f, 17.f)];
        [self addSubview:imageviewCoupleForMe];
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
                [self addSubview:imageviewCoupleWithFriendForMe];   
            }
            //不是你的好友
            else {
                UIImageView *imageviewCoupleWithNotFriendForMe = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_coupleNotFriend.png"]];
                [imageviewCoupleWithNotFriendForMe setFrame:CGRectMake(0, 38.f, 17.f, 17.f)];
                [self addSubview:imageviewCoupleWithNotFriendForMe];
            }
        }
    }
    
    NSString *headerPath = @"";
    NSString *nickName = @"";
    if(nil != userInfo){
        nickName = userInfo.nickName;
        headerPath = userInfo.headerPath;
        self.key = userInfo.headerPath;
    }else {
        nickName = groupMember.nickName;
        headerPath = groupMember.headerPath;
        self.key = groupMember.headerPath;
    }
    
    self.userNickName.text = nickName;
    UIImage *image = [UIImage imageWithContentsOfFile:headerPath];
    if (image) {
        [imageviewHeadImg setImage:[image imageByScalingAndCroppingForSizeExe:CGSizeMake(55.f, 55.f)]];
    }else {
        [imageviewHeadImg setImage:[UIImage imageNamed:@"headpic_gray_man_110x110.png"]];
    }
    
    self.delButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.delButton setBackgroundColor:[UIColor clearColor]];
    [self.delButton setFrame:CGRectMake(self.frame.origin.x-23.f, self.frame.origin.y-23.f, 47.5f, 47.5f)];
    [self.delButton setImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
    [self.delButton setImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
    [self.delButton setImageEdgeInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
    [self.delButton addTarget:self action:@selector(removeGroupMember) forControlEvents:UIControlEventTouchUpInside];
    self.delButton.hidden = YES;
    [self addSubview:self.delButton]; 
}

-(void)longPress:(UIGestureRecognizer *)gesture{
    if (gesture.state != UIGestureRecognizerStateBegan) {  
        return;
    }
    
    if ([[CPUIModelManagement sharedInstance].userMsgGroup.creatorName isEqualToString:[CPUIModelManagement sharedInstance].uiPersonalInfo.name]) {
        if ([self.delegate respondsToSelector:@selector(longPressGroupUserItem:)]) {
            [self.delegate longPressGroupUserItem:self];
        }
    }
}

-(void) tapGroupUserItem:(UIGestureRecognizer *)gesture{
    if ([self.delegate respondsToSelector:@selector(clickGroupUserItem:)]) {
        [self.delegate clickGroupUserItem:self];
    }
}

//删除群成员
-(void)removeGroupMember{
    if ([self.delegate respondsToSelector:@selector(clickGroupUserItem:)]) {
        [self.delegate clickGroupUserItem:self];
    }
}

-(void) hiddenDelButton{
    self.isDel = NO;
    self.delButton.hidden = YES;
}

-(void) showDelButton{
    self.isDel = YES;
    self.delButton.hidden = NO;
    [self.delButton bringSubviewToFront:self];
}

@end
