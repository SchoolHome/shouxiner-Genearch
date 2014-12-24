//
//  SingleProfileView.m
//  iCouple
//
//  Created by qing zhang on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SingleProfileView.h"
#import "AGMedallionView.h"
#import "TPCMToAMR.h"
#import "CoreUtils.h"
#import "ColorUtil.h"
#import "HPHeadView.h"

#define LifeStatusTag 1050
#define btnTapCoupleTag 1051
#define labelCoupleNickNameTag 1052
#define agBabyTag 1053


#define labelFriendNickNameTag 1055
#define labelRecentTag 1056
#define audioRecentViewTag 1057
#define LabelAudioLengthTag 1058
#define labelContactNameTag 1059
#define labelContactCoupleNameTag 1060
#define imageviewLifeStatusTag 1062
#define labelBabyTag 1063
#define labelRelationTextTag 1064

@implementation SingleProfileView
@synthesize profiletype = _profiletype , modelMessageGroup = _modelMessageGroup , singleProfileDelegate = _singleProfileDelegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andProfileType : (NSInteger)type andModelMessageGroup : (CPUIModelMessageGroup *)messageGroup
{
    //self = [super initWithFrame:frame andProfileType:type andModelMessageGroup:messageGroup];
    self = [super initWithFrame:frame];
    if (self) {
        self.profiletype = type;
        self.modelMessageGroup = messageGroup;
        
        UIButton *btnPlus = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnPlus setFrame:CGRect_btnPlus];
        [btnPlus setBackgroundImage:[UIImage imageNamed:@"bt_im_+.png"] forState:UIControlStateNormal];
        [btnPlus setBackgroundImage:[UIImage imageNamed:@"bt_im_+press.png"] forState:UIControlStateHighlighted];
        [btnPlus addTarget:self action:@selector(plusFriend) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonView addSubview:btnPlus];
        
        UIButton *btnRelation = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnRelation setFrame:CGRect_changeRelationAndSave];
        [btnRelation setBackgroundImage:[UIImage imageNamed:@"login_btn_login.png"] forState:UIControlStateNormal];
        [btnRelation setBackgroundImage:[UIImage imageNamed:@"login_btn_login_hover.png"] forState:UIControlStateHighlighted];
        [btnRelation setTitle:@"关于我" forState:UIControlStateNormal];
        //[btnRelation setTitle:@"了解更多" forState:UIControlStateHighlighted];
        btnRelation.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [btnRelation addTarget:self action:@selector(changeRelation) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonView addSubview:btnRelation];
        
        //下部分背景图
        UIImageView *imageviewContentBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"im_profile_background.jpg"]];
        [imageviewContentBG setFrame:CGRectMake(0, 0, 320.f, 410.f)];
        [self.viewContentBG addSubview:imageviewContentBG];
        
        
