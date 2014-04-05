//
//  SingleIndependentProfileViewController.m
//  iCouple
//
//  Created by qing zhang on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SingleIndependentProfileViewController.h"
#import "ChangeContactRelation.h"
#import "ChooseCoupleTypeViewController.h"
#import "SingleIMViewController.h"
#import "ShuangShuangTeamViewController.h"
#import "XiaoShuangIMViewController.h"
#import "SystemIMViewController.h"
#import "TPCMToAMR.h"
#import "AddContactAnswerViewController.h"

#define labelRecentTag 100
#define audioRecentViewTag 101
#define LabelAudioLengthTag 102

#define Relation @"relation"
#define BGImage @"bgImage"
#define Recent @"recent"
@interface SingleIndependentProfileViewController ()
{
    //目标关系
    NSInteger updateRelationType;
    //近况时间
    int audioTime;
    //
    NSUInteger updateRelationTyped;
    BOOL needRefreshFlag;
}
@property (nonatomic , strong) CPUIModelUserInfo *modelUserInfo;
//小双内置数据
@property (nonatomic , strong) NSDictionary *xiaoshuangData;

//双双团队内置数据
@property (nonatomic , strong) NSDictionary *shuangshuangTeamData;
//系统消息内置数据
@property (nonatomic , strong) NSDictionary *systemMessageData;

@end

@implementation SingleIndependentProfileViewController
@synthesize modelUserInfo = _modelUserInfo;
@synthesize xiaoshuangData = _xiaoshuangData;
@synthesize shuangshuangTeamData = _shuangshuangTeamData;
@synthesize systemMessageData = _systemMessageData;
@synthesize fromCoupleHeadPush;
//延迟加载3个字典
-(NSDictionary *)xiaoshuangData
{
    if (!_xiaoshuangData) {
        _xiaoshuangData = [[NSDictionary alloc] initWithObjectsAndKeys:@"你们现在是蜜友",@"relation",@"xiaoshuang_profile.jpg",@"bgImage",@"我能打听小秘密、哄Ta开心、发定时提醒~点输入栏左侧唤出我吧",@"recent", nil];
    }
    return _xiaoshuangData;
}
-(NSDictionary *)shuangshuangTeamData
{
    if (!_shuangshuangTeamData) {
        _shuangshuangTeamData = [[NSDictionary alloc] initWithObjectsAndKeys:@"你们现在是好友",@"relation",@"teamwall_paper.jpg",@"bgImage",@"无聊了/迷茫了/玩high了/有好建议了，都可以“调戏”我们哦",@"recent", nil];
    }
    return _shuangshuangTeamData;
}
-(NSDictionary *)systemMessageData
{
    if (!_systemMessageData) {
        _systemMessageData = [[NSDictionary alloc] initWithObjectsAndKeys:@"你们现在是好友",@"relation",@"pic_system.jpg",@"bgImage",@"有朋友加入双双、有人想和你的关系更进一步，我会第一时间通知你",@"recent", nil];
    }
    return _systemMessageData;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithUserInfo:(CPUIModelUserInfo *)userInfo
{
    self = [super init];
    if (self) {
        self.modelUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:userInfo.name];
        self.fromCoupleHeadPush = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCoupleType:) name:@"ChooseCoupleNotification" object:nil];
        [self refreshView];
        
