//
//  AddContractViewController.h
//  iCouple
//
//  Created by yong wei on 12-3-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventTableViewCell.h"
#import "MultiSelectTableViewCell.h"
#import "SingleTableViewCell.h"
#import "AddContactModel.h"
#import "AddContactCellBase.h"
#import <MessageUI/MessageUI.h>
#import "ChooseCoupleTypeViewController.h"
#import "ChooseCoupleModel.h"
#import "AddContactWithProfileViewController.h"
#import "FanxerNavigationBarControl.h"
#import "NavigationBothStyle.h"
/*message box class*/
#import "GeneralViewController.h"
#import "FXBlockViewSubmit.h"
#import "HPStatusBarTipView.h"

@interface TelNumberModel : NSObject
@property (nonatomic) BOOL isProductUser;
@property (strong,nonatomic) NSString *TelNumber;
@end


typedef enum{
    sendMessageCloseFriend,
    sendMessageLike,
    sendAddCloseFriend,
    sendNone
}FirstMessageShow;

@interface AddContactViewController : GeneralViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UIActionSheetDelegate,MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate,FanxerNavigationBarDelegate,FXBlockViewSubmitDelegate,LoadingDelegate>{
    
    BOOL isReceiveKVO;
    // 在添加密友关系界面，添加密友时，该用户不是我的好友时，显示提示消息，且只显示一次
    BOOL isFirstAddCloseFriendContact;
    
    // 发送短信时保存的添加状态
    UpdateFriendType addContactTypeWithSendMessage;
    // YES－发送短信 NO－发送邀请
    BOOL isSendMessageWithAddCouple;
    // 发送短信时是否选择了couple类型
    BOOL isChooseCoupleType;
}

// 凡想NavigationBar
@property (strong,nonatomic) FanxerNavigationBarControl *fnav;

@property(strong,nonatomic) UITableView *myTableView;
@property(strong,nonatomic) UISearchBar *searchBar;
@property(nonatomic) BOOL isOpenKeyBoard;
@property(nonatomic) UIAddContactView uiAddContactEnum;
// AddContractModel
@property(strong,nonatomic) AddContactModel *addContactModel;

@property(strong,nonatomic) NSOperationQueue *operationQueue; 

@property(strong,nonatomic) UILabel *NotFoundLabel;

@property(nonatomic) BOOL isFirstShow;

/*
 初始化方法
 */
- (id) initWithUIAddContract : (UIAddContactView) UIAddContractEnum;

/*
    转换十六进制颜色值为UIColor对象
    例子：
    [AddContractViewController colorWithHexString : @"#FFFFFF"];
    
 */
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end
