//
//  HomePageSelfProfileViewController.h
//  iCouple
//
//  Created by ming bright on 12-5-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPSexPicker.h"
#import "HPSwitch.h"
#import "ARMicView.h"
#import "HPHeadView.h"

#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "CPUIModelUserInfo.h"

#import "MusicPlayerManager.h"

#import "HomePageModifyPasswordViewController.h"

typedef enum{
    ImageSelectedTypeBackground,
    ImageSelectedTypeAvatarSelf,
    ImageSelectedTypeAvatarCouple,
    ImageSelectedTypeAvatarBaby
}ImageSelectedType;

typedef enum{
    ProfileAlertTagImage,
    ProfileAlertTagLogout,
    ProfileAlertTagWeibo

}ProfileAlertTag;


@interface HomePageSelfProfileViewController : UIViewController
<UITextFieldDelegate,
UITextViewDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UIActionSheetDelegate,
ARMicViewDelegate,
MusicPlayerManagerDelegate
>
{
    UIButton *backButton;
    UIButton *saveButton;
    
    UIButton *baseView;     //被移动的底部视图
    
    //UIButton *changeButton;
    UIImageView *profileBackground;
    
    
    HPHeadView *avatarSelf;
    HPHeadView *avatarBaby;
    HPHeadView *avatarCouple;
    
    UILabel *babyNickNameLabel;
    UILabel *coupleNickNameLabel;
    
    
    UITextField *nickNameTextField;
    UITextView  *recentStatusTexiView;
    UILabel     *recentStatusPlaceholder;
    
    UIButton *recordButton;
    UIButton *convertButton;
    UILabel  *lengthLabel;
    
    
    UIImageView *nickNameBackground;
    UIImageView *recentStatusBackground;
    
    UIButton *refreshButton;
    UILabel *infoLabel;
    
    HPSexPicker *sexPickerView;
    HPSwitch *switcher;
    
    /* 控制键盘弹出后屏幕移动高度 */
    BOOL isNickNameUp;     //是否点击昵称
    BOOL isRecentStatusUp; //是否点击近况
    
    // 选中图片类型
    ImageSelectedType imageType;
    
    // 是否是文本近况
    BOOL isStatusText;

    ARMicView *micView;
    
    // 新图片缓存
    UIImage *cacheBgImage;
    UIImage *cacheSelfAvatarImage;
    UIImage *casheBabyAvatarImage;
    
    //  修改标识
    BOOL isBgChanged;
    BOOL isSelfAvatarChanged;
    BOOL isBabyAvatarChanged;
    BOOL isRecentChanged;
    BOOL isNickSexBabyChanged;
    
    int musicLength;
    
    // 此次是否录音成功过，1,成功过，以本地为准 2,没有录过音，以网络为准
    BOOL isRecordFinished;  
    
    // 新增加
    UIButton *weiboButton;
    UIButton *changePwdButton;
    UIButton *logoutButton;
    
    BOOL isUpdateTaped;
}

@property(nonatomic,strong) UIImage *cacheBgImage;
@property(nonatomic,strong) UIImage *cacheSelfAvatarImage;
@property(nonatomic,strong) UIImage *casheBabyAvatarImage;

@property  BOOL isUpdateTaped;

@end
