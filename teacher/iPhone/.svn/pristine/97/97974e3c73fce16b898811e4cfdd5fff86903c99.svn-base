//
//  HomePageTabBar.m
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageTabBar.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "CPUIModelUserInfo.h"

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

@implementation HPBadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, self.frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        self.image = [[UIImage imageNamed:@"item_index_redcircle"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
        
        [self setBadge:0];
    }
    
    return self;
}


-(void)setBadge:(int) number{
    
    self.hidden = NO;
    if (number ==0) {
        self.hidden = YES;
    }else {
        
        if (number>99) {
            label.text = @"99+";   // 最多显示99条消息
        }else {
            label.text = [NSString stringWithFormat:@"%d",number];
        }
        
        [label sizeToFit];
        [self addSubview:label];
        
        CGFloat widthFix = 0;
        if (label.frame.size.width>10) {
            widthFix = label.frame.size.width-10;
        }else {
            widthFix = 0;
        }
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 27.5+widthFix, self.frame.size.height);
        label.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-2);
    }
}

@end


////////////////////////////////////////////////////////////////////////////////////

@implementation HPCoupleButton

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        coupleBadge = [[HPBadgeView alloc] initWithFrame:CGRectMake(frame.size.width-35, 0, 27.5, 27)];
        [self addSubview:coupleBadge];
        
        
        nickLabel = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width-100)/2, 25, 100, 20)];
        nickLabel.backgroundColor = [UIColor clearColor];
        nickLabel.textColor = [UIColor whiteColor];
        nickLabel.font = [UIFont systemFontOfSize:15];
        nickLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:nickLabel];
        nickLabel.text = @"亲爱的Ta";
        
    }
    return self;
}

-(void)layoutCoupleButton{
    // 根据性别和生活状态，设置中间按钮状态
    int mySex = [[CPUIModelManagement sharedInstance].uiPersonalInfo.sex intValue];
    int lifeStatus = [[CPUIModelManagement sharedInstance].uiPersonalInfo.lifeStatus intValue];
    
    int relation = (mySex==PERSONAL_INFO_SEX_MALE) ? 2:1; 
    
    if (PERSONAL_LIFE_STATUS_COUPLE == lifeStatus||
        PERSONAL_LIFE_STATUS_COUPLE_MARRIED == lifeStatus||
        PERSONAL_LIFE_STATUS_HAS_BABY== lifeStatus||
        PERSONAL_LIFE_STATUS_CURSE == lifeStatus) { 
        
        relation = 3;
    }
    
    //根据关系 layout按钮
    NSString *nickname;
    
    switch (relation) {
        case 2:           //对方是女性
        {
            nickname = @"我的双双";
            
        }
            break;
        case 1:          //对方是男性
        {
            nickname = @"我的双双";
        }
            break;
        case 3:          //couple ，直接显示对方名字
        {
            nickname = [CPUIModelManagement sharedInstance].coupleModel.nickName;
            if (!nickname) {
                nickname = @"亲爱的Ta";
            }
        }
            break;
        default:
            nickname = @"我的双双";
            break;
    }

    nickLabel.text = nickname;
    
}

-(void)updateCoupleBadge:(int) number{
    [coupleBadge setBadge:number];
}

@end



////////////////////////////////////////////////////////////////////////////////////

@implementation HPNCButton

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        coupleBadge = [[HPBadgeView alloc] initWithFrame:CGRectMake(frame.size.width-20, 10, 27.5, 27)];
        [self addSubview:coupleBadge];
    }
    return self;
}

-(void)updateCoupleBadge:(int) number{
    [coupleBadge setBadge:number];
}

@end


