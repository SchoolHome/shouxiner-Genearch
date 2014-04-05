//
//  CoupleBreakUpView.m
//  iCouple
//
//  Created by qing zhang on 9/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoupleBreakUpView.h"
#import "HPHeadView.h"
@implementation CoupleBreakUpView

- (id)initWithFrame:(CGRect)frame withBreakUpDate : (NSString *)date withMyCoupleInfo:(CPUIModelUserInfo *)coupleUserInfo
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //背景
        UIImageView *imageviewBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        [imageviewBG setImage:[UIImage imageNamed:@"break-up.jpg"]];
        [self addSubview:imageviewBG];
        
        CPUIModelPersonalInfo *mySelfInfo = [CPUIModelManagement sharedInstance].uiPersonalInfo;
        //头像
        HPHeadView *myHeadImg = [[HPHeadView alloc] initWithFrame:CGRectMake(75.f, 140, 70, 70)];
        myHeadImg.cycleImage = [UIImage imageNamed:@"headpic_index_70x70"];
        myHeadImg.borderWidth = 5.f;
        UIImage *myHead = [UIImage imageWithContentsOfFile:mySelfInfo.selfHeaderImgPath];
        if (!myHead) {
            //加载默认图
        }
        [myHeadImg setBackImage:myHead];
        [self addSubview:myHeadImg];
        
        //昵称
        UILabel *myNickName = [[UILabel alloc] initWithFrame:CGRectMake(28, 156, 45, 14)];
        myNickName.text = mySelfInfo.nickName;
        myNickName.font = [UIFont systemFontOfSize:14.f];
        myNickName.backgroundColor = [UIColor clearColor];
        myNickName.textColor = [UIColor blackColor];
        myNickName.textAlignment = UITextAlignmentRight;
        [self addSubview:myNickName];
        
        //Couple头像


        HPHeadView *coupleHeadImg = [[HPHeadView alloc] initWithFrame:CGRectMake(179.f, 111, 70, 70)];
        coupleHeadImg.cycleImage = [UIImage imageNamed:@"headpic_index_70x70"];
        coupleHeadImg.borderWidth = 5.f;
        UIImage *coupleHead = [UIImage imageWithContentsOfFile:coupleUserInfo.headerPath];
        if (!coupleHead) {
            //加载默认图
        }
        [coupleHeadImg setBackImage:coupleHead];
        [self addSubview:coupleHeadImg];   
        
        //Couple昵称
        UILabel *coupleNickName = [[UILabel alloc] initWithFrame:CGRectMake(250, 141, 45, 14)];
        coupleNickName.text = coupleUserInfo.nickName;
        coupleNickName.font = [UIFont systemFontOfSize:14.f];
        coupleNickName.backgroundColor = [UIColor clearColor];
        coupleNickName.textColor = [UIColor blackColor];
        coupleNickName.textAlignment = UITextAlignmentRight;
        [self addSubview:coupleNickName];
        //日期
        UILabel *breakUpDate = [[UILabel alloc] initWithFrame:CGRectMake(120, 320, 80, 14)];
        breakUpDate.text = coupleUserInfo.nickName;
        breakUpDate.font = [UIFont systemFontOfSize:14.f];
        breakUpDate.backgroundColor = [UIColor clearColor];
        breakUpDate.textAlignment = UITextAlignmentCenter;
        [self addSubview:breakUpDate];        
    }
    return self;
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
