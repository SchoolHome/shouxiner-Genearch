//
//  CoupleBreakIcePageViewController.m
//  iCouple
//
//  Created by qing zhang on 9/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoupleBreakIcePageViewController.h"
#import "ColorUtil.h"
#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
#import "AddContactViewController.h"
#import "SingleIMViewController.h"
#define unSendedStatusTag 10
#define sendedStatusTag 11
#define labelTextOtherTag 12
#define imageviewDetailTag 13
#define btnBackTag 14
#define nicknameTag 15

@interface CoupleBreakIcePageViewController ()
{
    BOOL notFirstTime;
}
@end

@implementation CoupleBreakIcePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"coupleMsgGroupTag" options:0 context:nil];
    [self changeStatusToSended];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"coupleMsgGroupTag"];
}
-(void)viewDidAppear:(BOOL)animated
{
    CPUIModelMessageGroup *coupleMsgGroup = [CPUIModelManagement sharedInstance].coupleMsgGroup;
    if (coupleMsgGroup && !notFirstTime) {
        SingleIMViewController *single = [[SingleIMViewController alloc] init:[CPUIModelManagement sharedInstance].coupleMsgGroup];
        [self.navigationController pushViewController:single animated:YES];
        notFirstTime = YES;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //243,239,230
    //self.backgroundColor = [UIColor colorWithRed:243/255.f green:239/255.f blue:230/255.f alpha:1.f];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f3eee5"];
    // Initialization code

    
   
	// Do any additional setup after loading the view.
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
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if ([keyPath isEqualToString:@"coupleMsgGroupTag"]) {
        /**********************王硕 2012－5－24**************************/
        
        switch ([CPUIModelManagement sharedInstance].coupleMsgGroupTag) {
            case UPDATE_USER_GROUP_TAG_DEFAULT:{
                CPUIModelMessageGroup *coupleMsgGroup = [CPUIModelManagement sharedInstance].coupleMsgGroup;
                if (coupleMsgGroup && !notFirstTime) {
                    SingleIMViewController *single = [[SingleIMViewController alloc] init:[CPUIModelManagement sharedInstance].coupleMsgGroup];
                    [self.navigationController pushViewController:single animated:YES];
                    notFirstTime = YES;
                }
            }
        }
    }
}
-(void)addCouple
{
    AddContactViewController *addContact = [[AddContactViewController alloc] initWithUIAddContract:UIAddCouple];
    [self.navigationController pushViewController:addContact animated:YES];
    
}
-(void)addLike
{
    AddContactViewController *addContact = [[AddContactViewController alloc] initWithUIAddContract:UIAddLike];
    //[self.navigationController presentViewController:addContact animated:YES completion:nil];
    [self.navigationController pushViewController:addContact animated:YES];
}
-(void)btn_ToGoHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//将ui布局改变为已发送状态
-(void)changeStatusToSended
{
    
    NSDictionary *dicInfo = [[CPUIModelManagement sharedInstance] getWillCoupleDictionary];
    if (dicInfo) {
        if ([self.view viewWithTag:unSendedStatusTag]) {
            [[self.view viewWithTag:unSendedStatusTag] removeFromSuperview];
        }
        if (![self.view viewWithTag:sendedStatusTag]) {
//                UIImageView *upBGImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 135)];
//                [upBGImageview setImage:[UIImage imageNamed:@"item_flower_Ice-breaking.jpg"]];
//                [self.view addSubview:upBGImageview];
//                
//            UIImageView *bottomBGImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 345.f, 320.f, 115.f)];
//            [bottomBGImageview setImage:[UIImage imageNamed:@"item_bike_Ice-breaking@2x.jpg"]];
//            [self.view addSubview:bottomBGImageview];

            UIImageView *sendedStatusBGView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            [sendedStatusBGView setImage:[UIImage imageNamed:@"bg_waiting.jpg"]];
            [self.view addSubview:sendedStatusBGView];
            
            UIView *sendedStatusView = [[UIView alloc] initWithFrame:CGRectMake(0, 160, 320, 300)];
            sendedStatusView.tag = sendedStatusTag;
            sendedStatusView.backgroundColor = [UIColor clearColor];
            [self.view addSubview:sendedStatusView];  
            
          
            
            UILabel *labelTextPlus = [[UILabel alloc] initWithFrame:CGRectMake(90, 6.f, 15, 16.f)];
            labelTextPlus.text = @"加";
            labelTextPlus.textColor = [UIColor blackColor];
            labelTextPlus.backgroundColor = [UIColor clearColor];
            labelTextPlus.font = [UIFont systemFontOfSize:15.f];
            [sendedStatusView addSubview:labelTextPlus];
            
            UILabel *NickName = [[UILabel alloc] initWithFrame:CGRectMake(labelTextPlus.frame.origin.x+15, 6, 60, 16.f)];
            NickName.textColor = [UIColor colorWithRed:243/255.f green:69/255.f blue:45/255.f alpha:1.f];
            NickName.textAlignment = UITextAlignmentCenter;
            NickName.text = [dicInfo objectForKey:@"coupleName"];
            NickName.backgroundColor = [UIColor clearColor];
            NickName.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
            NickName.tag = nicknameTag;
            [sendedStatusView addSubview:NickName];
            
            UILabel *labelTextOther = [[UILabel alloc] initWithFrame:CGRectMake(labelTextPlus.frame.origin.x+18+NickName.frame.size.width, 6, 100, 16.f)];
            labelTextOther.textColor = [UIColor blackColor];
            labelTextOther.backgroundColor = [UIColor clearColor];
            labelTextOther.font = [UIFont systemFontOfSize:15.f];
            [sendedStatusView addSubview:labelTextOther];
            
            NSInteger relationType = [[dicInfo objectForKey:@"relationType"] integerValue];
            UIImageView *imageviewDetail = [[UIImageView alloc] init];
            if (relationType == USER_RELATION_TYPE_MARRIED || relationType == USER_RELATION_TYPE_COUPLE) {
                labelTextOther.text = @"为另一半";
                [imageviewDetail setFrame:CGRectMake(60, 28.f, 197, 13)];
                [imageviewDetail setImage:[UIImage imageNamed:@"item_invitecouple_Ice-breaking.png"]];
            }else if(relationType == USER_RELATION_TYPE_LOVER)
            {
                labelTextOther.text = @"为喜欢的人";
                [imageviewDetail setFrame:CGRectMake(45.f, 28.f, 240, 29)];
                [imageviewDetail setImage:[UIImage imageNamed:@"item_invitelike_Ice-breaking.png"]];
            }
            [sendedStatusView addSubview:imageviewDetail];
            
            UIButton *btnReChooseRelation = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnReChooseRelation setBackgroundImage:[UIImage imageNamed:@"item_inviteothers_Ice-breaking.png"] forState:UIControlStateNormal];
            [btnReChooseRelation setBackgroundImage:[UIImage imageNamed:@"item_inviteotherspress_Ice-breaking.png"] forState:UIControlStateHighlighted];
            [btnReChooseRelation setFrame:CGRectMake(94, 79, 132, 37)];
            [btnReChooseRelation addTarget:self action:@selector(reChooseRelation) forControlEvents:UIControlEventTouchUpInside];
            [sendedStatusView addSubview:btnReChooseRelation];
        }else {
            UILabel *labelTextOther = (UILabel *)[self.view viewWithTag:labelTextOtherTag];
            UIImageView *imageviewDetail = (UIImageView *)[self.view viewWithTag:imageviewDetailTag];
            NSInteger relationType = [[dicInfo objectForKey:@"relationType"] integerValue];
            UILabel *nickName = (UILabel *)[self.view viewWithTag:nicknameTag];
            nickName.text = [dicInfo objectForKey:@"coupleName"];
            if (relationType == USER_RELATION_TYPE_MARRIED || relationType == USER_RELATION_TYPE_COUPLE) {
                labelTextOther.text = @"为另一半";
                [imageviewDetail setFrame:CGRectMake(60, 28.f, 197, 13)];
                [imageviewDetail setImage:[UIImage imageNamed:@"item_invitecouple_Ice-breaking.png"]];
            }else if(relationType == USER_RELATION_TYPE_LOVER)
            {
                labelTextOther.text = @"为喜欢的人";
                [imageviewDetail setFrame:CGRectMake(45.f, 28.f, 240, 29)];
                [imageviewDetail setImage:[UIImage imageNamed:@"item_invitelike_Ice-breaking.png"]];
            }
        }
        
        
        
        
    }else {
        if ([self.view viewWithTag:sendedStatusTag]) {
            [[self.view viewWithTag:sendedStatusTag] removeFromSuperview];
        }
        if (![self.view viewWithTag:unSendedStatusTag]) {
            UIView *UnsendStatusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            UnsendStatusView.tag = unSendedStatusTag;
            UnsendStatusView.backgroundColor = [UIColor clearColor];
            [self.view addSubview:UnsendStatusView];
//            //item_add_Ice-breaking@2x
//            UIImageView *chooseTextImageview = [[UIImageView alloc] initWithFrame:CGRectMake(127, 0, 66, 13)];
//            [chooseTextImageview setImage:[UIImage imageNamed:@"item_add_Ice-breaking.jpg"]];
//            [UnsendStatusView addSubview:chooseTextImageview];
//            
//            UIImageView *leftTextImageview = [[UIImageView alloc] initWithFrame:CGRectMake(18.f, 155.f, 125.f, 63.f)];
//            //UIImageView *leftTextImageview = [[UIImageView alloc] initWithFrame:CGRectMake(176.f, -50.f, 125.f, 63.f)];
//            [leftTextImageview setImage:[UIImage imageNamed:@"item_addcouple_Ice-breaking.jpg"]];
//            [UnsendStatusView addSubview:leftTextImageview];
//            
//            UIImageView *rightTextImageview = [[UIImageView alloc] initWithFrame:CGRectMake(176.f, 155.f, 129.f, 63.f)];
//            [rightTextImageview setImage:[UIImage imageNamed:@"item_addlike_Ice-breaking.jpg"]];
//            [UnsendStatusView addSubview:rightTextImageview];
//            
//            
//            
//            UIImageView *imageviewMiddleLine = [[UIImageView alloc] initWithFrame:CGRectMake(160, 34, 1, 200.f)];
//            [imageviewMiddleLine setImage:[UIImage imageNamed:@"item_line_Ice-breaking.png"]];
//            [UnsendStatusView addSubview:imageviewMiddleLine];
            
            UIButton *btnAddCouple = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnAddCouple setBackgroundImage:[UIImage imageNamed:@"pb_addcouple"] forState:UIControlStateNormal];
            [btnAddCouple setBackgroundImage:[UIImage imageNamed:@"pb_addcouple_press"] forState:UIControlStateHighlighted];
            [btnAddCouple addTarget:self action:@selector(addCouple) forControlEvents:UIControlEventTouchUpInside];
            [btnAddCouple setFrame:CGRectMake(0.f, 0.f, 320.f, 230.f)];
            [UnsendStatusView addSubview:btnAddCouple];
            
            UIButton *btnAddLike = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnAddLike setBackgroundImage:[UIImage imageNamed:@"pb_addlike"] forState:UIControlStateNormal];
            [btnAddLike setBackgroundImage:[UIImage imageNamed:@"pb_addlike_press"] forState:UIControlStateHighlighted];
            [btnAddLike addTarget:self action:@selector(addLike) forControlEvents:UIControlEventTouchUpInside];
            [btnAddLike setFrame:CGRectMake(0.f, 230.f, 320.f, 230.f)];
            [UnsendStatusView addSubview:btnAddLike];
        }
        
        
    }
    UIButton *btnToHome = (UIButton *)[self.view viewWithTag:btnBackTag];
    if (!btnToHome) {
        btnToHome = [UIButton buttonWithType:UIButtonTypeCustom];
        btnToHome.tag = btnBackTag;
        [btnToHome setFrame:CGRectMake(0.0f, 0.0f, 60.0f, 60.f)];
        [btnToHome setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_back.png"] forState:UIControlStateNormal];
        [btnToHome setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_backpress.png"] forState:UIControlStateHighlighted];
        [btnToHome addTarget:self action:@selector(btn_ToGoHome) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnToHome];
    }
    [self.view bringSubviewToFront:btnToHome]; 
    
}
-(void)reChooseRelation
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"喜欢的人",@"另一半",@"取消", nil];
    actionsheet.cancelButtonIndex = actionsheet.numberOfButtons-1;
    [actionsheet showInView:self.view];
}

#pragma mark actionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
 
        if (buttonIndex == 0) {
            [self addLike];
        }else if(buttonIndex == 1)
        {
            [self addCouple];
        }
}
@end
