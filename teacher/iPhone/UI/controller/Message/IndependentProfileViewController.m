//
//  IndependentProfileViewController.m
//  iCouple
//
//  Created by qing zhang on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IndependentProfileViewController.h"

@interface IndependentProfileViewController ()

@end

@implementation IndependentProfileViewController
@synthesize upBGImage;
@synthesize loadingView;
@synthesize comeFromIM;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    downBGImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 211, 320, 249)];
    [downBGImage setImage:[UIImage imageNamed:@"bg_im__graybackround.png"]];
    [self.view addSubview:downBGImage];
    
    self.upBGImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 211)];
    [self.view addSubview:self.upBGImage];
    
    back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0, 0, 60, 60)];
    [back setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_back.png"] forState:UIControlStateNormal];
    [back setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_backpress.png"] forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(backTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [chatButton setFrame:CGRectMake(320-92, 0, 82, 60)];
    [chatButton setTitle:@"去聊天" forState:UIControlStateNormal];
    chatButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-blod" size:14.f];
    [chatButton setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    [chatButton setBackgroundImage:[UIImage imageNamed:@"profile_btn_gotalk_nor.png"] forState:UIControlStateNormal];
    [chatButton setBackgroundImage:[UIImage imageNamed:@"profile_btn_gotalk_press.png"] forState:UIControlStateHighlighted];
    [chatButton addTarget:self action:@selector(goChat) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chatButton];
    
    UIImageView *bar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 196, 320, 15)];
    bar.image = [UIImage imageNamed:@"sign_step1_image_bar"];
    [self.view addSubview:bar];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"createMsgGroupTag" options:0 context:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"createMsgGroupTag"];
    
//    if (!self.comeFromIM) {
//        [[CPUIModelManagement sharedInstance] setCurrentMsgGroup:nil];
//    }
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
#pragma mark buttonTap
-(void)backTap
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)goChat
{

}
@end
