//
//  messageMainViewController.m
//  testSearchBar
//
//  Created by qing zhang on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//EMOJI 配置文件
#define EMOJI_CONFIG_FILE @"emoji.plist"
#import "messageMainViewController.h"


@interface messageMainViewController ()
{

    //拖动背景区域是否结束
    BOOL    isDragedEndMainBGView;
    CGFloat keybordChangeFloat;

}







@end

@implementation messageMainViewController
@synthesize mainBGView = _mainBGView, imageviewHeadImg = _imageviewHeadImg ,keybordHeight = _keybordHeight, singleProfileView = _singleProfileView,groupProfileView = _groupProfileView,
imageviewHeadImgBGView = _imageviewHeadImgBGView,IMView = _IMView,profileView = _profileView,unReadedAlert = _unReadedAlert,unCoupleReadedAlert = _unCoupleReadedAlert,
currentStatus = _currentStatus,   isMoved = _isMoved ,nickName = _nickName,buttonBack = _buttonBack , recentView = _recentView,loadingView = _loadingView,contactName = _contactName , animationIsPlayed = _animationIsPlayed , keybordView = _keybordView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(id)initWithStatus : (NSInteger)status;
{
    self = [super init];
    if (self) {
        keybordNeedResetFlag = NO;
        
        
      
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keybordWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];  
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnter) name:UIApplicationWillEnterForegroundNotification object:nil];
      
        
    }
    return self;
}
-(void)viewDidDisappear:(BOOL)animated
{


}
-(void)viewWillDisappear:(BOOL)animated
{
    if (!keybordNeedResetFlag && userInfoType != USER_MANAGER_SYSTEM && userInfoType != USER_MANAGER_XIAOSHUANG) {
   
//        if (self.currentStatus != message_view_Status_Down) {
            [self.keybordView clearText];
//            [self.keybordView reset];
//            [self.keybordView dismiss]; 
//            UIImageView *imageviewKeybord = (UIImageView *)[self.view viewWithTag:imageviewKeybordTag];
//            if (!imageviewKeybord) {
//                imageviewKeybord = [[UIImageView alloc] initWithFrame:CGRectMake(0, 399.5, 320, 60.5)];
//                imageviewKeybord.tag = imageviewKeybordTag;
//                [imageviewKeybord setImage:[UIImage imageNamed:@"im_keybord_ios"]];
//                [self.view addSubview:imageviewKeybord];                            
//            }

//        }
        if (self.currentStatus == message_view_Status_up) {
            UIImageView *imageviewKeybord = (UIImageView *)[self.view viewWithTag:imageviewKeybordTag];
            if (!imageviewKeybord) {
                imageviewKeybord = [[UIImageView alloc] initWithFrame:CGRectMake(0, 460-keybordChangeFloat-61, 320, 61)];
                imageviewKeybord.tag = imageviewKeybordTag;
                [imageviewKeybord setImage:[UIImage imageNamed:@"im_keybord_ios"]];
                [self.view addSubview:imageviewKeybord];
            }
        }
    }    
}
-(void)closeKeybordView
{
   
}
-(void)viewWillAppear:(BOOL)animated
{
//    if (!keybordNeedResetFlag) {
//        if (self.currentStatus != message_view_Status_Down) {
//            UIImageView *imageviewKeybord = (UIImageView *)[self.view viewWithTag:imageviewKeybordTag];
//            if (!imageviewKeybord) {
//                imageviewKeybord = [[UIImageView alloc] initWithFrame:CGRectMake(0, 399.5f, 320.f, 60.5f)];
//                imageviewKeybord.tag = imageviewKeybordTag;
//                [imageviewKeybord setImage:[UIImage imageNamed:@"im_keybord_ios"]];
//                [self.view addSubview:imageviewKeybord];                            
//            }
//        }
//    }
    
    if (!keybordNeedResetFlag && userInfoType != USER_MANAGER_SYSTEM && userInfoType != USER_MANAGER_XIAOSHUANG) {
        if (self.currentStatus != message_view_Status_Down) {
            [self.keybordView reset];
            [self.keybordView setFrame:CGRect_whenKeybordViewd];
            //[self.keybordView show];
            [self.keybordView showInView:self.view];
        }
        UIImageView *imageviewKeybord = (UIImageView *)[self.view viewWithTag:imageviewKeybordTag];
        if (imageviewKeybord) {
            [imageviewKeybord removeFromSuperview];
        }
    }
    keybordNeedResetFlag = NO;
}
-(void)viewDidAppear:(BOOL)animated
{   
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
    //下面需要用到键盘高度，提前初始化
    //self.keybordView = [[KeyboardView alloc] initWithFrame:CGRectMake(0, 503/2, 320, 460)];
    self.keybordView = [KeyboardView sharedKeyboardView];
    
    self.view.multipleTouchEnabled = NO;
    self.view.exclusiveTouch = YES;
    isShakeEnded = YES;
    //logo背景图
    UIImageView *imageviewBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320.f, 194/2)];
    [imageviewBackground setImage:[UIImage imageNamed:@"bg_profileeeee.jpg"]];
    [self.view addSubview:imageviewBackground];
    
    
    //背景区域，背景图+个人profile
    self.mainBGView = [[UIView alloc] initWithFrame:CGRect_mainBGViewInStatusMid];
    self.mainBGView.backgroundColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.0];;
    [self.view addSubview:self.mainBGView];
    
    
    
    self.imageviewHeadImg = [[MSHeadView alloc] init];
    [self.imageviewHeadImg setBorderWidth:5.f];
    self.imageviewHeadImg.touchDelegate = self;
    [self.imageviewHeadImg setFrame:CGRectMake(320-imageviewSingleHeadImageInStatusMid-26.5,imageviewUpBGInStatusMid-imageviewSingleHeadImageInStatusMid+21.f , imageviewSingleHeadImageInStatusMid, imageviewSingleHeadImageInStatusMid)]; 
    [self.imageviewHeadImg addTarget:self action:@selector(pressHeadImg) forControlEvents:UIControlEventTouchUpInside];
    [self.imageviewHeadImg setCycleImage:[UIImage imageNamed:@"headpic_im_120x120.png"]];
    
    //NSInteger status = 2;
    
    //profile区域
//    if (status == 3) {
//        self.currentStatus = 3;
//        //IM区域
//        self.IMView = [[UIView alloc] initWithFrame:CGRect_IMViewInStatusDown];
//        self.IMView.backgroundColor = [UIColor yellowColor];
//        [self.view addSubview:self.IMView];
//        
//        UIImageView *imageviewIMBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_im_couple.png"]];
//        [imageviewIMBG setFrame:CGRectMake(0, 0, 320, self.IMView.frame.size.height)];
//        imageviewIMBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [self.IMView addSubview:imageviewIMBG];
//        
//        //头像下面的横条
//        self.imageviewHeadImgBGView = [[UIImageView alloc] initWithFrame:CGRect_imageviewHeadImgBGViewInStatusDown];
//        self.imageviewHeadImgBGView.backgroundColor = [UIColor clearColor];
//        //self.imageviewHeadImgBGView.backgroundColor = [UIColor orangeColor];
//        [self.imageviewHeadImgBGView setImage:[UIImage imageNamed:@"bg_im_couple_top00.png"]];
//        //self.imageviewHeadImgBGView.alpha = 0.6f;
//        [self.view addSubview:self.imageviewHeadImgBGView];
//        
//        
//        //头像
//        [self.imageviewHeadImg setFrame:CGRect_imageviewHeadImgInStatusDown];
        ////2012.8.15修改
        //[[FXEditContainer shareInstance] setFrame:CGRectMake(CGRect_editpanel.origin.x, 460-self.keybordHeight+10, CGRect_editpanel.size.width, CGRect_editpanel.size.height)];