//        UIImageView *imageviewProfileRecent = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"im_profile_recentwords.png"]];
//        [imageviewProfileRecent setFrame:CGRect_recent];
//        [self.viewContentBG addSubview:imageviewProfileRecent];
        


    }
    return self;
}
//调整关系
-(void)changeRelation
{
//    if ([self.singleProfileDelegate respondsToSelector:@selector(changeContactRelation:)]) {
//        if (self.modelMessageGroup.memberList.count > 0) {
//            [self resetAudioLength];
//            CPUIModelMessageGroupMember *member = [self.modelMessageGroup.memberList objectAtIndex:0];
//            [self.singleProfileDelegate changeContactRelation:member.userInfo];            
//        }
//
//    }
    if ([self.singleProfileDelegate respondsToSelector:@selector(turnToFriendProfile:)]) {
        if (self.modelMessageGroup.memberList.count > 0) {
            [self resetAudioLength];
            CPUIModelMessageGroupMember *member = [self.modelMessageGroup.memberList objectAtIndex:0];
            [self.singleProfileDelegate turnToFriendProfile:member.userInfo];
        }
    }
}
//添加朋友
-(void)plusFriend
{

    
    if ([self.profileViewDelegate respondsToSelector:@selector(addFriendInFriendViewController)]) {
        [self resetAudioLength];
        [self.profileViewDelegate addFriendInFriendViewController];
    }
}
//点击空白区域
-(void)tapByController
{
    
}
//点击couple头像
-(void)tapCoupleHead
{

    if (self.modelMessageGroup.memberList.count >0) {
        CPUIModelMessageGroupMember *member =  [self.modelMessageGroup.memberList objectAtIndex:0];   
        CPUIModelUserInfo *userInfo = member.userInfo;
  
        if ([self.singleProfileDelegate respondsToSelector:@selector(turnToFriendCoupleProfile:)]) {
            [self.singleProfileDelegate turnToFriendCoupleProfile:userInfo];
        }
    }
}
-(void)stopAudioPlayer
{
    [[MusicPlayerManager sharedInstance] stop];
    UIButton *btnAudio = (UIButton *)[self viewWithTag:btnAudioPlayTag];
    if (btnAudio) {
        [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
        [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];        
    }

}
-(NSString *)getRelationText:(NSUInteger)relationType
{
    switch (relationType) {
        case USER_RELATION_TYPE_COMMON:
        {
            return @"你们现在是好友";
        }
            break;
        case USER_RELATION_TYPE_CLOSED:
        {
            return @"你们现在是蜜友";
        }
            break;
         
        case USER_RELATION_TYPE_LOVER:
        {
            return @"Ta是你喜欢的人";
        }
            break;
         
        case USER_RELATION_TYPE_COUPLE:
        {
            return @"你们在恋爱ing";
        }
            break;
        case USER_RELATION_TYPE_MARRIED:
        {
            return @"你们是小夫妻";
        }
            break;
            
        default:
        {
            return @"你们现在是好友";
        }
            break;
    }
}
-(void)refreshSingleProfile :(CPUIModelMessageGroup *)messageGroup
{
    self.modelMessageGroup  = messageGroup;
    if (self.modelMessageGroup.memberList.count >0) {
        CPUIModelMessageGroupMember *member =  [self.modelMessageGroup.memberList objectAtIndex:0];   
//        CPUIModelUserInfo *userInfo = member.userInfo; 
        CPUIModelUserInfo *userInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:member.userName];
        UIImage *imageSelfBG = [UIImage imageWithContentsOfFile:userInfo.selfBgImgPath];
        if (imageSelfBG) {
            [self.imageviewBGInMainView setImage:imageSelfBG];
        }else {
            [self.imageviewBGInMainView setImage:[UIImage imageNamed:@"bg_default.jpg"]];
        }
        
        //当前关系文案
        UILabel *labelRelationText = (UILabel *)[self viewWithTag:labelRelationTextTag];
        if (!labelRelationText) {
            labelRelationText = [[UILabel alloc] initWithFrame:CGRectMake(44.f, 11.f, 70, 10.f)];
            labelRelationText.font = [UIFont systemFontOfSize:9.f];
            labelRelationText.backgroundColor = [UIColor clearColor];
            labelRelationText.tag = labelRelationTextTag;
            labelRelationText.textColor = [UIColor colorWithHexString:@"#cccccc"];
            labelRelationText.text = [self getRelationText:[userInfo.type integerValue]];
            [self.viewContentBG addSubview:labelRelationText];
        }else {
            
            labelRelationText.text = [self getRelationText:[userInfo.type integerValue]];
        }
        
        
        //判断有没有couple，baby
        if ( userInfo.coupleAccount) {
            UIImage *imageCouple;

            UILabel *labelCoupleNickName = (UILabel *)[self viewWithTag:labelCoupleNickNameTag];
            if (!labelCoupleNickName) {
                labelCoupleNickName = [[UILabel alloc] initWithFrame:CGRectMake(190.f, 96, 67.f , 13.f)];
                labelCoupleNickName.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];                
                labelCoupleNickName.textAlignment = UITextAlignmentCenter;
                labelCoupleNickName.font = [UIFont systemFontOfSize:12.f];
                labelCoupleNickName.backgroundColor = [UIColor clearColor];
                labelCoupleNickName.shadowColor = [UIColor colorWithRed:29/255.f green:29/255.f blue:29/255.f alpha:0.5];
                labelCoupleNickName.shadowOffset = CGSizeMake(0.f, 1.0f);
                labelCoupleNickName.tag = labelCoupleNickNameTag;
                [self.viewContentBG addSubview:labelCoupleNickName];
            }
     
            //判断couple是否是你的好友
            if (userInfo.coupleUserInfo) {
                if ( [userInfo.coupleUserInfo.nickName isEqualToString:@""]) {
                    labelCoupleNickName.text = @"没有名字";    
                }else {
                    labelCoupleNickName.text = userInfo.coupleUserInfo.nickName;    
                }
                
                imageCouple =  [UIImage imageWithContentsOfFile:userInfo.coupleUserInfo.headerPath];
            }else {
                if ( [userInfo.coupleNickName isEqualToString:@""]) {
                    labelCoupleNickName.text = @"没有名字";    
                }else {
                    labelCoupleNickName.text = userInfo.coupleNickName;
                }  
                imageCouple = [UIImage imageWithContentsOfFile:userInfo.selfCoupleHeaderImgPath];
            }
            //couple通讯录姓名
            NSString *coupleContactName = [[CPUIModelManagement sharedInstance] getContactFullNameWithMobile:userInfo.coupleUserInfo.mobileNumber]; 
            if (![coupleContactName isEqualToString:@""] && coupleContactName) {
                UILabel *labelContactCoupleName = (UILabel *)[self viewWithTag:labelContactCoupleNameTag];
                if (!labelContactCoupleName) {
                    labelContactCoupleName = [[UILabel alloc] initWithFrame:CGRectMake(186, 112, 65.f, 11.f)];
                    labelContactCoupleName.textColor = [UIColor colorWithRed:201/255.f green:201/255.f blue:201/255.f alpha:1.0];
                    labelContactCoupleName.textAlignment = UITextAlignmentCenter;
                    labelContactCoupleName.font = [UIFont systemFontOfSize:10.f];
                    labelContactCoupleName.backgroundColor = [UIColor clearColor];
                    labelContactCoupleName.text = [NSString stringWithFormat:@"(%@)",coupleContactName];
                    labelContactCoupleName.tag = labelContactCoupleNameTag;
                    [self.viewContentBG addSubview:labelContactCoupleName];
                }else {
                    labelContactCoupleName.text = [NSString stringWithFormat:@"(%@)",coupleContactName];
                }
            }
           // UIButton *btnTapCouple = (UIButton *)[self viewWithTag:btnTapCoupleTag];
            HPHeadView *btnTapCouple = (HPHeadView *)[self viewWithTag:btnTapCoupleTag];
            if (!btnTapCouple) {
                
               // AGMedallionView *imageviewCouple = [[AGMedallionView alloc] initWithFrame:CGRectMake(185.f, 100.f, 47.f, 47.f)];
                //[imageviewCouple setBorderWidth:1.f];
                //UIImageView *imageviewCouple = [[UIImageView alloc] initWithFrame:CGRectMake(185.f, 109.f, 48.f, 48.f)];
                btnTapCouple = [[HPHeadView alloc] init];
                btnTapCouple.backgroundColor = [UIColor clearColor];
                //[btnTapCouple setBackgroundImage:[imageviewCouple returnImg] forState:UIControlStateNormal];
                btnTapCouple.tag = btnTapCoupleTag;
                [btnTapCouple addTarget:self action:@selector(tapCoupleHead) forControlEvents:UIControlEventTouchUpInside];
                [self.viewContentBG addSubview:btnTapCouple]; 
                
            }
            if (!imageCouple) {
                [btnTapCouple setCycleImage:nil];
                btnTapCouple.borderWidth = 0.f;
                [btnTapCouple setFrame:CGRectMake(248, 84.f, 44.f, 44.f)];
                if ([userInfo.sex integerValue] == USER_INFO_SEX_MALE) {
                    imageCouple = [UIImage imageNamed:@"man.png"];
                    
                }else if([userInfo.sex integerValue] == USER_INFO_SEX_FEMALE)
                {
                    imageCouple = [UIImage imageNamed:@"woman.png"];
                    
                }
            }else {
                [btnTapCouple setBackImage:imageCouple];
                [btnTapCouple setFrame:CGRectMake(248.f, 84.f, 55.f, 55.f)];
                btnTapCouple.borderWidth = 5.f;
                [btnTapCouple setCycleImage:[UIImage imageNamed:@"headpic_index_90x90.png"]];
            }
        }
        
        
        
        
        //性别
//        CGFloat nickNameWidth = 0;
//        CGSize userNickNameSize = [userInfo.nickName sizeWithFont:[UIFont systemFontOfSize:14]];
//        if (userNickNameSize.width > 88) {
//            nickNameWidth = 88;
//        }else {
//            nickNameWidth = userNickNameSize.width;
//        }
        
//        UIImageView *imageviewSex = (UIImageView *)[self viewWithTag:imageviewSexTag];
//        if (!imageviewSex) {
//            //213是nickname结束x坐标
//        imageviewSex = [[UIImageView alloc] initWithFrame:CGRectMake(213-nickNameWidth-23, 180.f, 19.f, 19.5f)];            
//        [self.viewContentBG addSubview:imageviewSex];
//        }
//        if ([userInfo.sex integerValue] == USER_INFO_SEX_FEMALE) {
//            [imageviewSex setImage:[UIImage imageNamed:@"im_profile_sex1.png"]];
//        }else if([userInfo.sex integerValue] == USER_INFO_SEX_MALE)
//        {
//            [imageviewSex setImage:[UIImage imageNamed:@"im_profile_sex2.png"]];
//        }
        /*
         "Secret" = "不告诉你"
         "HAS_BABY" = "家有宝宝"
         "COUPLE_MARRIED" = "甜蜜夫妻"
         "COUPLE" = "甜蜜情侣"
         "CURSE" = "默默喜欢"
         "SINGLE" = "单身无敌"
         */
        
        UILabel *labelLifeStatus = (UILabel *)[self.viewContentBG viewWithTag:LifeStatusTag];
        if (!labelLifeStatus) {
            labelLifeStatus = [[UILabel alloc] initWithFrame:CGRectMake(261.f, 146.f, 46.f, 12.f)];
            labelLifeStatus.textAlignment = UITextAlignmentCenter;
            labelLifeStatus.textColor = [UIColor colorWithRed:201/255.f green:201/255.f blue:201/255.f alpha:1.0];
            labelLifeStatus.font = [UIFont systemFontOfSize:11.f];
            labelLifeStatus.tag = LifeStatusTag;
            labelLifeStatus.backgroundColor = [UIColor clearColor];  
            [self.viewContentBG addSubview:labelLifeStatus];
        }
        //yes代表没有，NO代表有
        if (![[userInfo hasBaby] boolValue]) {
            if (![userInfo.selfBabyHeaderImgPath isEqualToString:@""] && userInfo.selfBabyHeaderImgPath) {
                //Baby头像
                //AGMedallionView *agBaby = (AGMedallionView *)[self viewWithTag:agBabyTag];
                HPHeadView *agBaby = (HPHeadView *)[self viewWithTag:agBabyTag];
                if (!agBaby) {
                    agBaby = [[HPHeadView alloc] init];
                    agBaby.tag = agBabyTag;
                    agBaby.borderWidth = 5.f;
                    [agBaby setFrame:CGRectMake(248.f, 42.f, 44.f, 44.f)];
                    [agBaby setCycleImage:[UIImage imageNamed:@"headpic_index_70x70.png"]];
                    [self.viewContentBG addSubview:agBaby];
                }
                UIImage *imageBaby = [UIImage imageWithContentsOfFile:userInfo.selfBabyHeaderImgPath];
                if (!imageBaby) {
                    imageBaby = [UIImage imageNamed:@"baby.png"];
                }
                    [agBaby setBackImage:imageBaby];
                
            }
            //Baby Name
            UILabel *labelBaby = (UILabel *)[self viewWithTag:labelBabyTag];
            if (!labelBaby) {
                labelBaby = [[UILabel alloc] initWithFrame:CGRectMake(200.f, 56.f, 44.f, 13.f)];
                labelBaby.font = [UIFont systemFontOfSize:12.f];
                labelBaby.textAlignment = UITextAlignmentRight;
                labelBaby.textColor = [UIColor colorWithHexString:@"#ffffff"];
                labelBaby.shadowColor = [UIColor colorWithHexString:@"#000000"];
                labelBaby.shadowColor = [UIColor colorWithRed:29/255.f green:29/255.f blue:29/255.f alpha:0.5];
                labelBaby.shadowOffset = CGSizeMake(0.f, 1.0f);
                labelBaby.backgroundColor = [UIColor clearColor];
                labelBaby.text = @"宝宝";
                [self.viewContentBG addSubview:labelBaby];
            }
            //labelLifeStatus.text = NSLocalizedString(@"HAS_BABY", @"");
        }else {
            if ([self viewWithTag:labelBabyTag]) {
                [[self viewWithTag:labelBabyTag] removeFromSuperview];
            }
            if ([self viewWithTag:agBabyTag]) {
                [[self viewWithTag:agBabyTag] removeFromSuperview];
            }
        }
            NSInteger userLifeStatus = [userInfo.lifeStatus integerValue];
            switch (userLifeStatus) {
                case USER_LIFE_STATUS_SINGLE:
                case USER_LIFE_STATUS_CURSE:
                {
                    labelLifeStatus.text = NSLocalizedString(@"SINGLE", @"");
                }
                    break;
                case USER_LIFE_STATUS_COUPLE:
                {
                    labelLifeStatus.text = NSLocalizedString(@"COUPLE", @"");
                }
                    break;
                case USER_LIFE_STATUS_COUPLE_MARRIED:
                {
                    labelLifeStatus.text = NSLocalizedString(@"COUPLE_MARRIED", @"");
                }
                    break;                
                default:
                {
                    labelLifeStatus.text = NSLocalizedString(@"SINGLE", @"");
                }
                    break;
            }

        
        
        //        UILabel *labelFriendNickName = (UILabel *)[self viewWithTag:labelFriendNickNameTag];
//        if (!labelFriendNickName) {
//            labelFriendNickName = [[UILabel alloc] initWithFrame:CGRectMake(320-195.f, 460-55.f, 88.f , 14.f)];
//            labelFriendNickName.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
//            labelFriendNickName.text = userInfo.nickName;
//            labelFriendNickName.textAlignment = UITextAlignmentRight;
//            labelFriendNickName.font = [UIFont systemFontOfSize:14.f];
//            labelFriendNickName.backgroundColor = [UIColor clearColor];
//            [self.superview addSubview:labelFriendNickName];   

//        }else {
//            labelFriendNickName.text = userInfo.nickName;
//        }
        
        //userInfo.recentType = USER_RECENT_TYPE_AUDIO;
        switch (userInfo.recentType) {
            case USER_RECENT_TYPE_TEXT:
            {
                UIView *audioRecentView = [self viewWithTag:audioRecentViewTag];
                if (audioRecentView) {
                    [audioRecentView removeFromSuperview];
                }
                UILabel *labelRecent = (UILabel *)[self viewWithTag:labelRecentTag];
                if (!labelRecent) {
                    labelRecent = [[UILabel alloc] initWithFrame:CGRectMake(29, 74.f, 122.f, 62.f)];
                    labelRecent.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
                    labelRecent.font = [UIFont systemFontOfSize:13];
                    labelRecent.numberOfLines = 3;
                    labelRecent.tag = labelRecentTag;
                    labelRecent.textAlignment = UITextAlignmentLeft;
                    labelRecent.baselineAdjustment = UIBaselineAdjustmentNone;     
                    labelRecent.backgroundColor = [UIColor clearColor];
                    [self.viewContentBG addSubview:labelRecent];
                }else {
                    UIFont *textFont = [UIFont systemFontOfSize:13.0f];
                    NSString *textStr = userInfo.recentContent;
                    CGSize maxSize = CGSizeMake(122.f, 62.0f);
                    CGSize dateStringSize = [textStr sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:labelRecent.lineBreakMode];
                    CGRect frameRect = CGRectMake(29, 74.f,122.f, dateStringSize.height);
                    labelRecent.frame = frameRect;
                    labelRecent.text = userInfo.recentContent;
                }
                
                if ([userInfo.recentContent isEqualToString:@""]) {
                    //他/她最近没有写近况哦，这就去关心他/她！
                    
                    NSString *textStr = @"唉...没有近况，好空旷啊";
                    UIFont *textFont = [UIFont systemFontOfSize:13.0f];
                    CGSize maxSize = CGSizeMake(122.f, 80.0f);
                    CGSize dateStringSize = [textStr sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:labelRecent.lineBreakMode];
                    CGRect frameRect = CGRectMake(29, 74.f,122.f, dateStringSize.height);
                    labelRecent.text = textStr;
                    labelRecent.frame = frameRect;
                }
               

            }
                break;
                //语音近况
            case USER_RECENT_TYPE_AUDIO:
            {
                UILabel *labelRecent = (UILabel *)[self viewWithTag:labelRecentTag];
                if (labelRecent) {
                    [labelRecent  removeFromSuperview];
                }

                UIView *audioRecentView = [self viewWithTag:audioRecentViewTag];
                if (!audioRecentView) {
                    audioRecentView = [[UIView alloc] initWithFrame:CGRectMake(28, 70.f, 122.f, 80.f)];
                    audioRecentView.tag = audioRecentViewTag;
                    [self.viewContentBG addSubview:audioRecentView];
                    
                    UILabel *labelAudioTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 5.f, 95.5f, 15.f)];
                    labelAudioTitle.font = [UIFont systemFontOfSize:14.f];
                    labelAudioTitle.textAlignment = UITextAlignmentCenter;
                    labelAudioTitle.text = @"我更新近况啦";
                    labelAudioTitle.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
                    labelAudioTitle.backgroundColor = [UIColor clearColor];
                    [audioRecentView addSubview:labelAudioTitle];
                    
                    UIButton *btnAudio = [UIButton buttonWithType:UIButtonTypeCustom];
                    [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
                    [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
                    [btnAudio setFrame:CGRectMake(45.f, 30.f, 24.f, 24.f)];
                    btnAudio.tag = btnAudioPlayTag;
                    [btnAudio addTarget:self action:@selector(playAudioInSingleView:) forControlEvents:UIControlEventTouchUpInside];
                    [audioRecentView addSubview:btnAudio];
                    
                    UILabel *labelAudioLength = [[UILabel alloc] initWithFrame:CGRectMake(50.f, 60.f, 24.f, 13.f)];
                    labelAudioLength.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
                    labelAudioLength.font = [UIFont systemFontOfSize:12.f];
                    labelAudioLength.tag = LabelAudioLengthTag;
                    int length = 0;
                    if ([[NSFileManager defaultManager] fileExistsAtPath:userInfo.recentContent]) {
                        length = (int) [[MusicPlayerManager sharedInstance] musicLength:userInfo.recentContent];
                        labelAudioLength.text = [NSString stringWithFormat:@"%ds",length];
                    }
                    labelAudioLength.backgroundColor = [UIColor clearColor];
                    [audioRecentView addSubview:labelAudioLength];
                }else {
                    UILabel *labelAudioLength = (UILabel *)[self viewWithTag:LabelAudioLengthTag];
                    //int length = 0;
                    if ([[NSFileManager defaultManager] fileExistsAtPath:userInfo.recentContent]) {
                        audioTime = (int) [[MusicPlayerManager sharedInstance] musicLength:userInfo.recentContent];
                        labelAudioLength.text = [NSString stringWithFormat:@"%ds",audioTime];
                    }
                }
            }
                break;                    
            default:
            {
                UIView *audioRecentView = [self viewWithTag:audioRecentViewTag];
                if (audioRecentView) {
                    [audioRecentView removeFromSuperview];
                }
                
                UILabel *labelRecent = (UILabel *)[self viewWithTag:labelRecentTag];
                if (!labelRecent) {
                    labelRecent = [[UILabel alloc] initWithFrame:CGRectMake(29.f, 74.f, 122.f, 62.f)];
                    labelRecent.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
                    labelRecent.font = [UIFont systemFontOfSize:13];
                    labelRecent.numberOfLines = 3;
                    labelRecent.tag = labelRecentTag;
                    labelRecent.textAlignment = UITextAlignmentLeft;
                    labelRecent.baselineAdjustment = UIBaselineAdjustmentNone;     
                    labelRecent.backgroundColor = [UIColor clearColor];
                    [self.viewContentBG addSubview:labelRecent];
                }
                //他/她最近没有写近况哦，这就去关心他/她！
                

                 NSString *textStr = @"唉...没有近况，好空旷啊";
                UIFont *textFont = [UIFont systemFontOfSize:13.0f];
                CGSize maxSize = CGSizeMake(122.f, 60.0f);
                CGSize dateStringSize = [textStr sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:labelRecent.lineBreakMode];
                CGRect frameRect = CGRectMake(29.f, 74.f, 122.f, dateStringSize.height);
                labelRecent.text = textStr;
                labelRecent.frame = frameRect;
                
            }
                break;
        }
        
    }else {
        [[self.viewContentBG viewWithTag:LifeStatusTag] removeFromSuperview];
        //[[self viewWithTag:imageviewSexTag] removeFromSuperview];
        [[self viewWithTag:labelCoupleNickNameTag] removeFromSuperview];
        [[self viewWithTag:btnTapCoupleTag] removeFromSuperview];
        [[self viewWithTag:labelContactCoupleNameTag] removeFromSuperview];
        [self.imageviewBGInMainView setImage:[UIImage imageNamed:@""]];
    }
}
-(void)playAudioInSingleView : (UIButton *)sender
{
 
    if (self.modelMessageGroup.memberList.count > 0) {
        CPUIModelMessageGroupMember *member = [self.modelMessageGroup.memberList objectAtIndex:0];
        CPUIModelUserInfo *userInfo = member.userInfo;
        NSString *amrPath = userInfo.recentContent;
       // NSString *couplePath = userInfo.recentContent;
        NSString *wavPath;
        NSString *coupleWavPath;
     
     
        if ([userInfo.type integerValue] == USER_RELATION_TYPE_LOVER || [userInfo.type integerValue] == USER_RELATION_TYPE_MARRIED || [userInfo.type integerValue] == USER_RELATION_TYPE_COUPLE) {
            if (amrPath) {
                coupleWavPath = [[amrPath stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];
                if (![[NSFileManager defaultManager] fileExistsAtPath:coupleWavPath]) {  // 转网络的amr－> wav
                    [TPCMToAMR doConvertAMRFromPath:amrPath toPCMPath:coupleWavPath];
                }
            }
            if (userInfo.recentType == USER_RECENT_TYPE_AUDIO) {
               // NSString *wavPath = [[CoreUtils getDocumentPath] stringByAppendingPathComponent:@"/couple_audio_recent_wav.wav"];
                
                if ([[MusicPlayerManager sharedInstance] isPlaying]) {
                    [[MusicPlayerManager sharedInstance] stop];
                    //[self resetAudioLength];
                    [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
                    [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
                }else {
                    if ([self.singleProfileDelegate respondsToSelector:@selector(palyAudioFromSingleProfileView:)]) {
                        [self.singleProfileDelegate palyAudioFromSingleProfileView:sender];
                    }
                    
                    [MusicPlayerManager sharedInstance].delegate = self;
                    [[MusicPlayerManager sharedInstance] playMusic:coupleWavPath playerName:coupleWavPath];
                    
                    [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_state_stop_little_white.png"] forState:UIControlStateNormal];
                    [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_state__stop_little_grey.png"] forState:UIControlStateHighlighted];
                }

            }
        }else {
            if (amrPath) {
                NSRange range = [amrPath rangeOfString:@"header"];
                NSString *friendAmrPath = [[amrPath substringToIndex:range.location+range.length] stringByAppendingPathComponent:@"friendPath"];
                wavPath = [[friendAmrPath stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];
                [TPCMToAMR doConvertAMRFromPath:amrPath toPCMPath:wavPath];
            }
            if (userInfo.recentType == USER_RECENT_TYPE_AUDIO) {
//                NSString *amrPath = userInfo.recentContent;
//                NSString *wavPath = [[CoreUtils getDocumentPath] stringByAppendingPathComponent:@"/friend_audio_recent_wav.wav"];
                
                if ([[NSFileManager defaultManager] fileExistsAtPath:wavPath]) {
                    if ([[MusicPlayerManager sharedInstance] isPlaying]) {
                        [[MusicPlayerManager sharedInstance] stop];
                        //[self resetAudioLength];
                        [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
                        [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
                    }else {
                        if ([self.singleProfileDelegate respondsToSelector:@selector(palyAudioFromSingleProfileView:)]) {
                            [self.singleProfileDelegate palyAudioFromSingleProfileView:sender];
                        }
                        
                        [MusicPlayerManager sharedInstance].delegate = self;
                        [[MusicPlayerManager sharedInstance] playMusic:wavPath playerName:wavPath];
                        
                        [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_state_stop_little_white.png"] forState:UIControlStateNormal];
                        [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_state__stop_little_grey.png"] forState:UIControlStateHighlighted];
                    }
                }
            }    
        }
        
        
    }
 
}
-(void)musicPlayer:(MusicPlayerManager *)player playToTime:(NSTimeInterval)time playerName:(NSString *)name
{
    
}
-(void)musicPlayerDidFinishPlaying:(MusicPlayerManager *) player playerName:(NSString *)name{
    
        UIButton *btnAudio = (UIButton *)[self viewWithTag:btnAudioPlayTag];
    CPUIModelUserInfo *coupleInfo = [CPUIModelManagement sharedInstance].coupleModel;
    NSString *amrPath2 = coupleInfo.recentContent;
    NSString *couplePath;
    if (amrPath2) {
        couplePath = [[amrPath2 stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];
    }
    //重置时长
    //[self resetAudioLength];
    if (self.modelMessageGroup.memberList.count > 0) {
        CPUIModelMessageGroupMember *member = [self.modelMessageGroup.memberList objectAtIndex:0];
        CPUIModelUserInfo *userInfo = member.userInfo;
        NSString *amrPath = userInfo.recentContent;
        NSRange range = [amrPath rangeOfString:@"header"];
        NSString *friendAmrPath = [[amrPath substringToIndex:range.location+range.length] stringByAppendingPathComponent:@"friendPath"];
        NSString *wavPath = [[friendAmrPath stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];

//        NSString *friendPath = [[CoreUtils getDocumentPath] stringByAppendingPathComponent:@"/friend_audio_recent_wav.wav"];
//        NSString *couplePath = [[CoreUtils getDocumentPath] stringByAppendingPathComponent:@"/couple_audio_recent_wav.wav"];
    if ([name isEqualToString:wavPath] || [name isEqualToString:couplePath]) {
        [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
        [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
    }
    }
}
-(void)musicPlayerDecodeErrorDidOccur:(MusicPlayerManager *) player error:(NSError *)error playerName:(NSString *)name{
    
}
//-(void)musicPlayer:(MusicPlayerManager *)player playToTime:(NSTimeInterval)time playerName:(NSString *)name
//{
//    UILabel *labelAudioLength = (UILabel *)[self viewWithTag:LabelAudioLengthTag];
//    if (labelAudioLength) {
//        div_t s = div(time, 1);
//        int length = s.quot;
//        labelAudioLength.text = [NSString stringWithFormat:@"%ds",audioTime-length];
//    }
//}
-(void)resetAudioLength
{
    if ([[MusicPlayerManager sharedInstance] isPlaying]) {
        [[MusicPlayerManager sharedInstance] stop];
        UIButton *btn = (UIButton *)[self viewWithTag:btnAudioPlayTag];
        if (btn) {
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted]; 
        }
    }

    
    
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
