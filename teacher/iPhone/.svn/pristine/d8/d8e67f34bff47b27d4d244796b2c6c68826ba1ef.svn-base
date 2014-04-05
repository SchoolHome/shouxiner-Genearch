//
//  MessageDetailViewController.h
//  iCouple
//
//  Created by yong wei on 12-5-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatInforCellBase.h"
#import "ExMessageModel.h"
#import "MessageCellFactory.h"
#import "CalculateCellHeight.h"
#import "ExpressionsParser.h"
#import "ChatInforCellDelegate.h"
#import "MessagePetViewController.h"
#import "MessageLoveExpressionViewController.h"
#import "MessageSoundExpressionViewController.h"
#import "MessageAskExpressionViewController.h"
#import "MessageAlarmExpressionViewController.h"
#import "CustomAlertView.h"
#import "GeneralViewController.h"
#import "HPTopTipView.h"
#import "MessagePictrueViewController.h"
#import "MessageVideoViewController.h"
#import "RelationshipBrain.h"
#import "AlarmClockHelper.h"
#import "AlarmDatePickerView.h"


#import "CPUIModelMessage.h"
#import "CPUIModelMessageGroup.h"
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetFeelingAnim.h"
#import "CPUIModelPetActionAnim.h"
#import "CPUIModelUserInfo.h"

typedef enum{
    refreshAllMessage,
    refreshOnlyOneMessage,
    AppendOneMessage,
    AppendHistry
}refreshType;

@protocol MessageInforDelegate <NSObject,ChatInforCellDelegate>

@required
// 获取新的聊天数据
-(void) needMessageModel;
-(void) stopUserSound;
@optional

// 当消息点击气泡时，隐藏键盘
-(void) clickedMessageCell;
-(void) clickedSoundMessage;
// 消息发送失败后,用户点击叹号重新发送消息的通知，ChatInforCellBase 类型
//-(void) resendFailedMessage : (SingleSmallExpressionCell *) messageCell;
// 用户点击魔法表情时，通知外部controller，
//-(void) actionMagicFace : (ChatInforCellBase *) magicFaceCell;
// 点击图片缩略图去查看原图
//-(void) clickPictrueToOriginMessage : (SingleImageCell *) chatInforBase withPictrueInViewRect : (CGRect) rect;
// 点击视频时播放视频，此时视频文件已经下载完成
//-(void) clickVideoToPlayMessage : (SingleVideoCell *) videoMessage withPictrueInViewRect : (CGRect) rect;

// 移动tableView
-(void) movedMessageTableView : (UITableView *) tableView;
// 点击tableView Cell
-(void) clickMessageTableView : (UITableView *) tableView;

// 当是群组聊天时，点击聊天头像的事件
-(void) clickedUserHeadOfMessage : (id) senderUserID;
// 点击系统消息跳转
-(void) clickedSystemActionMessage : (AddContactAnalysis) analysisResult withModel : (ExMessageModel *) exModel;
// 闹钟第一次出现
-(void) alarmFirstShow;
@end


@interface MessageDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ChatInforCellDelegate,CheckMessageDelegate,ExpressionDelegate,UserMessageImageDelegate,UserMessageVideoDelegate,AlarmDatePickerViewDelegate>

// message聊天Table
@property (nonatomic,strong) UITableView *messageTable;
// 扩展message信息数组
@property (nonatomic,strong) NSMutableArray *exMessageModelArray;
// 是否是群组聊天
@property (nonatomic) BOOL isGroupMessageTable;
// 委托调用
@property (nonatomic,assign) id<MessageInforDelegate> delegate;
// 是否已经通知外部加载历史聊天信息数据
@property (nonatomic) BOOL isNotificationLoadMessage;
// 能否播放魔法表情
@property (nonatomic) BOOL canPlayMagic;

// 当键盘发送魔法表情的时候，调用此方法，播放魔法表情
//-(void) firstSendMagicMessageWithID : (NSString *) resID;

// 当键盘发送魔法表情的时候，调用此方法，播放魔法表情
-(void) firstSendMagicMessageWithID : (NSString *) resID  withPetID : (NSString *) petID;
// 刷新数据，并设置是否移动到最底层
-(void) refreshMessageData : (CPUIModelMessageGroup *) modelMessageGroup withMove : (BOOL) isMove withAnimated : (BOOL) animated withImportData : (BOOL) isImportData withRefreshMessage : (BOOL) isRefresh;
// 刷新数据，并设置是否移动的最底层 － 优化版
//-(void) refreshMessageData:(CPUIModelMessageGroup *)modelMessageGroup withRefreshType : (refreshType) type;

// 刷新tableView数据,传入聊天消息数据集
//-(void) refreshMessageTable : (CPUIModelMessageGroup *) modelMessageGroup;
// 加载历史消息数据
-(void) loadHistoryMessageData :  (CPUIModelMessageGroup *) modelMessageGroup;
// 加载历史消息数据为空
-(void) loadHIstoryMessageDataIsNull;
// 刷新tableView数据，并且移动到最底层
//-(void) refreshMessageTableToBottom : (BOOL) isMove withAnimated : (BOOL) animated;
// 群组聊天时获得用户头像
-(UIImage *) getUserHeadImage : (NSString *) userName;
// 停止用户播放的语音
-(void) stopSound;
@end