//    }
    //正常区域
//    else if (status == 2)
 //   {
        self.currentStatus = 2;
        //2012.8.15修改
        //[[FXEditContainer shareInstance] setFrame:CGRectMake(CGRect_editpanel.origin.x, 460-self.keybordHeight-CGRect_editpanel.size.height, CGRect_editpanel.size.width, CGRect_editpanel.size.height)];            
        
   
        
   
        
 
        
        

        
        
        
//    }


    //键盘输入区
    //2012.8.15修改
    //            [[FXEditContainer shareInstance] doResetEditContainer];
    //        if (![self.view.subviews containsObject:[FXEditContainer shareInstance]]) {
    //            [[FXEditContainer shareInstance] setDelegate:self];
    //            [self.view addSubview:[FXEditContainer shareInstance]];            
    //        }
    
    
    //昵称
    self.nickName = [[UILabel alloc] initWithFrame:CGRect_nickNameInStatusMid];
    self.nickName.textColor = [UIColor whiteColor];
    self.nickName.textAlignment = UITextAlignmentRight;
    self.nickName.shadowColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.75f];
    self.nickName.shadowOffset = CGSizeMake(0.f, 1.f);
    self.nickName.font = [UIFont boldSystemFontOfSize:15.f];
    self.nickName.backgroundColor = [UIColor clearColor];
    [self.nickName setFrame:CGRect_nickNameInStatusMid];
    [self.view addSubview:self.nickName];  
    
    //通讯录姓名
    self.contactName = [[UILabel alloc] initWithFrame:CGRect_contactNameInStatusDown];
    self.contactName.textColor = [UIColor colorWithRed:201/255.f green:201/255.f blue:201/255.f alpha:1.0];
    self.contactName.textAlignment = UITextAlignmentRight;
    self.contactName.font = [UIFont systemFontOfSize:10.f];
    self.contactName.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:self.contactName belowSubview:self.IMView];
    self.contactName.hidden = YES;
    

    
    //IM区域
    
    self.IMView = [[UIView alloc] initWithFrame:CGRect_IMViewInStatusMid];
    
    self.IMView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.IMView];

    UIImageView *imageviewIMBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_im_couple.png"]];
    [imageviewIMBG setFrame:CGRectMake(0, 0, 320, self.IMView.frame.size.height)];
    imageviewIMBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.IMView addSubview:imageviewIMBG];
    
    //头像下面的横条
    self.imageviewHeadImgBGView = [[UIImageView alloc] initWithFrame:CGRect_imageviewHeadImgBGViewInStatusMid];
    self.imageviewHeadImgBGView.backgroundColor = [UIColor clearColor];
    [self.imageviewHeadImgBGView setImage:[UIImage imageNamed:@"bg_im_couple_top00.png"]];
    [self.view addSubview:self.imageviewHeadImgBGView];
    
    //头像
    [self.view addSubview:self.imageviewHeadImg];
    
    //键盘
    self.keybordView.backgroundColor = [UIColor clearColor];
    
    self.keybordView.delegate = self;
    //[self.view addSubview:self.keybordView];
    
    //返回按钮
    self.buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonBack setFrame:CGRectMake(0.f, 0.f, 60.f, 60.f)];
    [self.buttonBack addTarget:self action:@selector(backToHome:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonBack];
    

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(void)applicationDidEnter
{
    NSLog(@"%@",self.view);
    if (self.isMoved) {
        [self reBoundByCurrentStatus];    
    }
    
}
-(void)keybordWillDisappear:(NSNotification *)notification
{
    keybordChangeFloat = 0;
}
- (void)keyboardWillShow:(NSNotification *)notification  
{  
    //2012.8.15修改
//    FXEditPanel *panel = [[FXEditContainer shareInstance].subviews objectAtIndex:0];
//    for (FXEditAera *aera in panel.subviews) {
//        if ([aera isMemberOfClass:[FXEditAera class]]) {
//            for (HPGrowingTextView *textView in aera.subviews) {
//                if ([textView isMemberOfClass:[HPGrowingTextView class]]) {
//                    //HPTextViewInternal *textInternal = (HPTextViewInternal *)[textView.subviews objectAtIndex:0];
//                    UITextView *text = [textView.subviews objectAtIndex:0];
//                    if ([text isFirstResponder]) {
//                        NSDictionary *info = [notification userInfo];
//                        
//                        CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;  
//                    
//                        CGRect rectIM = self.IMView.frame;
//                        if (keybordChangeFloat != 0) {
//                        [self.IMView setFrame:CGRectMake(rectIM.origin.x, rectIM.origin.y,rectIM.size.width, rectIM.size.height-(kbSize.height-keybordChangeFloat))];    
//                        }
//                        keybordChangeFloat = kbSize.height;
//                    }
//                    
//                }
//            }
//
//        }
//
//    }
   


        NSDictionary *info = [notification userInfo];
        
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;  
        keybordChangeFloat = kbSize.height;
        if (keybordViewed) {
            if (kbSize.height <= 216) {
                [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y+imageviewHeadImageBGViewInStatusMid, CGRect_IMViewInStatusUp.size.width, 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y-imageviewHeadImageBGViewInStatusMid-46-210.f)];                    
                
            }else {
                [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y+imageviewHeadImageBGViewInStatusMid, CGRect_IMViewInStatusUp.size.width, 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y-imageviewHeadImageBGViewInStatusMid-46-245.f)];                                        
                
            }
        }
                    
                    
    
                
      
 
    
    
}  
#pragma mark method

-(void)pressHeadImg
{

//    switch (self.currentStatus) {
//        case message_view_Status_up:
//        {
//            [self changeStatusBySwipeLevel:1];
//        }
//            break;
//        case message_view_Status_Middle:
//        {
//            [self changeStatusBySwipeLevel:2];
//        }
//            break;
//        case message_view_Status_Down:
//        {
//            [self changeStatusBySwipeLevel:2];
//        }
//            break;
//        default:
//        {
//        }
//            break;
//    }
}

