//
//  MessageCellFactory.m
//  iCouple
//
//  Created by yong wei on 12-5-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessageCellFactory.h"

@implementation MessageCellFactory

static MessageCellFactory *factory = nil;


+(MessageCellFactory *) sharedInstance{
    if ( nil == factory ) {
        factory = [[MessageCellFactory alloc] init];
    }
    return factory;
}

// cell工厂
-(ChatInforCellBase *) createMessageCellFactory : (MessageCellType) messageType isBelongMe : (BOOL) belongMe isGroupMessage:(BOOL)isGroup withKey:(NSString *)key{
    
    ChatInforCellBase *base = nil;
    
    switch (messageType) {
        // 图文混排对象
        case UISingleMultiMessageSmallExpression:
            if (isGroup) {
                base = [[GroupSmallExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleSmallExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 图片对象
        case UISingleMultiMessageImage:
            if (isGroup) {
                base = [[GroupImageCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleImageCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 声音对象
        case UISingleMultiMessageSound:
            if (isGroup) {
                base = [[GroupSoundCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleSoundCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 视频对象
        case UISingleMultiMessageVideo:
            if (isGroup) {
                base = [[GroupVideoCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleVideoCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 魔法表情对象
        case UISingleMultiMessageMagicExpression:
            if (isGroup) {
                base = [[GroupMagicExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleMagicExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 传情对象
        case UISingleMultiMessageLoveExpression:
            if (isGroup) {
                base = [[GroupLoveExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleLoveExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 传声对象
        case UISingleMultiMessageSoundExpression:
            if (isGroup) {
                base = [[GroupSoundExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleSoundExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 偷偷问对象
        case UISingleMultiMessageAskExpression:
            if (isGroup) {
                base = [[GroupAskExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleAskExpressionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 系统消息无跳转对象
        case UISingleMultiMessageSystemText:
            if (isGroup) {
                base = [[GroupSystemTextCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleSystemTextCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        // 系统消息有跳转对象
        case UISingleMultiMessageSystemTextAction:
            if (isGroup) {
                base = [[GroupSystemTextActionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleSystemTextActionCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        case UISingleMultiMessageUnKnown:
            if (isGroup) {
                base = [[GroupSystemUnknowCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }else {
                base = [[SingleSystemUnknowCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            }
            break;
        case UISingleMultiMessageTextAlarmExpression:
            base = [[SingleTextAlarmCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            break;
        case UISingleMultiMessageTextAlarmedExpression:
            base = [[SingleTextAlarmedCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            break;
        case UISingleMultiMessageSoundAlarmExpression:
            base = [[SingleSoundAlarmCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            break;
        case UISingleMultiMessageSoundAlarmedExpression:
            base = [[SingleSoundAlarmedCell alloc] initWithType:messageType withBelongMe:belongMe withKey:key];
            break;
        default:
            break;
    }
    
    return base;
}

@end
