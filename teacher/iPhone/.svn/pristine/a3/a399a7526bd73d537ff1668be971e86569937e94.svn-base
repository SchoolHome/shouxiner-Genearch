//
//  HomePageAvatarView.m
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageAvatarView.h"
#import "CPUIModelPersonalInfo.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelManagement.h"
#import <QuartzCore/QuartzCore.h>

#define kAvatarHeightMax   70
#define kAvatarHeightMid   55
#define kAvatarHeightSmall 45

@implementation HomePageAvatarView
@synthesize delegate;

-(UIImage *)imageFromPath:(NSString *)path{
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    if (!image) { 
        return [UIImage imageNamed:@"headpic_index_normal_120x120"];
    }
    return image;
}


-(UIImage *)babyImageFromPath:(NSString *)path{
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    if (!image) { 
        return [UIImage imageNamed:@"headpic_gray_baby_120x120"];
    }
    return image;
}

-(void)layoutAvatars{
    
    [avatarSelf removeFromSuperview];
    [avatarCouple removeFromSuperview];
    [avatarBaby removeFromSuperview];

    CPUIModelPersonalInfo *personalInfo = [CPUIModelManagement sharedInstance].uiPersonalInfo;
    CPUIModelUserInfo *coupleInfo = [CPUIModelManagement sharedInstance].coupleModel;
    
    int lifeStatus = [personalInfo.lifeStatus intValue];
    
    /** 三种类型 
    1,单身     PERSONAL_LIFE_STATUS_DEFAULT  PERSONAL_LIFE_STATUS_SINGLE
    2,喜欢     PERSONAL_LIFE_STATUS_CURSE
    3,couple  PERSONAL_LIFE_STATUS_COUPLE   PERSONAL_LIFE_STATUS_COUPLE_MARRIED PERSONAL_LIFE_STATUS_HAS_BABY
     */
     
    switch (lifeStatus) {
        case PERSONAL_LIFE_STATUS_DEFAULT:
        case PERSONAL_LIFE_STATUS_SINGLE:     //1,单身
        {
            if ([personalInfo.hasBaby boolValue]) {  //隐藏宝宝
                avatarSelf.frame = CGRectMake(15, 0, kAvatarHeightMax, kAvatarHeightMax);
                [self addSubview:avatarSelf];
            }else {
                avatarBaby.frame = CGRectMake(15, 10, kAvatarHeightSmall, kAvatarHeightSmall);
                [self addSubview:avatarBaby];
                
                avatarSelf.frame = CGRectMake(15+kAvatarHeightSmall-5, 0, kAvatarHeightMax, kAvatarHeightMax);
                [self addSubview:avatarSelf];
            }
            
            avatarSelf.cycleImage = [UIImage imageNamed:@"headpic_index_120x120"];
            avatarSelf.backImage = [self imageFromPath:personalInfo.selfHeaderImgPath];
            //avatarSelf.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
            avatarBaby.cycleImage = [UIImage imageNamed:@"headpic_index_70x70"];
            [avatarBaby setBackImage:[self babyImageFromPath:personalInfo.selfBabyHeaderImgPath]];
            //avatarBaby.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
        }

            break;
            
        case PERSONAL_LIFE_STATUS_CURSE:     //2,喜欢
        {
            
            avatarSelf.frame = CGRectMake(15, 10, kAvatarHeightMid, kAvatarHeightMid);
            [self addSubview:avatarSelf];
            
            avatarCouple.frame = CGRectMake(15+kAvatarHeightMid-5, 0, kAvatarHeightMax, kAvatarHeightMax);
            [self addSubview:avatarCouple];
            
            if (![personalInfo.hasBaby boolValue]){  //不隐藏宝宝
                avatarBaby.frame = CGRectMake(5, 58, kAvatarHeightSmall, kAvatarHeightSmall);
                [self addSubview:avatarBaby];
            }
            
            
            
            avatarSelf.cycleImage = [UIImage imageNamed:@"headpic_index_90x90"];
            avatarSelf.backImage = [self imageFromPath:personalInfo.selfHeaderImgPath];
            //avatarSelf.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
            avatarCouple.cycleImage = [UIImage imageNamed:@"headpic_index_120x120"];
            avatarCouple.backImage = [self imageFromPath:coupleInfo.selfHeaderImgPath];
            //avatarCouple.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
            avatarBaby.cycleImage = [UIImage imageNamed:@"headpic_index_70x70"];
            [avatarBaby setBackImage:[self babyImageFromPath:personalInfo.selfBabyHeaderImgPath]];
            //avatarBaby.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
            
        }
            
            break;
        case PERSONAL_LIFE_STATUS_COUPLE:
        case PERSONAL_LIFE_STATUS_COUPLE_MARRIED:
        //case PERSONAL_LIFE_STATUS_HAS_BABY:   //3,couple   
        {
            if ([personalInfo.hasBaby boolValue]){  //隐藏宝宝
                avatarSelf.frame = CGRectMake(320/2-kAvatarHeightMax+2.5, 0, kAvatarHeightMax, kAvatarHeightMax);
                avatarCouple.frame = CGRectMake(320/2-2.5, 0, kAvatarHeightMax, kAvatarHeightMax);
                [self addSubview:avatarSelf];
                [self addSubview:avatarCouple];
            }else {
                avatarCouple.frame = CGRectMake((320-kAvatarHeightSmall)/2+kAvatarHeightSmall-5, 0, kAvatarHeightMax, kAvatarHeightMax);
                avatarBaby.frame = CGRectMake((320-kAvatarHeightSmall)/2, 10, kAvatarHeightSmall, kAvatarHeightSmall);
                avatarSelf.frame = CGRectMake((320-kAvatarHeightSmall)/2-kAvatarHeightMax+5, 0, kAvatarHeightMax, kAvatarHeightMax);
                [self addSubview:avatarSelf];
                [self addSubview:avatarCouple];
                [self addSubview:avatarBaby];
            }
            
            NSNumber *selfBabyUpdateTime = [[CPUIModelManagement sharedInstance] getUpdateTimeWithFilePath:personalInfo.selfBabyHeaderImgPath];
            NSNumber *coupleBabyUpdateTime = [[CPUIModelManagement sharedInstance] getUpdateTimeWithFilePath:coupleInfo.selfBabyHeaderImgPath];
            
            if ([selfBabyUpdateTime longLongValue]>[coupleBabyUpdateTime longLongValue]) {
                [avatarBaby setBackImage:[self babyImageFromPath:personalInfo.selfBabyHeaderImgPath]];
            }else {
                [avatarBaby setBackImage:[self babyImageFromPath:coupleInfo.selfBabyHeaderImgPath]];
            }
            
            avatarSelf.cycleImage = [UIImage imageNamed:@"headpic_index_120x120"];
            avatarSelf.backImage = [self imageFromPath:personalInfo.selfHeaderImgPath];
            //avatarSelf.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
            avatarCouple.cycleImage = [UIImage imageNamed:@"headpic_index_120x120"];
            avatarCouple.backImage = [self imageFromPath:coupleInfo.selfHeaderImgPath];
            //avatarCouple.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
            
            avatarBaby.cycleImage = [UIImage imageNamed:@"headpic_index_70x70"];
            //avatarBaby.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
             
        }
            break;
        default:
            break;
    }
    
    avatarSelf.borderWidth = 5;
    avatarCouple.borderWidth = 5;
    avatarBaby.borderWidth = 5;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor greenColor];
        
        avatarSelf = [[HPHeadView alloc] initWithFrame:CGRectZero];
        avatarSelf.exclusiveTouch = YES;
        [avatarSelf addTarget:self action:@selector(avatarAction:) forControlEvents:UIControlEventTouchUpInside];
        avatarCouple = [[HPHeadView alloc] initWithFrame:CGRectZero];
        avatarCouple.exclusiveTouch = YES;
        [avatarCouple addTarget:self action:@selector(avatarAction:) forControlEvents:UIControlEventTouchUpInside];
        avatarBaby = [[HPHeadView alloc] initWithFrame:CGRectZero];
        avatarBaby.exclusiveTouch = YES;
        [avatarBaby addTarget:self action:@selector(avatarAction:) forControlEvents:UIControlEventTouchUpInside];
        
        avatarSelf.tag = AvatarButtonSelf;
        avatarCouple.tag = AvatarButtonCouple;
        avatarBaby.tag = AvatarButtonBaby;
        
        [self layoutAvatars];
    }
    return self;
}

-(void)avatarAction:(AvatarButton *)sender{
    if ([self.delegate respondsToSelector:@selector(avatarTaped:)]) {
        [self.delegate avatarTaped:sender];
    }
}

@end


/////////////////////////////////////////////////////////////////////////

@implementation NicknameLabel

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.textAlignment = UITextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.shadowOffset = CGSizeMake(1.0,1.0);
        self.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.45];
        self.font = [UIFont boldSystemFontOfSize:12];
    }
    return self;
}

@end

/////////////////////////////////////////////////////////////////////////
