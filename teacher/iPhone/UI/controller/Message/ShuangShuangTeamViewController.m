//
//  ShuangShuangTeamViewController.m
//  iCouple
//
//  Created by qing zhang on 8/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShuangShuangTeamViewController.h"
@interface ShuangShuangTeamViewController ()
{

}
@end

@implementation ShuangShuangTeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)init : (CPUIModelMessageGroup *)messageGroup
{
    self = [super init:messageGroup];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //获取头像昵称
    [self.imageviewHeadImg setBackImage:[self returnCircleHeadImg]];
    //teamwall_paper
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"teamwall_paper.jpg"]];
    [imageview setFrame:CGRectMake(0, 0, 320, 460)];
    [self.mainBGView addSubview:imageview];
    

    
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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

@end
