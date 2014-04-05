//
//  Guid07ViewController.m
//  iCouple
//
//  Created by ming bright on 12-9-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Guid07ViewController.h"
#import "LoginViewController.h"
#import "RegistFirstViewController.h"

#import "CPUIModelManagement.h"
#import "CPUIModelAnimSlideInfo.h"
#import "CPUIModelAudioSlideInfo.h"

///////////////////////////////////////////////////////////////////////////////////

@interface Guid07ViewController ()

@end

@implementation Guid07ViewController

-(void)coupleButtonTaped:(id)sender{
    Guid07ViewController1 *guid1 = [[Guid07ViewController1 alloc] init];
    [self.navigationController pushViewController:guid1 animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:background];
    background.image = [UIImage imageNamed:@"guide_index_couple@2x.jpg"];
    
    
    UIButton *coupleButton = [[UIButton alloc] initWithFrame:CGRectMake((320-131)/2, 460-51, 131, 51)];
    [self.view addSubview:coupleButton];
    [coupleButton addTarget:self action:@selector(coupleButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [coupleButton setBackgroundImage:[UIImage imageNamed:@"guide_btn_dear_nor"] forState:UIControlStateNormal];
    [coupleButton setBackgroundImage:[UIImage imageNamed:@"guide_btn_dear_press"] forState:UIControlStateHighlighted];
    
}

@end

///////////////////////////////////////////////////////////////////////////////////

@implementation Guid07ViewController1
@synthesize magic;

-(void)play:(CPUIModelAudioSlideInfo *)info{
    
    [MusicPlayerManager sharedInstance].delegate = self;
    [[MusicPlayerManager sharedInstance] playMusic:info.fileName playerName:info.fileName];
    
}

-(void)playButtonTaped:(id)sender{
//    GuidPetView *pet = [[GuidPetView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
//    [pet setTarget:self selector:@selector(startButtonTaped:)];
//    [pet showInView:self.view];
    
    flag = 0;
    
    [self.view addSubview:animView];
    NSString *petResID = @"qiaoqiaoni";
    [animView addAnimArray:[magic allAnimSlides] forName:petResID];    
    
    if ([[magic allAudioSlide] count]>0) {
        CPUIModelAudioSlideInfo *info = [[magic allAudioSlide] objectAtIndex:0];
        [self performSelector:@selector(play:) withObject:info afterDelay:[info.startTime floatValue]/1000.0f];
    }
}


-(void)dismissPetIfNeeded{
    
    if (2 == flag) {  // 保证声音和动画都结束
        
        [[MusicPlayerManager sharedInstance] stop];
        [MusicPlayerManager sharedInstance].delegate = nil;
        
        [animView stop];
        [animView removeFromSuperview];
        
        

    }
}

-(void)petButtonTaped:(id)sender{
    GuidPetView *pet = [[GuidPetView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [pet setNewTarget:self selector:@selector(newCountButtonTaped:)];
    [pet setLoginTarget:self selector:@selector(loginButtonTaped:)];
    
    [pet showInView:self.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:background];
    background.image = [UIImage imageNamed:@"guide_im_couple@2x.jpg"];
    
    
    petButton = [[UIButton alloc] initWithFrame:CGRectMake(8, 153, 84/2, 110/2)];
    [self.view addSubview:petButton];
    [petButton addTarget:self action:@selector(petButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [petButton setBackgroundImage:[UIImage imageNamed:@"guide_btn_im_ss_nor"] forState:UIControlStateNormal];
    [petButton setBackgroundImage:[UIImage imageNamed:@"guide_btn_im_ss_press"] forState:UIControlStateHighlighted];
    
    
    UIButton *playButton = [[UIButton alloc] initWithFrame:CGRectMake(17, 230, 96/2, 95/2)];
    [self.view addSubview:playButton];
    [playButton addTarget:self action:@selector(playButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [playButton setBackgroundImage:[UIImage imageNamed:@"item_im_play_guide"] forState:UIControlStateNormal];
    [playButton setBackgroundImage:[UIImage imageNamed:@"item_im_play_guidepress"] forState:UIControlStateHighlighted];
    
    
    animView = [[AnimImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    animView.userInteractionEnabled = YES;
    animView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.78];
    animView.delegate = self;
    
    self.magic = [CPUIModelPetMagicAnim initFromConfig:[[NSBundle mainBundle] pathForResource:@"psdh_cfg.cfg" ofType:nil]];//
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[MusicPlayerManager sharedInstance] stop];
    [MusicPlayerManager sharedInstance].delegate = nil;
}

-(void)loginButtonTaped:(id)sender{
    /*
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil 
                                                             delegate:self 
                                                    cancelButtonTitle:@"取消" 
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"登录",@"注册", nil];
    [actionSheet showInView:self.view];
     */
    
    LoginViewController *login = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES]; 
}
-(void)newCountButtonTaped:(id)sender{
    RegistFirstViewController *login = [[RegistFirstViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:login animated:YES];  
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (buttonIndex) {
        case 0:     // 登录
        {
            LoginViewController *login = [[LoginViewController alloc] init];
            [self.navigationController pushViewController:login animated:YES]; 
        }
            
            break;
        case 1:   // 注册
        {
            RegistFirstViewController *login = [[RegistFirstViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:login animated:YES]; 
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - MusicPlayerManagerDelegate

-(void)musicPlayerDidFinishPlaying:(MusicPlayerManager *) player playerName:(NSString *)name{
    flag = flag +1;
    [self dismissPetIfNeeded];
}
-(void)musicPlayerDecodeErrorDidOccur:(MusicPlayerManager *) player error:(NSError *)error playerName:(NSString *)name{
    flag = flag +1;
    [self dismissPetIfNeeded];
    
}

#pragma mark - AnimImageViewDelagate

-(void)animImageViewDidStartAnim:(AnimImageView*) animView{
    
}

-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
    flag = flag +1;
    [self dismissPetIfNeeded];
}



@end


///////////////////////////////////////////////////////////////////////////////////

@implementation GuidPetView


-(void)setNewTarget:(id) target selector:(SEL) sel{
    [button[5] addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
}
-(void)setLoginTarget:(id) target selector:(SEL) sel{
    [button[4] addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
}


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.backgroundColor = [UIColor redColor];
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:background];
        background.image = [UIImage imageNamed:@"guide_pet@2x.jpg"];
        
        for (int i = 0; i<6; i++) {
            button[i] = [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:button[i]];
            button[i].userInteractionEnabled = NO;
            button[i].alpha = 0.0f;
        }
        
        button[0].frame = CGRectMake(0, 0, 286/2, 234/2);
        [button[0] setBackgroundImage:[UIImage imageNamed:@"guide_pet1"] forState:UIControlStateNormal];

        
        button[1].frame = CGRectMake(0, 234/2, 286/2, 234/2);
        [button[1] setBackgroundImage:[UIImage imageNamed:@"guide_pet3"] forState:UIControlStateNormal];
        
        button[2].frame = CGRectMake(286/2, 0, 354/2, 468/2);
        [button[2] setBackgroundImage:[UIImage imageNamed:@"guide_pet2"] forState:UIControlStateNormal];
        
        button[3].frame = CGRectMake(0, 468/2, 640/2, 265/2);
        [button[3] setBackgroundImage:[UIImage imageNamed:@"guide_pet4"] forState:UIControlStateNormal];
        
        button[4].frame = CGRectMake(0, 468/2+265/2, 318/2, 188/2);
        [button[4] setBackgroundImage:[UIImage imageNamed:@"guide_pet5"] forState:UIControlStateNormal];
        [button[4] setBackgroundImage:[UIImage imageNamed:@"guide_pet5press"] forState:UIControlStateHighlighted];

        button[5].frame = CGRectMake(318/2, 468/2+265/2, 318/2, 188/2);
        [button[5] setBackgroundImage:[UIImage imageNamed:@"guide_pet6"] forState:UIControlStateNormal];
        [button[5] setBackgroundImage:[UIImage imageNamed:@"guide_pet6press"] forState:UIControlStateHighlighted];
        //button[5].userInteractionEnabled = YES;

    }
    return self;
}

-(void)showInView:(UIView *)aView{

    [aView addSubview:self];
    
    // button[0]
    [UIView animateWithDuration:0.4 
                     animations:^{
                         button[0].alpha =1.0f;
                     } 
                     completion:^(BOOL finished) {
                         //
                         
                         [UIView animateWithDuration:0.4 
                                          animations:^{
                                              button[1].alpha =1.0f;
                                          } 
                                          completion:^(BOOL finished) {
                                              //
                                              
                                              [UIView animateWithDuration:0.4 
                                                               animations:^{
                                                                   button[2].alpha =1.0f;
                                                               } 
                                                               completion:^(BOOL finished) {
                                                                   //
                                                                   
                                                                   [UIView animateWithDuration:0.4 
                                                                                    animations:^{
                                                                                        button[3].alpha =1.0f;
                                                                                    } 
                                                                                    completion:^(BOOL finished) {
                                                                                        //
                                                                                        
                                                                                        [UIView animateWithDuration:0.4 
                                                                                                         animations:^{
                                                                                                             button[4].alpha =1.0f;
                                                                                                         } 
                                                                                                         completion:^(BOOL finished) {
                                                                                                             //
                                                                                                             [UIView animateWithDuration:0.4 
                                                                                                                              animations:^{
                                                                                                                                  button[5].alpha =1.0f;
                                                                                                                              } 
                                                                                                                              completion:^(BOOL finished) {
                                                                                                                                  //
                                                                                                                                  button[4].userInteractionEnabled = YES;
                                                                                                                                  button[5].userInteractionEnabled = YES;

                                                                                                                              }];
                                                                                                             
                                                                                                             
                                                                                                         }];
                                                                                        
                                                                                    }];
                                                                   
                                                               }];
                                              
                                          }];
                         
                     }];
    
    
    
    
}

@end

///////////////////////////////////////////////////////////////////////////////////

