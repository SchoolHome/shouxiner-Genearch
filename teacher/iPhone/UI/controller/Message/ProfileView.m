//
//  ProfileView.m
//  iCouple
//
//  Created by qing zhang on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView
@synthesize viewContentBG = _viewContentBG, buttonView = _buttonView,imageviewBGInMainView = _imageviewBGInMainView , profileViewDelegate = _profileViewDelegate,
    unReadedMsgNumber = _unReadedMsgNumber;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.0];
        self.backgroundColor = [UIColor clearColor];
        
        //CPUIModelMessageGroupMember *member = [messageGroup.memberList objectAtIndex:0];
        //CPUIModelUserInfo *userInfo = member.userInfo;
        
        //背景区域的图
        self.imageviewBGInMainView = [[UIImageView alloc] initWithFrame:CGRect_imageviewBGInMainViewInStatusMid];
        [self addSubview:self.imageviewBGInMainView];    
        
        self.buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRect_imageviewBGInMainViewInStatusMid.size.height-buttonViewHeight, 320.f, buttonViewHeight)];
        self.buttonView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.buttonView];
        UIView *buttonViewBG = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, buttonViewHeight)];
        buttonViewBG.backgroundColor = [UIColor blackColor];
        buttonViewBG.alpha = 0.3f;
        [self.buttonView addSubview:buttonViewBG];
        
        self.viewContentBG = [[UIView alloc] initWithFrame:CGRectMake(0, CGRect_imageviewBGInMainViewInStatusMid.size.height , 320.f, imageviewContentBGHeight)];
        //self.viewContentBG.backgroundColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.0];
        self.viewContentBG.backgroundColor = [UIColor clearColor];
        self.viewContentBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:self.viewContentBG];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andProfileType : (NSInteger)type andModelMessageGroup : (CPUIModelMessageGroup *)messageGroup
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.0];
        self.backgroundColor = [UIColor clearColor];

        //CPUIModelMessageGroupMember *member = [messageGroup.memberList objectAtIndex:0];
        //CPUIModelUserInfo *userInfo = member.userInfo;
        
        //背景区域的图
        self.imageviewBGInMainView = [[UIImageView alloc] initWithFrame:CGRect_imageviewBGInMainViewInStatusMid];
        [self addSubview:self.imageviewBGInMainView];    
        
        self.buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRect_imageviewBGInMainViewInStatusMid.size.height-buttonViewHeight, 320.f, buttonViewHeight)];
        self.buttonView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.buttonView];
        UIView *buttonViewBG = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, buttonViewHeight)];
        buttonViewBG.backgroundColor = [UIColor blackColor];
        buttonViewBG.alpha = 0.3f;
        [self.buttonView addSubview:buttonViewBG];
        
        self.viewContentBG = [[UIView alloc] initWithFrame:CGRectMake(0, CGRect_imageviewBGInMainViewInStatusMid.size.height , 320.f, imageviewContentBGHeight)];
        //self.viewContentBG.backgroundColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.0];
        self.viewContentBG.backgroundColor = [UIColor clearColor];
        self.viewContentBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:self.viewContentBG];
        
//        UIImageView *contentImageViewBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"im_profile_background.png"]];
//        [contentImageViewBG setFrame:CGRectMake(0.f, 0.f, 320.f, 410.f)];
//        contentImageViewBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
//        [self.viewContentBG addSubview:contentImageViewBG];
    }

    return self;
}

-(void)tapByController
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
