//
//  MessageAskExpressionViewController.h
//  iCouple
//
//  Created by shuo wang on 12-5-18.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimImageView.h"
#import "CPUIModelPetActionAnim.h"
#import "MessageExpressionViewController.h"
#import "ARMicView.h"

typedef enum{
    SendAskQuestion,
    SendAskAnswer,
    ReceiveQuestion,
    ReceiveAnswer
}AskType;

@interface MessageAskExpressionViewController : MessageExpressionViewController<ARMicViewDelegate>
// 偷偷问类型
@property (nonatomic) AskType askType;
// 长按住回答
@property (nonatomic,strong) UIButton *perssAnswerButton;
// 只听答案
@property (nonatomic,strong) UIButton *onlyListenAnswerButton;

-(id) initWithExModel:(ExMessageModel *)exModel;
@end