-(void)changeButtonImageByStatus : (NSInteger)btnStatus
{
    switch (btnStatus) {
        case Btn_Back_IM:
        {
            [self.buttonBack setBackgroundImage:[UIImage imageNamed:@"btn_backmsgwall.png"] forState:UIControlStateNormal];
            [self.buttonBack setBackgroundImage:[UIImage imageNamed:@"btn_backmsgwall_press.png"] forState:UIControlStateHighlighted];
            self.buttonBack.tag = Btn_Back_IM;
        }
            break;
        case Btn_Back_Couple:
        {
            [self.buttonBack setBackgroundImage:[UIImage imageNamed:@"btn_home.png"] forState:UIControlStateNormal];
            [self.buttonBack setBackgroundImage:[UIImage imageNamed:@"btn_home_press.png"] forState:UIControlStateHighlighted];
            self.buttonBack.tag = Btn_Back_Couple;
        }
            break;
        case Btn_Back_ProfileTag:
        {
            [self.buttonBack setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_back.png"] forState:UIControlStateNormal];
            [self.buttonBack setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_backpress.png"] forState:UIControlStateHighlighted];
            self.buttonBack.tag = Btn_Back_ProfileTag;
        }
            break;
        default:
            break;
    }
}
//显示或隐藏头部近况和昵称部分
-(void)changeStatusForNickNameAndRecent : (BOOL)isChanged :(CGRect)nickNameFrame
{
    if (isChanged) {
        [self.nickName setHidden:YES];
        //[self.nickName setFrame:CGRectMake(320-195.f, 460-55.f, 88.f , 14.f)];
    }else {
        [self.nickName setFrame:nickNameFrame];
        [self.nickName setHidden:NO];        
    }
    if (self.currentStatus == message_view_Status_Middle) {
        self.recentView.hidden = NO;
    }else {
        self.recentView.hidden = YES;
    }
}
//显示BGview的隐藏部分，目前未用到
-(void) scrolledViewWhenNeedViewTopView 
{
    self.currentStatus = 3;
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [self setFrameWhenAnimationed:3];
    //[self.mainBGView setFrame:CGRectMake(0, 0, 320.f, 510.f)];
    [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusDown];
    
    [UIView commitAnimations];
    
}
//隐藏BGView的显示部分，目前未用到
-(void) scrolledViewWhenNeedHideTopView 
{
    self.currentStatus = 1;
}
//判断点击区域在哪个区域
/****
 return 1 :B区
 return 2 :A区
 return 0 :其他区域，目前其他区域全部不接受点击
 ****/
-(NSInteger) isInUpBGRectOrInHeadImgRect : (CGPoint)tapPoint
{
    switch (self.currentStatus) {
        case message_view_Status_up:
        {
            if (CGRectContainsPoint(CGRect_imageviewHeadImgInStatusUp, tapPoint) || CGRectContainsPoint(CGRect_imageviewHeadImgBGViewInStatusUp, tapPoint)) {
                return 2;
            }else if (CGRectContainsPoint(CGRectMake(0, 0, 320, imageviewHeadImageInStatusMid-20.f), tapPoint)){
                return 1;
            }
        }
            break;
        case message_view_Status_Middle:
        {

            if (CGRectContainsPoint(CGRect_imageviewHeadImgInStatusMid, tapPoint) || CGRectContainsPoint(CGRect_imageviewHeadImgBGViewInStatusMid, tapPoint)) {
                if (self.imageviewHeadImg.hidden && self.imageviewHeadImgBGView.hidden) {
                    return 0;
                }else {
                    return 2;
                }
            }else if (CGRectContainsPoint(CGRectMake(0, 0, 320, imageviewUpBGInStatusMid), tapPoint))
            {
                return 1;
            }                
        }
            break;
        case message_view_Status_Down:
        {
            if (CGRectContainsPoint(CGRect_imageviewHeadImgBGViewInStatusDown, tapPoint) || CGRectContainsPoint(CGRect_imageviewHeadImgInStatusDown, tapPoint)) {
                return 2;
            }else {
                return 1;
            }
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
    return 0;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/****
 statusMid:  拖动a时:上：B不动，A上移，C上移
 下：B下移，A下移，C下移
 拖动b时：上：没动作
 下：B下移，A下移，C下移  
 statusUp：  拖动a时：下：b不动，A下移，当进入statusMid时开始statusMid时的动作
 拖动B时：下：与拖动a一样
 statusDown： 拖动a时：上：b先不动，a上移，结果需要b隐藏100px时a刚好到statusMid时
 拖动B  ：无反应
 ****/
//1为UpView需要显示隐藏部分，2为upView需要隐藏显示部分，3为UpView不变
-(void) setFrameWhenDraged : (NSInteger)type : (CGFloat)offsetValue
{
    //偏移值都做减速 1.5倍处理
    if (type == 1) {
//        CGRect frameUpView = self.mainBGView.frame;
//        frameUpView.origin.y = -upHidedPartInStatusMid - offsetValue/1.5f;
//        self.mainBGView.frame = frameUpView;
        CGRect frameUpView = self.profileView.imageviewBGInMainView.frame;
        frameUpView.origin.y = -upHidedPartInStatusMid - offsetValue/1.5f;
        self.profileView.imageviewBGInMainView.frame = frameUpView;
    }else if (type ==2)
    {
        
//        CGRect frameUpView = self.mainBGView.frame;
//        frameUpView.origin.y = 0 - offsetValue/1.5f;
//        self.mainBGView.frame = frameUpView;
        CGRect frameUpView = self.profileView.imageviewBGInMainView.frame;
        frameUpView.origin.y = 0 - offsetValue/1.5f;
        self.profileView.imageviewBGInMainView.frame = frameUpView;
    }
    
}
//
//1:dragA区域触发，2：dragB区域触发 ，needMinusOffsetValueForChangeStatus尽在B区域有效 YES为拖动B从statusUP下来，NO为拖动B从statusMid下来
//3:在statusDown时dragB区触发
- (void) scrolledViewWhenMainBGViewDraged : (CGFloat)offsetValue :(NSInteger)dragedView : (BOOL)needMinusOffsetValueForChangeStatus
{
    
    if (dragedView == 1) {
        CGRect frameHeadImg = self.imageviewHeadImg.frame;
        frameHeadImg.origin.y =   -offsetValue;
        [self.imageviewHeadImg setFrame:frameHeadImg];    
        
        CGRect frameHeadImgBGView = self.imageviewHeadImgBGView.frame;
        frameHeadImgBGView.origin.y = imageviewHeadImageInStatusMid - imageviewHeadImageBGViewInStatusMid- offsetValue;
        [self.imageviewHeadImgBGView setFrame:frameHeadImgBGView];
        
        CGRect frameImView = self.IMView.frame;
        frameImView.origin.y = imageviewHeadImageInStatusMid - offsetValue;
        [self.IMView setFrame:frameImView]; 
        
        //偏移值大于BGview的隐藏部分就取消BGView的移动
        if ((-offsetValue-offsetValueForChangeStatus)/1.5f<51.f) {
            CGRect frameUpView = self.profileView.imageviewBGInMainView.frame;
            frameUpView.origin.y = -upHidedPartInStatusMid+(- offsetValue-offsetValueForChangeStatus)/1.5f;
            self.profileView.imageviewBGInMainView.frame = frameUpView;               
        }
        
       // if (-offsetValue > 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y - CGRect_imageviewHeadImgBGViewInStatusUp.size.height - CGRect_editpanel.size.height) {
         if (-offsetValue > CGRect_editpanel.origin.y-CGRect_imageviewHeadImgInStatusUp.origin.y - CGRect_imageviewHeadImgInStatusUp.size.height) {
            CGRect frameKeybordView = self.keybordView.frame;
            frameKeybordView.origin.y = keybordPointY-offsetValue - CGRect_editpanel.origin.y + CGRect_imageviewHeadImgInStatusUp.origin.y + CGRect_imageviewHeadImgInStatusUp.size.height; 
            [self.keybordView setFrame:frameKeybordView];

            //2012.8.15修改
        }
        
    }else if (dragedView == 2 && offsetValue<=0)
    {
        
        CGFloat offsetValueOfDragedB;
        //如果是从statusUp拖动的话需要减去开始改变状态时的偏移值，如果直接从statusMid时的话则不用，达到path效果需要做减速处理
        if (needMinusOffsetValueForChangeStatus) {
            offsetValueOfDragedB = -offsetValue - offsetValueForChangeStatus;
        }else 
        {
            offsetValueOfDragedB = -offsetValue;
        }


        CGRect frameHeadImg = self.imageviewHeadImg.frame;
        //frameHeadImg.origin.y = offsetValueForChangeStatus+  offsetValueOfDragedB/3.0f;
        frameHeadImg.origin.y = imageviewUpBGInStatusMid + imageviewHeadImageBGViewInStatusMid - imageviewHeadImageInStatusMid +offsetValueOfDragedB/3.f;
        [self.imageviewHeadImg setFrame:frameHeadImg];    
        
        CGRect frameHeadImgBGView = self.imageviewHeadImgBGView.frame;
        //frameHeadImgBGView.origin.y = imageviewHeadImageInStatusMid - imageviewHeadImageBGViewInStatusMid+offsetValueForChangeStatus+ offsetValueOfDragedB/3.0f;
        frameHeadImgBGView.origin.y = imageviewUpBGInStatusMid +offsetValueOfDragedB/3.f;
        [self.imageviewHeadImgBGView setFrame:frameHeadImgBGView];
        
        CGRect frameImView = self.IMView.frame;
//        frameImView.origin.y = imageviewHeadImageInStatusMid +offsetValueForChangeStatus+ offsetValueOfDragedB/3.0f;                
        frameImView.origin.y = imageviewUpBGInStatusMid + imageviewHeadImageBGViewInStatusMid + offsetValueOfDragedB/3.0f;
        [self.IMView setFrame:frameImView]; 
        
        if (offsetValueOfDragedB/4.5 >= 50.f) {
            
            CGRect frameUpView = self.mainBGView.frame;
            //     frameUpView.origin.y = -upHidedPartInStatusMid+offsetValueOfDragedB/4.5f;
            frameUpView.origin.y = offsetValueOfDragedB/4.5-50;
            self.mainBGView.frame = frameUpView;  
       
        }else {
            CGRect frameImageviewBGInMainView = self.profileView.imageviewBGInMainView.frame;
            frameImageviewBGInMainView.origin.y = -upHidedPartInStatusMid+offsetValueOfDragedB/4.5f;
            self.profileView.imageviewBGInMainView.frame = frameImageviewBGInMainView;                 
        }

      
    }else if (dragedView == 3)
    {
        CGRect frameUpView = self.mainBGView.frame;
        frameUpView.origin.y = -offsetValue/4.5f;
        self.mainBGView.frame = frameUpView;    
//        CGRect frameUpView = self.profileView.imageviewBGInMainView.frame;
//        frameUpView.origin.y = -offsetValue/4.5f;
//        self.profileView.imageviewBGInMainView.frame = frameUpView;    
    }
}
//任何操作都会移动头像，头像下的横条，和IM区域，此函数即当需要调用的时候用的
- (void) scrolledViewWhenViewDraged : (CGFloat)offsetValue
{
    switch (self.currentStatus) {
        case message_view_Status_up:
        {
            CGRect frameHeadImg = self.imageviewHeadImg.frame;
            frameHeadImg.origin.y =   -offsetValue;
            [self.imageviewHeadImg setFrame:frameHeadImg];    
            
            CGRect frameHeadImgBGView = self.imageviewHeadImgBGView.frame;
            frameHeadImgBGView.origin.y = imageviewHeadImageInStatusMid - imageviewHeadImageBGViewInStatusMid- offsetValue;
            [self.imageviewHeadImgBGView setFrame:frameHeadImgBGView];
            
            CGRect frameImView = self.IMView.frame;
            frameImView.origin.y = imageviewHeadImageInStatusMid - offsetValue;
            //如果向上拖动加大IM区域
            if (offsetValue > 0) {
                if (userInfoType == USER_MANAGER_XIAOSHUANG || userInfoType == USER_MANAGER_SYSTEM) {
                    frameImView.size.height = CGRect_IMViewInStatusUp.size.height + offsetValue*1.05 + 56.f;    
                }else {
                    frameImView.size.height = CGRect_IMViewInStatusUp.size.height + offsetValue*1.05;    
                }
                
            }
            [self.IMView setFrame:frameImView]; 
        }
            break;
        case message_view_Status_Middle:
        {
            CGRect frameHeadImg = self.imageviewHeadImg.frame;
            frameHeadImg.origin.y = imageviewUpBGInStatusMid-imageviewHeadImageInStatusMid+imageviewHeadImageBGViewInStatusMid  - offsetValue;
            [self.imageviewHeadImg setFrame:frameHeadImg];    
            
            CGRect frameHeadImgBGView = self.imageviewHeadImgBGView.frame;
            frameHeadImgBGView.origin.y = CGRect_imageviewHeadImgBGViewInStatusMid.origin.y - offsetValue;
            [self.imageviewHeadImgBGView setFrame:frameHeadImgBGView];
            
            CGRect frameImView = self.IMView.frame;
            frameImView.origin.y = CGRect_imageviewHeadImgBGViewInStatusMid.origin.y+imageviewHeadImageBGViewInStatusMid - offsetValue;
            //当BGview的偏移值小于隐藏的部分则一直向下移动B，做减速1.5倍处理
            if (offsetValue < 0 && offsetValue/1.5f >= -upHidedPartInStatusMid) {
                [self setFrameWhenDraged:1 :offsetValue];
            }
            //if (-offsetValue >460-imageviewUpBGInStatusMid-imageviewHeadImageBGViewInStatusMid-CGRect_editpanel.size.height) {
            if (-offsetValue > CGRect_editpanel.origin.y - CGRect_imageviewHeadImgInStatusMid.origin.y - CGRect_imageviewHeadImgInStatusMid.size.height) {
                //2012.8.15修改
//                CGRect frameEditpanel = [FXEditContainer shareInstance].frame;
//                frameEditpanel.origin.y = CGRect_editpanel.origin.y +(-offsetValue-(460-imageviewUpBGInStatusMid-imageviewHeadImageBGViewInStatusMid-CGRect_editpanel.size.height));
//                [FXEditContainer shareInstance].frame = frameEditpanel;
                CGRect frameKeybordView = self.keybordView.frame;
                frameKeybordView.origin.y = keybordPointY-offsetValue - CGRect_editpanel.origin.y + CGRect_imageviewHeadImgInStatusMid.origin.y + CGRect_imageviewHeadImgInStatusMid.size.height; 
                [self.keybordView setFrame:frameKeybordView];
            }else if(offsetValue > 0){
                //如果向上拖动加大IM区域
                if (self.keybordView.hidden) {
                    frameImView.size.height = CGRect_IMViewInStatusMid.size.height +offsetValue*1.05 + CGRect_editpanel.size.height;
                }else {
                    frameImView.size.height = CGRect_IMViewInStatusMid.size.height +offsetValue*1.05;
                }
                

            }
            [self.IMView setFrame:frameImView];
        }
            break;
        case message_view_Status_Down:
        {
            CGRect frameHeadImg = self.imageviewHeadImg.frame;
            frameHeadImg.origin.y = 460-imageviewHeadImageInStatusMid  - offsetValue;
            [self.imageviewHeadImg setFrame:frameHeadImg];    
            
            CGRect frameHeadImgBGView = self.imageviewHeadImgBGView.frame;
            frameHeadImgBGView.origin.y =  460-imageviewHeadImageBGViewInStatusMid - offsetValue;
            [self.imageviewHeadImgBGView setFrame:frameHeadImgBGView];
            
            CGRect frameImView = self.IMView.frame;
            frameImView.origin.y = 460 - offsetValue;
            frameImView.size.height = CGRect_IMViewInStatusMid.size.height +offsetValue;
            [self.IMView setFrame:frameImView];
            
            //当偏移值大于指定的临界值时，开始隐藏BGView，也做减速1.5倍处理，给BGView传入的位移值需要减去开始移动的临界值
            if (offsetValue >= offsetValueForDragImageviewHeadInStatusDown && (offsetValue-offsetValueForDragImageviewHeadInStatusDown)/1.5f <= upHidedPartInStatusMid) {
                
                [self setFrameWhenDraged:2 :offsetValue - offsetValueForDragImageviewHeadInStatusDown];
            }
            //移动键盘
            if (offsetValue > 0 && offsetValue <= CGRect_editpanel.size.height + xiaoshuangNeedHidedHeight ) {
                //2012.8.15修改                
//                CGRect frameEditpanel = [FXEditContainer shareInstance].frame;
//                frameEditpanel.origin.y = 460-self.keybordHeight-offsetValue+10;
//                [FXEditContainer shareInstance].frame = frameEditpanel;

                CGRect frameKeybordView = self.keybordView.frame;
                frameKeybordView.origin.y = CGRect_whenKeybordHided.origin.y - offsetValue;
                [self.keybordView setFrame:frameKeybordView];
            }
        }
            break;
        default:
            break;
    }
    
}
//1为靠上，2为靠下 按照up，mid，down这个关系排列，仅在touchend后根据不同的状态移动，为不同的动作加入不同的动画时间已便使动画流畅，
//如果效果还不行只能用core motaion来用临时速度算
/****
 ** Apr21加入盲区，大小为120px，只在up和down状态时要到相反状态有用，（未最终确定！）
 
 statusMid时:上滑动>=120px时会进入statusUp
 下滑动>=120px时会进入statusDown
 statusUp时：下滑动>=40并且<120会进入statusMid
 下滑动>=120时进入statusDown
 statusDown时：上滑动 >= 40并且<120会进入statusMid
 上滑动 >=120进入statusUp
 ****/
- (void)changeStatusBySwipeLevel : (NSInteger)swipeLevel
{
    
    switch (self.currentStatus) {
        case message_view_Status_up:
        {
            if (swipeLevel == 1) {
                [self setFrameWhenAnimationed:2]; 
                self.currentStatus = 2;
              
            }else if(swipeLevel == 2)
            {

                //[self setFrameWhenAnimationed:3];
                self.currentStatus = 3;
                 [self setFrameWhenScrollToEnd];
            }
        }
            break;
        case message_view_Status_Middle:
        {
            if (swipeLevel == 1) {
                //[self setFrameWhenAnimationed:1];
                self.currentStatus = 1;
                [self setFrameWhenScrollToEnd];
              
            }else if (swipeLevel == 2)
            {
                //[self setFrameWhenAnimationed:3];
                self.currentStatus = 3;
                [self setFrameWhenScrollToEnd];
            }
        }
            break;
        case message_view_Status_Down:
        {
            if (swipeLevel == 1) {

                //[self setFrameWhenAnimationed:1];
                self.currentStatus = 1;
                 [self setFrameWhenScrollToEnd];
             
            }else if(swipeLevel == 2) {
                [self setFrameWhenAnimationed:2];
                self.currentStatus = 2;
             
            }
        }
            break;
        default:
            break;
    }

    
}
//回弹
/****
 statusMid:上下滑动距离<120px会回弹
 statusUp:下滑动<40会回弹
 statusDown:上滑动<40会回弹
 ****/
- (void)reBoundByCurrentStatus
{

    switch (self.currentStatus) {
        case message_view_Status_up:
        {
            [self setFrameWhenAnimationed:1];

        }
            break;
        case message_view_Status_Middle:
        {
            
            [self setFrameWhenAnimationed:2];

        }
            break;
        case message_view_Status_Down:
        {
            [self setFrameWhenAnimationed:3];
        }
            break;
        default:
            break;
    }

}
//到两边的回弹效果
-(void)setFrameWhenScrollToEnd
{
    [UIView beginAnimations:@"beginReBound" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //[UIView setAnimationDelay:0.05f];
    [UIView setAnimationDuration:0.15f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    switch (self.currentStatus) {
        case message_view_Status_up:
        {

            [self.imageviewHeadImgBGView setFrame:CGRectMake(CGRect_imageviewHeadImgBGViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y - imageviewHeadImageInStatusMid/2.f, CGRect_imageviewHeadImgBGViewInStatusUp.size.width, CGRect_imageviewHeadImgBGViewInStatusUp.size.height)];
            [self.imageviewHeadImg setFrame:CGRectMake(CGRect_imageviewHeadImgInStatusUp.origin.x, CGRect_imageviewHeadImgInStatusUp.origin.y - imageviewHeadImageInStatusMid/2.f,self.imageviewHeadImg.frame.size.width,self.imageviewHeadImg.frame.size.height)];
            //CGRect_imageviewHeadImgInStatusUp.size.width, CGRect_imageviewHeadImgInStatusUp.size.height)];
            //[self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y - imageviewHeadImageInStatusMid/2.f+CGRect_imageviewHeadImgBGViewInStatusUp.size.height, CGRect_IMViewInStatusUp.size.width, CGRect_IMViewInStatusUp.size.height+imageviewHeadImageInStatusMid+100)];
            [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, self.imageviewHeadImgBGView.frame.origin.y+self.imageviewHeadImgBGView.frame.size.height, CGRect_IMViewInStatusUp.size.width, CGRect_IMViewInStatusUp.size.height+imageviewHeadImageInStatusMid+20)];
            [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusMid];
            
            if (!keybordViewed) {
            [self.keybordView setFrame:CGRect_whenKeybordViewd];
            //[[FXEditContainer shareInstance] setFrame:CGRect_editpanel];                
            }
            
            
            //self.buttonBack.hidden = YES;
            
        }
            break;
        case message_view_Status_Down:
        {
            [self.imageviewHeadImgBGView setFrame:CGRectMake(CGRect_imageviewHeadImgBGViewInStatusDown.origin.x, CGRect_imageviewHeadImgBGViewInStatusDown.origin.y + imageviewHeadImageInStatusMid/2.f,CGRect_imageviewHeadImgBGViewInStatusDown.size.width, CGRect_imageviewHeadImgBGViewInStatusDown.size.height)];
            [self.imageviewHeadImg setFrame:CGRectMake(CGRect_imageviewHeadImgInStatusDown.origin.x, CGRect_imageviewHeadImgInStatusDown.origin.y + imageviewHeadImageInStatusMid/2.f, 
            self.imageviewHeadImg.frame.size.width,self.imageviewHeadImg.frame.size.height)];
            //CGRect_imageviewHeadImgInStatusDown.size.width, CGRect_imageviewHeadImgInStatusDown.size.height)];
            [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusDown.origin.x, CGRect_IMViewInStatusDown.origin.y + imageviewHeadImageInStatusMid/2.f, CGRect_IMViewInStatusDown.size.width, CGRect_IMViewInStatusDown.size.height)];
            //[self.mainBGView setFrame:CGRectMake(0, 0, 320, 510.f)];
            [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusDown];

            //2012.8.15修改
            //[[FXEditContainer shareInstance] setFrame:CGRectMake(CGRect_editpanel.origin.x, 460-self.keybordHeight+10, CGRect_editpanel.size.width, CGRect_editpanel.size.height)];
            [self.keybordView setFrame:CGRect_whenKeybordHided];
        }
            break;
            
        default:
            break;
    }
    [UIView commitAnimations];
}
//1:设置topFrame，2设置middleFrame，3设置BottomFrame，也只会在touchend后会用到，即切换3中状态时的布局位置
-(void) setFrameWhenAnimationed : (NSUInteger)type
{
    
    self.view.userInteractionEnabled = YES;
    self.currentStatus = type;
    switch (type) {
        case 1:
        {
            //[self.recentView setHidden:YES];
            [self changeStatusForNickNameAndRecent:NO :CGRect_nickNameInStatusUp];
            self.contactName.hidden = YES;
            [UIView beginAnimations:@"anima" context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            [UIView setAnimationDuration:0.1f];

            [self.imageviewHeadImgBGView setFrame:CGRect_imageviewHeadImgBGViewInStatusUp];
            [self.imageviewHeadImg setFrame:CGRect_imageviewHeadImgInStatusUp];
            
            //[self.mainBGView setFrame:CGRect_mainBGViewInStatusMid]; 
            [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusMid];
            
            if (keybordViewed) {

            //2012.8.15
//                if (CGRect_editpanel.size.height+self.keybordHeight < 310) {
//                [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y+imageviewHeadImageBGViewInStatusMid, CGRect_IMViewInStatusUp.size.width, 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y-imageviewHeadImageBGViewInStatusMid-274.f)];
//                }else {
//                [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y+imageviewHeadImageBGViewInStatusMid, CGRect_IMViewInStatusUp.size.width, 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y-imageviewHeadImageBGViewInStatusMid-310.f)];                     
//                }  

                if (keybordChangeFloat <= 216 && keybordChangeFloat != 0) {
                    [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y+imageviewHeadImageBGViewInStatusMid, CGRect_IMViewInStatusUp.size.width, 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y-imageviewHeadImageBGViewInStatusMid-46-210.f)]; 
                }else {
                    [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_imageviewHeadImgBGViewInStatusUp.origin.y+imageviewHeadImageBGViewInStatusMid, CGRect_IMViewInStatusUp.size.width, 460-CGRect_imageviewHeadImgBGViewInStatusUp.origin.y-imageviewHeadImageBGViewInStatusMid-46-248.f)];                                        
                }
            }else {
                if (userInfoType == USER_MANAGER_SYSTEM || userInfoType == USER_MANAGER_XIAOSHUANG) {
                    [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusUp.origin.x, CGRect_IMViewInStatusUp.origin.y, 320, 460-CGRect_IMViewInStatusUp.origin.y)];  
                }else {
                    [self.IMView setFrame:CGRect_IMViewInStatusUp];
                }
            
            //2012.8.15修改
            //[[FXEditContainer shareInstance] setFrame:CGRect_editpanel];
            }
            
            [UIView commitAnimations];
        }
            break;
        case 2:
        {

            [self changeStatusForNickNameAndRecent:NO :CGRect_nickNameInStatusMid];
            //[self.recentView setHidden:NO];
            self.contactName.hidden = YES;
            [UIView beginAnimations:@"anima" context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            [UIView setAnimationDuration:0.1f];

            [self.imageviewHeadImgBGView setFrame:CGRect_imageviewHeadImgBGViewInStatusMid];
            if (userInfoType == USER_MANAGER_SYSTEM || userInfoType == USER_MANAGER_XIAOSHUANG) {
                [self.IMView setFrame:CGRectMake(CGRect_IMViewInStatusMid.origin.x, CGRect_IMViewInStatusMid.origin.y, 320, 460-CGRect_IMViewInStatusMid.origin.y)];    
            }else {
                
                [self.IMView setFrame:CGRect_IMViewInStatusMid];

            }
            
            [self.imageviewHeadImg setFrame:CGRect_imageviewHeadImgInStatusMid];
            [self.mainBGView setFrame:CGRect_mainBGViewInStatusMid]; 
            [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusMid];
            //2012.8.15修改
            [self.keybordView setFrame:CGRect_whenKeybordViewd];
            [UIView commitAnimations];
        }
            break;
        case 3:
        {
            //[self.recentView setHidden:YES];
            [self changeStatusForNickNameAndRecent:NO :CGRectMake(320-195.f, 460-55.f, 88.f , 16.f)];
            self.contactName.hidden = NO;
            [UIView beginAnimations:@"anima" context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            [UIView setAnimationDuration:0.1f];
            [self.imageviewHeadImgBGView setFrame:CGRect_imageviewHeadImgBGViewInStatusDown];
            [self.imageviewHeadImg setFrame:CGRect_imageviewHeadImgInStatusDown];
            [self.IMView setFrame:CGRect_IMViewInStatusDown];
            [self.mainBGView setFrame:CGRectMake(0, 0, 320, 510.f)];
            [UIView commitAnimations];
           // [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusDown];
        }
            break;
        default:
            break;
    }
}
//当statusDown时上滑B区，移动个人profile区,TouchStatus:YES==Move,NO = End
-(void)changeFrameWhenUpSwipeInStatusDown : (CGFloat)offsetValue TouchStatus:(BOOL)statusMoveOrEnd
{
    self.view.userInteractionEnabled = YES;
    if (statusMoveOrEnd) {
        CGRect frame = self.mainBGView.frame;
        frame.origin.y =  -offsetValue/2.5f;
        frame.size.height = 460 + offsetValue/2.5f;        
        self.mainBGView.frame = frame;
//        CGRect frameUpView = self.profileView.imageviewBGInMainView.frame;
//        frameUpView.origin.y = -offsetValue/4.5f;
//        self.profileView.imageviewBGInMainView.frame = frameUpView;  
    }else {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:0.2f];
       // [self.ProfileView setFrame:CGRectMake(0, CGRect_imageviewBGInMainViewInStatusMid.size.height, 320.f, CGRect_mainBGViewInStatusMid.size.height - CGRect_imageviewBGInMainViewInStatusMid.size.height)];
        [self.mainBGView setFrame:CGRectMake(0, 0, 320.f, 510.f)];
//        [self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusDown];
        [UIView commitAnimations];
    }
}
#pragma mark MSHeadViewDelegate
-(void)touchedHeadView:(UITouch *)viewTouch withEvent:(UIEvent *)viewEvent withTouchButtonStatus:(TouchButtonStatus)status
{
    switch (status) {
        case TouchButtonStatus_Begin:
        {
            [self touchesBegan:[NSSet setWithObject:viewTouch] withEvent:viewEvent];
        }
            break;
        case TouchButtonStatus_Move:
        {
            [self touchesMoved:[NSSet setWithObject:viewTouch] withEvent:viewEvent];
        }
            break;
        case TouchButtonStatus_End:
        {
            [self touchesEnded:[NSSet setWithObject:viewTouch] withEvent:viewEvent];
        }
            break;
        case TouchButtonStatus_Cancel:
        {
            [self touchesCancelled:[NSSet setWithObject:viewTouch] withEvent:viewEvent];
        }
            break;
        default:
            break;
    }
}
#pragma mark touchMethod

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self.view];
       
    //2012.8.15修改
//    [[FXEditContainer shareInstance] doForceHideCapturePanel];
//    if (keybordViewed) {
//        [[FXEditContainer shareInstance] doForceHideKeyboard];
//    }
//
//    if ([touch.view class] == [FXEditPanel class])  return;
    
    [self.keybordView hidePhotoSwitch];
    if (keybordViewed) {
        [self.keybordView resetFrame];
    }
    
    



}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{ 
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    

  
    CGFloat offsetValue = beginPoint.y - point.y;
    //所有手势下滑
    if (offsetValue < 0) {
        if (self.currentStatus != message_view_Status_Down ) {
            [self changeStatusForNickNameAndRecent:YES :CGRectZero];            
        }else {
            if ( [self isInUpBGRectOrInHeadImgRect:beginPoint]== 2) {
                [self changeStatusForNickNameAndRecent:YES :CGRectZero];                    
            }
        }
        
    }else {
        //上滑 头像时
        if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 2) {
            
            [self changeStatusForNickNameAndRecent:YES :CGRectZero];            
            [self.recentView setHidden:YES];    
        }
    }
    //    if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 1 || [self isInUpBGRectOrInHeadImgRect:beginPoint] == 2) {
    //        [self scrolledViewWhenViewDraged:beginPoint.y - point.y];
    //        self.isMoved = YES;        
    //    }

    self.isMoved = YES;    
    self.view.userInteractionEnabled = NO;
    if ( isShakeEnded) 
    {
    switch (self.currentStatus) {
        case message_view_Status_up:
        {
            if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 2) {
                if (-offsetValue < offsetValueForChangeStatus ) {
                    [self scrolledViewWhenViewDraged:beginPoint.y - point.y];        
                }else if(-offsetValue >= offsetValueForChangeStatus )
                {
                    [self scrolledViewWhenMainBGViewDraged:offsetValue :1 :NO];
                    
                }
                
            }else if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 1)
            {
                if (-offsetValue < offsetValueForChangeStatus && offsetValue<0) {
                    [self scrolledViewWhenViewDraged:beginPoint.y - point.y];        
                }else if(-offsetValue >= offsetValueForChangeStatus && offsetValue<0)
                {
                    [self scrolledViewWhenMainBGViewDraged:offsetValue :2 :YES];
                    isDragedEndMainBGView = YES;
                    
                }                
            }
        }
            break;
        case message_view_Status_Middle:
        {
            if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 2) {
              //  if (offsetValue <= imageviewUpBGInStatusMid - imageviewHeadImageInStatusMid +imageviewHeadImageBGViewInStatusMid) {
                [self scrolledViewWhenViewDraged:offsetValue];                    
                //}

            }else if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 1)
            {
                if (offsetValue <= 0 ) {
                    [self scrolledViewWhenMainBGViewDraged:offsetValue :2 :NO];
                    isDragedEndMainBGView = YES;
                }
                
            }
        }
            break;
        case message_view_Status_Down:
        {
            if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 2)
            {
                //if (offsetValue <= 460 - imageviewHeadImageInStatusMid + 1) {
                [self scrolledViewWhenViewDraged:offsetValue];                         
                //}
                
            }else if ([self isInUpBGRectOrInHeadImgRect:beginPoint] == 1 && offsetValue<0)
            {
                [self scrolledViewWhenMainBGViewDraged:offsetValue :3 :NO];
            }else if([self isInUpBGRectOrInHeadImgRect:beginPoint] == 1 && offsetValue > 0){
                [self changeFrameWhenUpSwipeInStatusDown:offsetValue TouchStatus:YES];
            }
            
            
        }
            break;
        default:
            break;
    }
    }
   
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
 

    //如果shake动画未完成返回
    if (!isShakeEnded)  return;
    //如果点击区域为键盘，返回
    
    
    /*
    if ([touch.view class] == [FXEditPanel class])  
    {
    
    [self.nextResponder touchesEnded:touches withEvent:event ];
    }
     */
    [self.buttonBack setHidden:NO];

    
    CGFloat offsetValueY = beginPoint.y - point.y;
    if (isDragedEndMainBGView) {
        self.currentStatus = 2;
        [self reBoundByCurrentStatus];

    }else {
        switch (self.currentStatus) {
            case message_view_Status_up:
            {
                if (!self.isMoved && ([self isInUpBGRectOrInHeadImgRect:beginPoint]==2 || [self isInUpBGRectOrInHeadImgRect:beginPoint]==1)) {
                    [self changeStatusBySwipeLevel:1];
                    self.isMoved = NO;
                    return;
                }
//                if (-offsetValueY < offsetValueInWithoutStatusMid) {
//                    [self reBoundByCurrentStatus];
//                }
//                else if(-offsetValueY >= offsetValueInWithoutStatusMid && -offsetValueY < offsetValueForChangeStatus*2 + 32.f) {
//                    [self changeStatusBySwipeLevel:1];
//                }
                if (offsetValueY <0 && -offsetValueY <= imageviewUpBGInStatusMid  + offsetValueInStatusMid - CGRect_imageviewHeadImgBGViewInStatusUp.origin.y) {
                    
                    [self changeStatusBySwipeLevel:1];
                }
                else if (-offsetValueY > imageviewUpBGInStatusMid + offsetValueInStatusMid - CGRect_imageviewHeadImgBGViewInStatusUp.origin.y)
                {
                   
                    [self changeStatusBySwipeLevel:2];
                }else if(offsetValueY > 0) {
                    [self reBoundByCurrentStatus];
                    //[self.buttonBack setHidden:YES];
                }
                
                
            }
                break;
            case message_view_Status_Middle:
            {
                if ( [self isInUpBGRectOrInHeadImgRect:beginPoint]==2) {
                    //点击头像下滑
                    //&& isShakeEnded
                    if (!self.isMoved ) {

                        [self changeStatusBySwipeLevel:2];
                        //isShakeEnded = NO;
                        //[self performSelector:@selector(endShaked) withObject:nil afterDelay:0.92f];
                        //[self shakeAnimation];
                        self.isMoved = NO;
                        
                        return;
                    }
                    //&& isShakeEnded
                    if (offsetValueY < 0 ) {
                        if (-offsetValueY < offsetValueInStatusMid ) {
                            [self reBoundByCurrentStatus];
                        }else if (-offsetValueY >= offsetValueInStatusMid  )
                        {
                            [self changeStatusBySwipeLevel:2];                    
                           
                        }    
                        
                    }else {
                        if (offsetValueY < offsetValueForUpSwipeInStatusMid && offsetValueY !=0 && isShakeEnded) {
                            [self reBoundByCurrentStatus];
                        }else if (offsetValueY >= offsetValueForUpSwipeInStatusMid  )
                        {
                            [self changeStatusBySwipeLevel:1];                    
                           
                        }   
                        
                    }
                    
                }else {
                    self.view.userInteractionEnabled = YES;
                    [self changeStatusForNickNameAndRecent:NO :CGRect_nickNameInStatusMid];
                }
                
            }
                break;
            case message_view_Status_Down:
            {
                if ( [self isInUpBGRectOrInHeadImgRect:beginPoint]==2) {
                    //2012.8.15修改
                    //[[FXEditContainer shareInstance] setFrame:CGRect_editpanel];
                    if (!self.isMoved ) {
                        [self changeStatusBySwipeLevel:2];
                        self.isMoved = NO;
                        return;
                    }
//                    if (offsetValueY <= offsetValueInWithoutStatusMid ) {
//                        [self reBoundByCurrentStatus];
//                    }else if (offsetValueY >offsetValueInWithoutStatusMid && offsetValueY < offsetValueForChangeStatus*2 + 32.f)
//                    {
//                        [self changeStatusBySwipeLevel:2];
//                    }
                    //offsetValueInStatusMid+50.f
                    if (offsetValueY < CGRect_imageviewHeadImgInStatusDown.origin.y - CGRect_imageviewHeadImgInStatusMid.origin.y + 20) {
                          [self changeStatusBySwipeLevel:2];
                    }
                    else if (offsetValueY >= CGRect_imageviewHeadImgInStatusDown.origin.y - CGRect_imageviewHeadImgInStatusMid.origin.y + 20)
                    {
                        [self changeStatusBySwipeLevel:1];

                    }
                }else {
                    if (offsetValueY > 0) {
                        [self changeFrameWhenUpSwipeInStatusDown:offsetValueY TouchStatus:NO];
                    }else if (offsetValueY < 0)
                    {
                    [self reBoundByCurrentStatus];                    
                    }

                }
                break;
            default:
                break;
            }
        }
    }
    self.view.userInteractionEnabled = YES;
    self.isMoved = NO;
    isDragedEndMainBGView = NO;
    

}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{

    [self reBoundByCurrentStatus];
    
}
#pragma mark shakeAnimation
- (void)shakeAnimation
{
    
    [UIView beginAnimations:@"MoveDown" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
   // [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationDelegate:self];
    [self.IMView setFrame:CGRectMake(0.f, self.IMView.frame.origin.y+offsetValueDownWhenShaked, 320, self.IMView.frame.size.height+20)];
    [self.imageviewHeadImgBGView setFrame:CGRectMake(0.f, self.imageviewHeadImgBGView.frame.origin.y+offsetValueDownWhenShaked, 320.f, self.imageviewHeadImgBGView.frame.size.height)];
    [self.imageviewHeadImg setFrame:CGRectMake(320-imageviewHeadImageInStatusMid-26.5, self.imageviewHeadImg.frame.origin.y + offsetValueDownWhenShaked, self.imageviewHeadImg.frame.size.width, self.imageviewHeadImg.frame.size.height)];
    //[self.mainBGView setFrame:CGRectMake(0, self.mainBGView.frame.origin.y + 50.f, self.mainBGView.frame.size.width, self.mainBGView.frame.size.height)];
    //[self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusDown];
    [UIView commitAnimations];
    
    
}
-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    
    if ([animationID isEqualToString:@"shake"]) {

        CAKeyframeAnimation *animation = [CAKeyframeAnimation shakeAnimation:self.IMView.layer.frame];
        [self.IMView.layer addAnimation:animation forKey:kCATransition];    
        
        CAKeyframeAnimation *animation1 = [CAKeyframeAnimation shakeAnimation:self.imageviewHeadImgBGView.frame];
        [self.imageviewHeadImgBGView.layer addAnimation:animation1 forKey:kCATransition]; 
        
        CAKeyframeAnimation *animation2 = [CAKeyframeAnimation shakeAnimation:self.imageviewHeadImg.frame];
        [self.imageviewHeadImg.layer addAnimation:animation2 forKey:kCATransition]; 
      //  isShakeEnded = YES;
        [self changeStatusForNickNameAndRecent:NO :CGRect_nickNameInStatusMid];
    }else if ([animationID isEqualToString:@"MoveUp"]){
        [UIView beginAnimations:@"shake" context:nil];
       // [UIView setAnimationDelay:0.09f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:0.1f];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        [UIView setAnimationDelegate:self];
        
        [self.IMView setFrame:CGRectMake(0.f, self.IMView.frame.origin.y+20.f, 320, self.IMView.frame.size.height)];
        [self.imageviewHeadImgBGView setFrame:CGRectMake(0.f, self.imageviewHeadImgBGView.frame.origin.y+20.f, 320.f, self.imageviewHeadImgBGView.frame.size.height)];
        [self.imageviewHeadImg setFrame:CGRectMake(320-imageviewHeadImageInStatusMid-26.5, self.imageviewHeadImg.frame.origin.y+ 20.f, self.imageviewHeadImg.frame.size.width, self.imageviewHeadImg.frame.size.height)];
        [UIView commitAnimations];
    }else if ([animationID isEqualToString:@"MoveDown"])
    {
       // [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5f]];  
        [UIView beginAnimations:@"MoveUp" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelay:0.11f];
        [UIView setAnimationCurve:0.3f];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        [UIView setAnimationDelegate:self];
        [self.IMView setFrame:CGRectMake(0.f, self.IMView.frame.origin.y-offsetValueDownWhenShaked-20.f, 320, self.IMView.frame.size.height)];
        [self.imageviewHeadImgBGView setFrame:CGRectMake(0.f, self.imageviewHeadImgBGView.frame.origin.y-offsetValueDownWhenShaked-20.f, 320.f, self.imageviewHeadImgBGView.frame.size.height)];
        [self.imageviewHeadImg setFrame:CGRectMake(320-imageviewHeadImageInStatusMid-26.5, self.imageviewHeadImg.frame.origin.y - offsetValueDownWhenShaked - 20.f, self.imageviewHeadImg.frame.size.width, self.imageviewHeadImg.frame.size.height)];
        //[self.mainBGView setFrame:CGRectMake(0, self.mainBGView.frame.origin.y - 50.f, self.mainBGView.frame.size.width, self.mainBGView.frame.size.height)];
        //[self.profileView.imageviewBGInMainView setFrame:CGRect_imageviewBGInMainViewInStatusMid];
        [UIView commitAnimations];
    }else if ([animationID isEqualToString:@"beginReBound"])
    {
        [self reBoundByCurrentStatus];
    }else if ([animationID isEqualToString:@"ImageBegin"]) {
        [self performSelector:@selector(endAnimation) withObject:nil afterDelay:3.0f];
        
    }else if([animationID isEqualToString:@"ImageEnd"]){
        //[self.completedView removeFromSuperview];
        if ([[UIApplication sharedApplication].keyWindow viewWithTag:CoupleAnimationCompleteViewTag]) {
            [[[UIApplication sharedApplication].keyWindow viewWithTag:CoupleAnimationCompleteViewTag] removeFromSuperview];
           
        }
    }
    
    
}

