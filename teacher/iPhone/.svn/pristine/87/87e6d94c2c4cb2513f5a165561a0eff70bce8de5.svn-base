//
//  FXShakePanel.h
//  ShakeIcon
//
//  Created by 振杰 李 on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXPictureIcon.h"
#import "FXShakePanelDisplayDelegate.h"
@protocol FXShakePanelOperationDelegate;

@interface FXShakePanel : UIView{
    
    FXPictureIcon *picicon;    
    
    UILabel *title;
        
    id <FXShakePanelOperationDelegate> optdelegate;
    
    UIButton *closebutton;
    

}
@property (strong,nonatomic) FXPictureIcon *picicon;
@property (strong,nonatomic) UILabel *title;
@property (strong,nonatomic) id <FXShakePanelOperationDelegate> optdelegate;

- (id)initWithFrame:(CGRect)frame displayinfo:(NSObject<FXShakePanelDisplayDelegate> *)display;


-(void)NotifyShowCloseButton;


-(void)DoCloseCurrentBox;

@end


@protocol FXShakePanelOperationDelegate <NSObject>

-(void)DeleteNotify:(FXShakePanel *)panel;


@end
