//
//  Guid07ViewController.h
//  iCouple
//
//  Created by ming bright on 12-9-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimImageView.h"
#import "MusicPlayerManager.h"
#import "CPUIModelPetMagicAnim.h"
///////////////////////////////////////////////////////////////////////////////////
@class Guid07ViewController1;
@interface Guid07ViewController : UIViewController

@end

///////////////////////////////////////////////////////////////////////////////////
@class GuidPetView;
@interface Guid07ViewController1 : UIViewController<MusicPlayerManagerDelegate,
AnimImageViewDelegate,
UIActionSheetDelegate>
{
    AnimImageView *animView;
    
    CPUIModelPetMagicAnim *magic;
    
    UIButton *petButton;
    
    int flag;
}
@property (strong,nonatomic) CPUIModelPetMagicAnim *magic;
@end

///////////////////////////////////////////////////////////////////////////////////

@interface GuidPetView : UIView
{
    UIButton *button[6];
    UIImageView *hand;
    
}


-(void)showInView:(UIView *)aView;
-(void)setNewTarget:(id) target selector:(SEL) sel;
-(void)setLoginTarget:(id) target selector:(SEL) sel;
@end

///////////////////////////////////////////////////////////////////////////////////
