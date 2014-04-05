//
//  RegistFirstViewController.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerNavigationBarControl.h"
#import "NavigationBothStyle.h"

#import "FxProcessFixed.h"
#import "FxImgBall.h"
#import "DateUtil.h"
#import "FXSexChanger.h"
#import "FXInputWithWarning.h"
#import "FXStatusPanel.h"
#import "StatusPanelItem.h"
#import "ColorUtil.h"
#import "FxButton.h"
#import "FXStatusPanel.h"
#import "FXShakeField.h"
#import "FXCheckBox.h"
#import "ImageUtil.h"
#import "RegistHelper.h"
#import "FXTopTipPanel.h"

@class RegistViewController;
@interface RegistFirstViewController : UIViewController 
<FanxerNavigationBarDelegate,
UIActionSheetDelegate,
UIImagePickerControllerDelegate,
FxImgBallDelegate,
FXSexChangerDelegate,FXStatusPanelDelegate,FXShakeFieldDelegate,UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    
    FanxerNavigationBarControl *fnav;
    
    RegistViewController *registviewcontroller;
    FxProcessFixed *process;
    
    UIView *partoneview;
    
    UIView *parttwoview;
    
    UIImageView *capturebutton;
    
    FxImgBall *childrenimg;
    
    FxImgBall *masterimg;
    
    FxImgBall *wifeimg;
    
    UIImageView *barview;
    
    int currentcapturetag;
    
    int optype;
    
    int currentstatus;
    
    UILabel *remark;
    
    UILabel *sex;
    FXSexChanger *sexchanger;
    
    FXInputWithWarning *inputwithwarning;
    
    FxButton *fxbutton;
    
    FXStatusPanel *statuspanel;
    
    FXShakeField *shakefield;
    
    FXCheckBox *checkbox;
    
    UILabel *agreelabel;
    
    UILabel *leftlabel;
    
    UILabel *rightlabel;
    
    NSArray *array;
    
    NSString *lefttext;
    
    NSString *righttext;
    
    CGRect beginleftpanelrect;
    
    CGRect beginrightpanelrect;
    
    int sexinfo;
    
    int lifestatus;
    
    UIImage *captureimg;
    
    UIButton *recaptureimg;
    
    NSArray *stringarray;
    
    UIButton *blockbutton;
    
    BOOL isuploadcontact;
    
    int laststatustype;
    
    BOOL donotmove;
    
    BOOL needoneload;
    
    BOOL needtwoload;
    
    BOOL needtwostay;
    
    int twostaycount;
    
    RegistHelper *helper;
    
    BOOL isgray;
    
    UIButton *statusbutton;
    
    BOOL isopenstatuspanel;
    
    FXTopTipPanel *toptippanel;
    
    BOOL isgo;
}

@property (strong,nonatomic) FanxerNavigationBarControl *fnav;

@property (strong,nonatomic)  RegistViewController *registviewcontroller;

-(void)loadNav;

-(void)InitPart1;

-(void)InitPart2;

- (void)do_rise;
- (void)do_drop;


-(void)DoLimited:(id)sender;

-(UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect;

@end