//        if ([[CPUIModelManagement sharedInstance]getMsgGroupWithUserName:userInfo.name]) {
//            [[CPUIModelManagement sharedInstance] setCurrentMsgGroup:[[CPUIModelManagement sharedInstance]getMsgGroupWithUserName:userInfo.name]];
//        }

    }
    return self;
}
-(id)initWithUserInfoFromIM:(CPUIModelUserInfo *)userInfo
{
    self = [super init];
    if (self) {
        self.modelUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:userInfo.name];
        self.fromCoupleHeadPush = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCoupleType:) name:@"ChooseCoupleNotification" object:nil];
        [self refreshView];    
        
        self.comeFromIM = YES;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (![self isSpecialUserInfo]) {
        //改变关系
        changeRelation = [UIButton buttonWithType:UIButtonTypeCustom];
        [changeRelation setFrame:CGRectMake(110, 350.f, 106.5, 36.5)];
        [changeRelation setBackgroundImage:[UIImage imageNamed:@"login_btn_login.png"] forState:UIControlStateNormal];
        [changeRelation setBackgroundImage:[UIImage imageNamed:@"login_btn_login_hover.png"] forState:UIControlStateHighlighted];
        [changeRelation setTitle:@"改变关系" forState:UIControlStateNormal];
        changeRelation.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        [changeRelation addTarget:self action:@selector(changeRelation) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:changeRelation];        
    }

    
	// Do any additional setup after loading the view.
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self getLoveMessage];
    
    [self performSelector:@selector(refreshProfileContent) withObject:nil afterDelay:2.0f];
}
-(void)refreshProfileContent
{
    
    //212 查看两次，第二次显示好友的自定义背景图,手动通知需要刷新profile
    [self refreshView];
   // [[CPUIModelManagement sharedInstance] getUserRecentWithUser:self.modelUserInfo];
}
-(void)viewWillAppear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] getUserProfileWithUser:self.modelUserInfo];
    [super viewWillAppear:animated];
    if (![self isSpecialUserInfo]) {
        [[CPUIModelManagement sharedInstance]addObserver:self forKeyPath:@"modifyFriendTypeDic" options:0 context:nil];
        [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"deleteFriendDic" options:0 context:nil];        
        [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"userMsgGroupTag" options:0 context:nil];   
        [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"coupleMsgGroupTag" options:0 context:nil];
    }
  

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (![self isSpecialUserInfo]) {
        [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"deleteFriendDic"];
        [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"modifyFriendTypeDic"];        
        [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"userMsgGroupTag"];   
        [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"coupleMsgGroupTag"];        
    }
    [self resetAudioLength];


    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)backTap
{
    for (AddContactAnswerViewController *answer in self.navigationController.viewControllers) {
        if ([answer isKindOfClass:[AddContactAnswerViewController class]]) {
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-3] animated:YES];
            return;
        }
    }
    [self.navigationController  popViewControllerAnimated:YES];
}
#pragma mark observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"modifyFriendTypeDic"]) {
        /*************************王硕 2012－6－14*****************************/
        NSString *observeUserName = (NSString *)[[CPUIModelManagement sharedInstance].modifyFriendTypeDic objectForKey:modify_friend_dic_user_name];
        
        if (nil == observeUserName || [observeUserName isEqualToString:@""]) {
            CPLogInfo(@"observeUserName is nil!!!!");
            return;
        }else if (![observeUserName isEqualToString:userName]) {
            return;
        }
        /*************************王硕 2012－6－14*****************************/
        //仅仅是收到改变关系成功的通知
        if ([[[CPUIModelManagement sharedInstance].modifyFriendTypeDic objectForKey:modify_friend_dic_res_code] integerValue] == RESPONSE_CODE_SUCESS) {
            if (updateRelationType == FRIEND_CATEGORY_LOVER && updateRelationType != -1) {
                [[HPTopTipView shareInstance] showMessage:@"操作成功" duration:1.5f];
                [self performSelector:@selector(delayRefreshContent) withObject:nil afterDelay:2.0];
                //updateRelationType = -1;
            }else {
                if (updateRelationType == FRIEND_CATEGORY_COUPLE || updateRelationType == FRIEND_CATEGORY_MARRIED) {
                    [self.loadingView close];
                    self.loadingView = nil;
                    [[HPTopTipView shareInstance] showMessage:@"请求发送成功" duration:1.5f];    
                }else {
                    [self performSelector:@selector(delayRefreshContent) withObject:nil afterDelay:2.0];
                    [[HPTopTipView shareInstance] showMessage:@"操作成功" duration:1.5f];    
                }
             
            }
        if (self.modelUserInfo) {
            
            [[CPUIModelManagement sharedInstance] getUserProfileWithUser:self.modelUserInfo];
            [[CPUIModelManagement sharedInstance] getUserRecentWithUser:self.modelUserInfo];
        }

        }else {
            [self.loadingView close];
            self.loadingView = nil;
            NSString *desc = [[CPUIModelManagement sharedInstance].modifyFriendTypeDic objectForKey:modify_friend_dic_res_desc];
            [[HPTopTipView shareInstance] showMessage:desc duration:1.5f];       
        }
    }else if ([keyPath isEqualToString:@"deleteFriendDic"]) {
        [self.loadingView close];
        self.loadingView = nil;
        if ([[[CPUIModelManagement sharedInstance].deleteFriendDic objectForKey:delete_friend_dic_res_code] integerValue] == RESPONSE_CODE_SUCESS) {
            
            [[HPTopTipView shareInstance] showMessage:@"Ta已经离开你的双双" duration:2.5f];
            for (HomeMainViewController *homeMain in self.navigationController.viewControllers) {
                if ([homeMain isKindOfClass:[HomeMainViewController class]]) {
                    [self.navigationController popToViewController:homeMain animated:YES];
                    return;
                }
            }
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else {
            [[HPTopTipView shareInstance] showMessage:[[CPUIModelManagement sharedInstance].deleteFriendDic objectForKey:delete_friend_dic_res_desc] duration:1.5f];
        }
    }else if ([keyPath isEqualToString:@"createMsgGroupTag"]) {
        [self.loadingView close];
        self.loadingView = nil;
        if ([CPUIModelManagement sharedInstance].createMsgGroupTag == RESPONSE_CODE_SUCESS) {
            CPUIModelMessageGroup *currMsgGroup = [[CPUIModelManagement sharedInstance] userMsgGroup];
     
            
            if ([currMsgGroup.relationType integerValue]==MSG_GROUP_UI_RELATION_TYPE_COUPLE)   // couple
            {
                SingleIMViewController *single = [[SingleIMViewController alloc] init:currMsgGroup];
                
                [self.navigationController pushViewController:single animated:YES];
                return;
            }
            else  
            {
                CPUIModelMessageGroupMember *member = [currMsgGroup.memberList objectAtIndex:0]; //只有一个成员
                switch ([member.userInfo.type intValue]) {
                
                    case USER_MANAGER_FANXER:  // 凡想团队
                    {
                        ShuangShuangTeamViewController *team = [[ShuangShuangTeamViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:team animated:YES];
                    }
                        break;
                    case USER_MANAGER_SYSTEM:  // 系统消息
                    {
                        SystemIMViewController *system = [[SystemIMViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:system animated:YES];
                    }
                        break;
                    case USER_MANAGER_XIAOSHUANG: // 小双
                    {
                        XiaoShuangIMViewController *xiaoshuang = [[XiaoShuangIMViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:xiaoshuang animated:YES];
                    }
                        break;
                        
                    default:
                    {
                        
                        SingleIMViewController *single = [[SingleIMViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:single animated:YES];
                    }
                        break;
                }
                
                return;
                /*
                 SingleIMViewController *single = [[SingleIMViewController alloc] init:currMsgGroup];
                 [self.navigationController pushViewController:single animated:YES];
                 return;
                 */
            }
        }else {
            
        }
    }else if ([keyPath isEqualToString:@"userMsgGroupTag"]) {
        
        switch ([CPUIModelManagement sharedInstance].userMsgGroupTag) {
                
            self.modelUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:self.modelUserInfo.name];
            case UPDATE_USER_GROUP_TAG_MSG_LIST_APPEND:{
                //[self performSelector:@selector(getLoveMessage) withObject:nil afterDelay:1.0];
                [self getLoveMessage];
            }
                break;
            case UPDATE_USER_GROUP_TAG_MEM_LIST:{

                needRefreshFlag = YES;
                //消失改变关系时的菊花，改变关系成功的通知中数据并没改变，所以需在此处理
                    [self.loadingView close];
                    self.loadingView = nil;
                [self refreshView];
                [self refreshContent];
            }
                break;
            default:
            {
                
            }
                break;
        }
    }else if ([keyPath isEqualToString:@"coupleMsgGroupTag"]) {
        switch ([CPUIModelManagement sharedInstance].coupleMsgGroupTag) {
            case UPDATE_USER_GROUP_TAG_MEM_LIST:{
                //消失改变关系时的菊花，改变关系成功的通知中数据并没改变，所以需在此处理
                needRefreshFlag = YES;
                [self.loadingView close];
                self.loadingView = nil;
                [self refreshView];
                [self refreshContent];
            }
                break;
        }
    }
}
-(void)receiveCoupleType:(NSNotification *)noti
{
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        [[HPTopTipView shareInstance] showMessage:@"当前未连接网络，请联网后重试"];
    }else {
        NotificationContext *context = [noti object];
        CPUIModelUserInfo *userInfo = self.modelUserInfo;
        if (context.requestType == OtherChoose) {
            if (context.chooseedType == IsLover) {
                
                userName = userInfo.name;
                
                updateRelationType = FRIEND_CATEGORY_COUPLE;
                [[CPUIModelManagement sharedInstance] modifyFriendTypeWithCategory:FRIEND_CATEGORY_COUPLE andUserName:userInfo.name andInviteString:@"" andCouldExpose:YES]; 
                CustomAlertView *customAlert = [[CustomAlertView alloc] init];
                if (!self.loadingView) {
                    self.loadingView = [customAlert showLoadingMessageBox:@"稍等哦..." withTimeOut:TimeOut];
                }
            }else if(context.chooseedType == IsMarried)
            {
                
                userName = userInfo.name;
                
                updateRelationType = FRIEND_CATEGORY_MARRIED;
                [[CPUIModelManagement sharedInstance] modifyFriendTypeWithCategory:FRIEND_CATEGORY_MARRIED andUserName:userInfo.name andInviteString:@"" andCouldExpose:YES]; 
                CustomAlertView *customAlert = [[CustomAlertView alloc] init];
                if (!self.loadingView) {
                    self.loadingView = [customAlert showLoadingMessageBox:@"稍等哦..." withTimeOut:TimeOut];
                }
            }
        }
    } 
}
#pragma mark 加couple成功相关
//判断是否需要弹加couple成功动画
-(void)getLoveMessage
{
    CPUIModelMessageGroup *messageGroup = [CPUIModelManagement sharedInstance].coupleMsgGroup;
    if (messageGroup) {
        //遍历message查看是否有
        for (int i = (int)messageGroup.msgList.count-1; i>=0; i--) {
            CPUIModelMessage *message = [messageGroup.msgList objectAtIndex:i];
            if ([message.isReaded intValue] == MSG_READ_STATUS_IS_NOT_READ) {
                if (message.isMatchLoveMsg) {
                    [self refreshView];
                    NSString *msgID = [[NSUserDefaults standardUserDefaults] objectForKey:@"msgID"];
                    if (![msgID isEqualToString:[message.msgID stringValue]]) {
                        CoupleCompletedView *coupleComplete = [[CoupleCompletedView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, 480.f) withType:message.msgText andCompletedDate:message.date];        
                        [[UIApplication sharedApplication].keyWindow addSubview:coupleComplete];                   
                        
                    }
                    [[NSUserDefaults standardUserDefaults] setValue:[message.msgID stringValue] forKey:@"msgID"];
                    return;
                }
            }else {
                return;
            }
        }
    }    
}
    
#pragma mark refreshData
-(void)refreshView
{
    self.modelUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:self.modelUserInfo.name];

    CPUIModelUserInfo *userInfo = self.modelUserInfo;
    
    //当前关系文案
    if (!currentRelationText) {
        currentRelationText = [[UILabel alloc] initWithFrame:CGRectMake(114, 326, 100, 12)];    
        currentRelationText.backgroundColor = [UIColor clearColor];
        currentRelationText.textAlignment = UITextAlignmentCenter;
        currentRelationText.textColor = [UIColor colorWithHexString:@"#cccccc"];
        currentRelationText.font = [UIFont fontWithName:@"Helvetica" size:12.f];
        currentRelationText.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        currentRelationText.shadowOffset = CGSizeMake(0.0, -1.0);
        [self.view addSubview:currentRelationText];
    }
    
    
    UIImage *imageSelfBG;
    
    
    //背景图
    if (![self isSpecialUserInfo]) {
        
        if (self.modelUserInfo.selfBgImgPath) {
        imageSelfBG = [UIImage imageWithContentsOfFile:self.modelUserInfo.selfBgImgPath];    
        }
        currentRelationText.text = [self getRelationText:[userInfo.type integerValue]];
    }else {
        CGRect imageRect = CGRectMake(0, 0, 640, 422);
        if ([self.modelUserInfo.type integerValue] == USER_MANAGER_SYSTEM) {
            UIImage *image = [UIImage imageNamed:[self.systemMessageData objectForKey:BGImage]];
            if (image) {
                CGImageRef imageRef =CGImageCreateWithImageInRect(image.CGImage, imageRect);
                imageSelfBG = [UIImage imageWithCGImage:imageRef];
                CFRelease(imageRef);
            }
            currentRelationText.text = [self.systemMessageData objectForKey:Relation];
        }else if([self.modelUserInfo.type integerValue] == USER_MANAGER_FANXER){
            UIImage *image = [UIImage imageNamed:[self.shuangshuangTeamData objectForKey:BGImage]];
            if (image) {
                CGImageRef imageRef =CGImageCreateWithImageInRect(image.CGImage, imageRect);
                imageSelfBG = [UIImage imageWithCGImage:imageRef];
                CFRelease(imageRef);
            }
            
            currentRelationText.text = [self.shuangshuangTeamData objectForKey:Relation];
        }else if([self.modelUserInfo.type integerValue] == USER_MANAGER_XIAOSHUANG)
        {
            UIImage *image = [UIImage imageNamed:[self.xiaoshuangData objectForKey:BGImage]];
            if (image) {
                CGImageRef imageRef =CGImageCreateWithImageInRect(image.CGImage, imageRect);
                imageSelfBG = [UIImage imageWithCGImage:imageRef];
                CFRelease(imageRef);
            }
            currentRelationText.text = [self.xiaoshuangData objectForKey:Relation];
        }else
        {
            currentRelationText.text = [self getRelationText:[userInfo.type integerValue]];
        }
    }
    if (imageSelfBG) {
        [self.upBGImage setImage:imageSelfBG];
    }else {
        [self.upBGImage setImage:[UIImage imageNamed:@"bg_default.jpg"]];
    } 
    
    //判断有没有couple，baby
    if ( userInfo.coupleAccount) {
        UIImage *imageCouple;
        //好友couple姓名
        if (!friendCoupleName) {
            friendCoupleName = [[UILabel alloc] initWithFrame:CGRectMake(258.f, 198, 60.f , 13.f)];
            friendCoupleName.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];                
            friendCoupleName.textAlignment = UITextAlignmentLeft;
            friendCoupleName.font = [UIFont systemFontOfSize:12.f];
            friendCoupleName.backgroundColor = [UIColor clearColor];
            [self.view addSubview:friendCoupleName];
        }
        
        //判断couple是否是你的好友
        if (userInfo.coupleUserInfo) {
            if ( [userInfo.coupleUserInfo.nickName isEqualToString:@""]) {
                friendCoupleName.text = @"没有名字";    
            }else {
                friendCoupleName.text = userInfo.coupleUserInfo.nickName;    
            }
            
            imageCouple =  [UIImage imageWithContentsOfFile:userInfo.coupleUserInfo.headerPath];
        }else {
            if ( [userInfo.coupleNickName isEqualToString:@""]) {
                friendCoupleName.text = @"没有名字";    
            }else {
                friendCoupleName.text = userInfo.coupleNickName;
            }  
            imageCouple = [UIImage imageWithContentsOfFile:userInfo.selfCoupleHeaderImgPath];
        }
        
        if (!friendCoupleIMG) {
            friendCoupleIMG = [[HPHeadView alloc] init];
            friendCoupleIMG.backgroundColor = [UIColor clearColor];
            [friendCoupleIMG setFrame:CGRectMake(188.f, 166.f, 55.f, 55.f)];
            friendCoupleIMG.borderWidth = 5.f;
            [friendCoupleIMG setCycleImage:[UIImage imageNamed:@"headpic_index_90x90"]];
            [friendCoupleIMG addTarget:self action:@selector(tapCoupleHead) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:friendCoupleIMG]; 
    
        }
        if (!imageCouple) {
            [friendCoupleIMG setBackImage:[UIImage imageNamed:@"headpic_index_normal_120x120"]];
        }else {
            [friendCoupleIMG setBackImage:imageCouple];
        }
    }else {
        [friendCoupleIMG removeFromSuperview];
        [friendCoupleName removeFromSuperview];
        
    }
    if (![self isSpecialUserInfo]) {
        if (![[userInfo hasBaby] boolValue])
        {
            //Baby头像
            if (!friendBabyIMG) {
                friendBabyIMG = [[HPHeadView alloc] init];
                friendBabyIMG.borderWidth = 5.f;
                [friendBabyIMG setFrame:CGRectMake(86.f, 166.f, 55.f, 55.f)];
                [friendBabyIMG setCycleImage:[UIImage imageNamed:@"headpic_index_90x90"]];
                [self.view addSubview:friendBabyIMG];
            }
            UIImage *imageBaby = [UIImage imageWithContentsOfFile:userInfo.selfBabyHeaderImgPath];
            if (!imageBaby) {
                imageBaby = [UIImage imageNamed:@"baby.png"];
            }
            [friendBabyIMG setBackImage:imageBaby];
            
            
            //Baby Name
            if (!friendBabyName) {
                friendBabyName = [[UILabel alloc] initWithFrame:CGRectMake(44.f, 198.f, 42.f, 13.f)];
                friendBabyName.font = [UIFont systemFontOfSize:12.f];
                friendBabyName.textAlignment = UITextAlignmentRight;
                friendBabyName.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
                //friendBabyName.shadowOffset = CGSizeMake(0.f, 1.0f);
                friendBabyName.backgroundColor = [UIColor clearColor];
                friendBabyName.text = @"宝宝";
                [self.view addSubview:friendBabyName];
            }
        }else {
            [friendBabyIMG removeFromSuperview];
            [friendBabyName removeFromSuperview];
        }
    }
    
    //好友的头像
    if(!friendHeadIMG)
    {
        friendHeadIMG = [[HPHeadView alloc] init];
        friendHeadIMG.borderWidth = 5.f;
        [friendHeadIMG setFrame:CGRectMake(129, 154, 70, 70 )];
        [friendHeadIMG setCycleImage:[UIImage imageNamed:@"headpic_index_120x120"]];
        [self.view addSubview:friendHeadIMG];
    }
    
    UIImage *imageFriendHead = [UIImage imageWithContentsOfFile:userInfo.headerPath];
    if (!imageFriendHead) {
        imageFriendHead = [UIImage imageNamed:@"headpic_index_normal_120x120"];
    }
    [friendHeadIMG setBackImage:imageFriendHead];
    
    //好友的昵称
    if (!friendName) {
        friendName = [[UILabel alloc] initWithFrame:CGRectMake(50, 230, 220, 15)];
        friendName.font = [UIFont boldSystemFontOfSize:14.f];
        friendName.textAlignment = UITextAlignmentCenter;
        friendName.backgroundColor = [UIColor clearColor];
        friendName.textColor = [UIColor whiteColor];
        [self.view addSubview:friendName];
    }
    friendName.text = userInfo.nickName;
    CGSize friendNameSize = [friendName.text sizeWithFont:[UIFont boldSystemFontOfSize:14.f]];
    //性别
    if (!imageviewfriendSex) {
        if (friendNameSize.width>200) {
            imageviewfriendSex = [[UIImageView alloc] initWithFrame:CGRectMake(272, 230, 14, 14)];    
        }else {
            imageviewfriendSex = [[UIImageView alloc] initWithFrame:CGRectMake(165+friendNameSize.width/2, 230, 14, 14)];    
        }
        
        [self.view addSubview:imageviewfriendSex];
    }
    if ([userInfo.sex integerValue] == USER_INFO_SEX_MALE || [userInfo.type integerValue] == USER_MANAGER_SYSTEM || [userInfo.type integerValue] == USER_MANAGER_FANXER) {
        [imageviewfriendSex setImage:[UIImage imageNamed:@"profile_icon_male_02.png"]];
        
    }else if([userInfo.sex integerValue] == USER_INFO_SEX_FEMALE || [userInfo.type integerValue] == USER_MANAGER_XIAOSHUANG)
    {
        [imageviewfriendSex setImage:[UIImage imageNamed:@"profile_icon_female_02.png"]];
        
    }
    
 

    if (!imageviewRecentBG) {
        imageviewRecentBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile_bg_recent_others.png"]];
        imageviewRecentBG.userInteractionEnabled = YES;
        [imageviewRecentBG setFrame:CGRectMake(59, 251, 202, 54)];
        [self.view addSubview:imageviewRecentBG];
    }
    //近况
    switch (userInfo.recentType) {
        case USER_RECENT_TYPE_TEXT:
        {
            UIView *audioRecentView = [self.view viewWithTag:audioRecentViewTag];
            if (audioRecentView) {
                [audioRecentView removeFromSuperview];
            }
            UILabel *labelRecent = (UILabel *)[self.view viewWithTag:labelRecentTag];
            if (!labelRecent) {
                labelRecent = [[UILabel alloc] initWithFrame:CGRectMake(12, 16.f, 190.f, 30.f)];
                //labelRecent.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
                labelRecent.textColor = [UIColor colorWithHexString:@"#cccccc"];
                labelRecent.font = [UIFont fontWithName:@"Helvetica" size:12.f];
                labelRecent.numberOfLines = 2;
                labelRecent.tag = labelRecentTag;
                labelRecent.textAlignment = UITextAlignmentLeft;
                labelRecent.baselineAdjustment = UIBaselineAdjustmentNone;     
                labelRecent.backgroundColor = [UIColor clearColor];
                [imageviewRecentBG addSubview:labelRecent];
            }
            NSString *textStr;
            if ([userInfo.recentContent isEqualToString:@""]) {
                //他/她最近没有写近况哦，这就去关心他/她！
                textStr = @"唉...没有近况，好空旷啊";
            }else{
                textStr = userInfo.recentContent;
            }
            
            UIFont *textFont = [UIFont systemFontOfSize:13.0f];
            CGSize maxSize = CGSizeMake(190.f, 30.0f);
            CGSize dateStringSize = [textStr sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:labelRecent.lineBreakMode];
            CGRect frameRect = CGRectMake(12, 16.f, 190.f, dateStringSize.height);
            labelRecent.frame = frameRect;
            labelRecent.text = textStr;
            
            
        }
            break;
            //语音近况
        case USER_RECENT_TYPE_AUDIO:
        {
            UILabel *labelRecent = (UILabel *)[self.view viewWithTag:labelRecentTag];
            if (labelRecent) {
                [labelRecent  removeFromSuperview];
            }
            
            UIView *audioRecentView = [self.view viewWithTag:audioRecentViewTag];
            if (!audioRecentView) {
                audioRecentView = [[UIView alloc] initWithFrame:CGRectMake(6, 10.f, 190.f, 40.f)];
                audioRecentView.backgroundColor = [UIColor clearColor];
                audioRecentView.tag = audioRecentViewTag;
                [imageviewRecentBG addSubview:audioRecentView];
                
//                UILabel *labelAudioTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 5.f, 95.5f, 15.f)];
//                labelAudioTitle.font = [UIFont systemFontOfSize:14.f];
//                labelAudioTitle.textAlignment = UITextAlignmentCenter;
//                labelAudioTitle.text = @"我更新近况啦";
//                labelAudioTitle.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
//                labelAudioTitle.backgroundColor = [UIColor clearColor];
//                [audioRecentView addSubview:labelAudioTitle];
                
                UIButton *btnAudio = [UIButton buttonWithType:UIButtonTypeCustom];
                [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
                [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
                [btnAudio setFrame:CGRectMake(65.f, 8.f, 24.f, 24.f)];
                btnAudio.tag = btnAudioPlayTag;
                [btnAudio addTarget:self action:@selector(playAudioInSIngleIndependentProfile:) forControlEvents:UIControlEventTouchUpInside];
                [audioRecentView addSubview:btnAudio];
                
                UILabel *labelAudioLength = [[UILabel alloc] initWithFrame:CGRectMake(95.f, 13.f, 24.f, 13.f)];
                labelAudioLength.textColor = [UIColor colorWithHexString:@"#cccccc"];
                labelAudioLength.font = [UIFont fontWithName:@"Helvetica" size:12.f];
                labelAudioLength.tag = LabelAudioLengthTag;
                int length = 0;
                if ([[NSFileManager defaultManager] fileExistsAtPath:userInfo.recentContent]) {
                    length = (int) [[MusicPlayerManager sharedInstance] musicLength:userInfo.recentContent];
                    labelAudioLength.text = [NSString stringWithFormat:@"%ds",length];
                }
                labelAudioLength.backgroundColor = [UIColor clearColor];
                [audioRecentView addSubview:labelAudioLength];
            }else {
                UILabel *labelAudioLength = (UILabel *)[self.view viewWithTag:LabelAudioLengthTag];
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
            UIView *audioRecentView = [self.view viewWithTag:audioRecentViewTag];
            if (audioRecentView) {
                [audioRecentView removeFromSuperview];
            }
            
            UILabel *labelRecent = (UILabel *)[self.view viewWithTag:labelRecentTag];
            if (!labelRecent) {
                labelRecent = [[UILabel alloc] initWithFrame:CGRectMake(12, 16.f, 190.f, 30.f)];
                labelRecent.textColor = [UIColor colorWithHexString:@"#cccccc"];
                labelRecent.font = [UIFont fontWithName:@"Helvetica" size:12.f];
                labelRecent.numberOfLines = 3;
                labelRecent.tag = labelRecentTag;
                labelRecent.textAlignment = UITextAlignmentLeft;
                labelRecent.baselineAdjustment = UIBaselineAdjustmentNone;     
                labelRecent.backgroundColor = [UIColor clearColor];
                [imageviewRecentBG addSubview:labelRecent];
            }
            //他/她最近没有写近况哦，这就去关心他/她！
            NSString *textStr;
            if ([userInfo.type integerValue] == USER_MANAGER_XIAOSHUANG) {
                textStr = [self.xiaoshuangData objectForKey:Recent];
            }else if([userInfo.type integerValue] == USER_MANAGER_SYSTEM)
            {
                textStr = [self.systemMessageData objectForKey:Recent];
            }else if([userInfo.type integerValue] == USER_MANAGER_FANXER)
            {
                textStr = [self.shuangshuangTeamData objectForKey:Recent];
            }
            else {
                textStr = @"唉...没有近况，好空旷啊";    
            }
            
            UIFont *textFont = [UIFont systemFontOfSize:13.0f];
            CGSize maxSize = CGSizeMake(190.f,30.f);
            CGSize dateStringSize = [textStr sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:labelRecent.lineBreakMode];
            CGRect frameRect = CGRectMake(12, 16.f, 190.f, dateStringSize.height);
            labelRecent.text = textStr;
            labelRecent.frame = frameRect;
            
        }
            break;
    }
    
}
#pragma mark method
//延迟刷新
-(void)delayRefreshContent
{
        //消失改变关系时的菊花，改变关系成功的通知中数据并没改变，所以需在此处理
        [self.loadingView close];
        self.loadingView = nil;
        [self refreshView];
    
    if (currentRelationText) {
        
        currentRelationText.text = [self getRelationText:updateRelationTyped];
    }
        //刷新页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshMessageGroup" object:nil];
}
//刷新内容（因为请求成功的时候数据并没有更新，后续需要改底层）
-(void)refreshContent
{
        //刷新页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshMessageGroup" object:nil];
}
//去聊天
-(void)goChat
{
    if ([self.modelUserInfo.type integerValue] == USER_RELATION_TYPE_COMMON || [self.modelUserInfo.type integerValue] == USER_MANAGER_SYSTEM || [self.modelUserInfo.type integerValue] == USER_MANAGER_FANXER) {
        [[CPUIModelManagement sharedInstance] createConversationWithUsers:[NSArray arrayWithObject:self.modelUserInfo] andMsgGroups:nil andType:CREATE_CONVER_TYPE_COMMON];        
    }else if([self.modelUserInfo.type integerValue] == USER_RELATION_TYPE_CLOSED || [self.modelUserInfo.type integerValue] == USER_MANAGER_XIAOSHUANG){
            [[CPUIModelManagement sharedInstance] createConversationWithUsers:[NSArray arrayWithObject:self.modelUserInfo] andMsgGroups:nil andType:CREATE_CONVER_TYPE_CLOSED];    
    }else {
        //当关系为喜欢的时候但是缺没生成couple的回话
        if (![CPUIModelManagement sharedInstance].coupleMsgGroup) {

            CPUIModelMessageGroup *msgGroup = [[CPUIModelManagement sharedInstance] getMsgGroupWithUserName:self.modelUserInfo.name];
            //看有没有非couple的回话
            if (msgGroup) {
                SingleIMViewController *single = [[SingleIMViewController alloc] init:msgGroup];
                [self.navigationController pushViewController:single animated:YES];                            
            }else {
                needRefreshFlag = NO;
                [self delayRefreshContent];                
            }
        }else {
            //有couple回话
            SingleIMViewController *single = [[SingleIMViewController alloc] init:[CPUIModelManagement sharedInstance].coupleMsgGroup];
            [self.navigationController pushViewController:single animated:YES];            
        }

        return;
    }
    CustomAlertView *customAlert = [[CustomAlertView alloc] init];
    if (!self.loadingView) {
        self.loadingView = [customAlert showLoadingMessageBox:@"稍等哦..." withTimeOut:TimeOut];
    }
    
}
//判断userInfo是否是特殊的
-(BOOL)isSpecialUserInfo
{
    if ([self.modelUserInfo.type integerValue] == USER_MANAGER_FANXER || [self.modelUserInfo.type integerValue] == USER_MANAGER_SYSTEM || [self.modelUserInfo.type integerValue] == USER_MANAGER_XIAOSHUANG) {
        return YES;
    }
    return NO;
}
//改变关系
-(void)changeRelation
{
    self.modelUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:self.modelUserInfo.name];
    
    NSArray *arrRelations = [[[ChangeContactRelation alloc] init] ChangeContactRelationByUserInfo:self.modelUserInfo];
    CPLogInfo(@"action sheet TextArr==%@",arrRelations);
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
    for (NSString *str in arrRelations) {
        [action addButtonWithTitle:str];
    }
    action.cancelButtonIndex = action.numberOfButtons - 1;
    [action showInView:self.view];
}
//点击好友couple头像
-(void)tapCoupleHead
{
    if (self.fromCoupleHeadPush) {
        [self.navigationController popViewControllerAnimated:YES];
        self.fromCoupleHeadPush = NO;
    }else {
        //我自己的profile
        if ([[CPUIModelManagement sharedInstance] isMySelfWithUserName:self.modelUserInfo.coupleAccount]) {
            HomePageSelfProfileViewController *myProfileView = [[HomePageSelfProfileViewController alloc] init];
            [self.navigationController pushViewController:myProfileView animated:YES];
            return;
        }
        
        CPUIModelUserInfo *coupleUserInfo = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:self.modelUserInfo.coupleAccount];
        if (coupleUserInfo) {
            SingleIndependentProfileViewController *single = [[SingleIndependentProfileViewController alloc] initWithUserInfo:coupleUserInfo];
            single.fromCoupleHeadPush = YES;
            [self.navigationController pushViewController:single animated:YES];
        }else {
            UserInforModel *userInfor = [[UserInforModel alloc] initUserInfor];
            userInfor.headerPath = self.modelUserInfo.selfCoupleHeaderImgPath;
            userInfor.nickName = self.modelUserInfo.coupleNickName;
            userInfor.fullName = self.modelUserInfo.fullName;
            userInfor.userName = self.modelUserInfo.coupleAccount;
            userInfor.telPhoneNumber = self.modelUserInfo.mobileNumber;
            AddContactWithProfileViewController *profile = [[AddContactWithProfileViewController alloc] initAddContactWithUserInfor:userInfor];
            [self.navigationController pushViewController:profile animated:YES];
        }      
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
-(NSInteger)returnOneOfEnumInUserRelationType:(NSString *)str
{
    if ([str isEqualToString:NSLocalizedString(@"Friend", nil)]) {
        return USER_RELATION_TYPE_COMMON;
    }else if ([str isEqualToString:NSLocalizedString(@"CloseFriend", nil)])
    {
        return USER_RELATION_TYPE_CLOSED;
    }else if ([str isEqualToString:NSLocalizedString(@"Lover", nil)]){
        return USER_RELATION_TYPE_LOVER;
    }else if([str isEqualToString:NSLocalizedString(@"Couple", nil)])
    {
        return USER_RELATION_TYPE_COUPLE;
    }else if([str isEqualToString:NSLocalizedString(@"Married", nil)])
    {
        return USER_RELATION_TYPE_MARRIED;
    }else {
        CPLogInfo(@"TargetRelationError");
        return -1;
    }
}
-(NSInteger)returnOneOfEnumInUpdateFriendType:(NSString *)str
{
    if ([str isEqualToString:NSLocalizedString(@"Friend", nil)]) {
        return FRIEND_CATEGORY_NORMAL;
    }else if ([str isEqualToString:NSLocalizedString(@"CloseFriend", nil)])
    {
        return FRIEND_CATEGORY_CLOSER;
    }else if ([str isEqualToString:NSLocalizedString(@"Lover", nil)]){
        return FRIEND_CATEGORY_LOVER;
    }else if([str isEqualToString:NSLocalizedString(@"Couple", nil)])
    {
        return FRIEND_CATEGORY_COUPLE;
    }else if([str isEqualToString:NSLocalizedString(@"Married", nil)])
    {
        return FRIEND_CATEGORY_MARRIED;
    }else {
        CPLogInfo(@"TargetRelationError");
        return -1;
    }
}
#pragma mark actionsheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *btnTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    

    if (self.modelUserInfo) {
        CPUIModelUserInfo *userInfo = self.modelUserInfo;        
        if ([btnTitle isEqualToString:NSLocalizedString(@"Delete", nil)])
        {
            userName = userInfo.name;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"聊天记录会被清空，确定要删除对方吗？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",@"取消", nil];
            alert.delegate = self;
            [alert show];
            
        }else if ([btnTitle isEqualToString:NSLocalizedString(@"Married", nil)] || [btnTitle isEqualToString:NSLocalizedString(@"Couple", nil)])
        {
            if ([userInfo.type integerValue] == USER_RELATION_TYPE_COUPLE || [userInfo.type integerValue] == USER_RELATION_TYPE_MARRIED) {
                [[CPUIModelManagement sharedInstance] modifyFriendTypeWithCategory:[self returnOneOfEnumInUpdateFriendType:btnTitle] andUserName:userInfo.name andInviteString:@"" andCouldExpose:YES]; 
                updateRelationType = [self returnOneOfEnumInUpdateFriendType:btnTitle];
                CustomAlertView *customAlert = [[CustomAlertView alloc] init];
                if (!self.loadingView) {
                    self.loadingView = [customAlert showLoadingMessageBox:@"稍等哦..." withTimeOut:TimeOut];
                }
            }else {
                ChooseCoupleTypeViewController *chooseCouple = [[ChooseCoupleTypeViewController alloc] initChooseCoupleTypeView:OtherChoose];
                [self.navigationController pushViewController:chooseCouple animated:YES];                
            }

        }else  if ([btnTitle isEqualToString:NSLocalizedString(@"Cancel", nil)])
        {
            
        }else {
            if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
                [[HPTopTipView shareInstance] showMessage:@"当前未连接网络，请联网后重试"];
            }else {
                userName = userInfo.name;
                if ([self returnOneOfEnumInUpdateFriendType:btnTitle] == FRIEND_CATEGORY_NORMAL || [self returnOneOfEnumInUpdateFriendType:btnTitle]== FRIEND_CATEGORY_CLOSER) {
                    NSArray *friendArray = [CPUIModelManagement sharedInstance].friendArray;
                    if ([self returnOneOfEnumInUpdateFriendType:btnTitle] == FRIEND_CATEGORY_NORMAL) {
                        NSInteger friendNumber = 0;
                        for (CPUIModelUserInfo *userInfo in friendArray) {
                            NSInteger userInfoTypeFriend = [userInfo.type integerValue];
                            if (userInfoTypeFriend == USER_RELATION_TYPE_COMMON || userInfoTypeFriend == USER_RELATION_TYPE_CLOSED || userInfoTypeFriend == USER_RELATION_TYPE_LOVER || userInfoTypeFriend == USER_RELATION_TYPE_MARRIED || userInfoTypeFriend == USER_RELATION_TYPE_COUPLE) {
                                if (friendNumber == 147) {
                                    [[HPTopTipView shareInstance] showMessage:@"人缘真好,好友已满148人啦"];
                                    return;
                                }else {
                                    friendNumber++;
                                }
                            }
                        }
                        
                    }else if([self returnOneOfEnumInUpdateFriendType:btnTitle] == FRIEND_CATEGORY_CLOSER)
                    {
                        NSInteger friendNumber = 0;
                        for (CPUIModelUserInfo *userInfo in friendArray) {
                            NSInteger userInfoTypeFriend = [userInfo.type integerValue];
                            if (userInfoTypeFriend == USER_RELATION_TYPE_CLOSED ) {
                                if (friendNumber == 16) {
                                    [[HPTopTipView shareInstance] showMessage:@"两三知己足矣，蜜友已满17人啦"];
                                    return;
                                }else {
                                    friendNumber++;
                                }
                            }
                        }
                        
                    }
                    
                }
                [[CPUIModelManagement sharedInstance] modifyFriendTypeWithCategory:[self returnOneOfEnumInUpdateFriendType:btnTitle] andUserName:userInfo.name andInviteString:@"" andCouldExpose:YES]; 
                updateRelationType = [self returnOneOfEnumInUpdateFriendType:btnTitle];
                CustomAlertView *customAlert = [[CustomAlertView alloc] init];
                if (!self.loadingView) {
                    self.loadingView = [customAlert showLoadingMessageBox:@"稍等哦..." withTimeOut:TimeOut];
                }
                 updateRelationTyped = [self returnOneOfEnumInUserRelationType:btnTitle];
            }
        }
       
    }else {
        CPLogInfo(@"messageGroupNil in other Actionsheet");
    }
    
}
#pragma mark AlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if (self.modelUserInfo) {
            if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
                [[HPTopTipView shareInstance] showMessage:@"当前未连接网络，请联网后重试"];
            }else {
                [[CPUIModelManagement sharedInstance] deleteFriendRelationWithUserName:self.modelUserInfo.name]; 
                CustomAlertView *customAlert = [[CustomAlertView alloc] init];
                if (!self.loadingView) {
                    self.loadingView = [customAlert showLoadingMessageBox:@"稍等哦..." withTimeOut:TimeOut];
                }
            }
        }else {
            CPLogInfo(@"messageGroupNil in other AlertView");
        }
    }
}
#pragma mark AudioDelegate
-(void)musicPlayer:(MusicPlayerManager *)player playToTime:(NSTimeInterval)time playerName:(NSString *)name
{

}
-(void)playAudioInSIngleIndependentProfile : (UIButton *)sender
{
    
    if (self.modelUserInfo) {
        CPUIModelUserInfo *userInfo = self.modelUserInfo;
        NSString *amrPath = userInfo.recentContent;
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
                
                if ([[MusicPlayerManager sharedInstance] isPlaying]) {
                    [[MusicPlayerManager sharedInstance] stop];
                    [self resetAudioLength];
                    [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
                    [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
                }else {
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
                
                if ([[NSFileManager defaultManager] fileExistsAtPath:wavPath]) {
                    if ([[MusicPlayerManager sharedInstance] isPlaying]) {
                        [[MusicPlayerManager sharedInstance] stop];
                        [self resetAudioLength];
                        [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
                        [sender setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
                    }else {
                        
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
-(void)musicPlayerDidFinishPlaying:(MusicPlayerManager *) player playerName:(NSString *)name{
    UIButton *btnAudio = (UIButton *)[self.view viewWithTag:btnAudioPlayTag];
    CPUIModelUserInfo *coupleInfo = [CPUIModelManagement sharedInstance].coupleModel;
    NSString *amrPath2 = coupleInfo.recentContent;
    NSString *couplePath;
    if (amrPath2) {
        couplePath = [[amrPath2 stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];
    }
    //重置时长
    [self resetAudioLength];
    if (self.modelUserInfo) {
        NSString *amrPath = self.modelUserInfo.recentContent;
        NSRange range = [amrPath rangeOfString:@"header"];
        NSString *friendAmrPath = [[amrPath substringToIndex:range.location+range.length] stringByAppendingPathComponent:@"friendPath"];
        NSString *wavPath = [[friendAmrPath stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];
        
        if ([name isEqualToString:wavPath] || [name isEqualToString:couplePath]) {
            [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
            [btnAudio setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
        }
    }
}
-(void)musicPlayerDecodeErrorDidOccur:(MusicPlayerManager *) player error:(NSError *)error playerName:(NSString *)name{
}
-(void)resetAudioLength
{
    if ([[MusicPlayerManager sharedInstance] isPlaying]) {
        [[MusicPlayerManager sharedInstance] stop];
        UIButton *btn = (UIButton *)[self.view viewWithTag:btnAudioPlayTag];
        if (btn) {
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted]; 
        }
    }
    
    
    
}
@end