-(void)keybordAppear
{
    self.currentStatus = 1;
    [self setFrameWhenScrollToEnd];
   
    
}
-(void)endShaked
{

    [self.IMView setFrame:CGRectMake(0.f, self.IMView.frame.origin.y, 320, self.IMView.frame.size.height-20)];
    isShakeEnded = YES;

}

#pragma mark makeUIImageRounded

// 键盘出现 
- (void)keyboardViewDidAppear:(CGFloat)height // 高度暂时是 0
{
        if (!keybordViewed) {
            keybordViewed = YES;
        }
        [self keybordAppear]; 
}
/*
 7键盘显示出来了
 */
//- (void)actionKeyboardDidApearWithKeyboardHeight:(CGFloat)height
//{
//   
//    //self.keybordHeight = height;
//    if (!keybordViewed) {
//        keybordViewed = YES;
//     
//    }
//       [self keybordAppear];        
//   
//}
/*
 8键盘隐藏以后
 */
//- (void)actionKeyboardDidDisapear
//{
//    keybordViewed = NO;
//}

@end
//抖动
@implementation CAKeyframeAnimation (shakeAnimation)
static int numberOfShakes = 1;//震动次数
static float durationOfShake = 0.3f;//震动时间
static float vigourOfShake = 0.02f;//震动幅度

+ (CAKeyframeAnimation *)shakeAnimation:(CGRect)frame
{
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	
    CGMutablePathRef shakePath = CGPathCreateMutable();
    CGPathMoveToPoint(shakePath, NULL, CGRectGetMidX(frame), CGRectGetMidY(frame) );
	for (int index = 0; index < numberOfShakes; ++index)
	{
        switch (index) {
            case 0:
            {
                vigourOfShake = 8.f;
            }
                break;
            case 1:
            {
                vigourOfShake = 7.f;
            }
                break;
                
            default:
                break;
        }
        //[shakeAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
		CGPathAddLineToPoint(shakePath, NULL, CGRectGetMidX(frame),CGRectGetMidY(frame)-vigourOfShake);
        
		CGPathAddLineToPoint(shakePath, NULL,  CGRectGetMidX(frame) ,CGRectGetMidY(frame));
	}
    CGPathCloseSubpath(shakePath);
    shakeAnimation.path = shakePath;
    shakeAnimation.duration = durationOfShake;
    
    CFRelease(shakePath);
    
    return shakeAnimation;
}
@end