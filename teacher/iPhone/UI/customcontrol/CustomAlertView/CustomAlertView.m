//
//  CustomAlertView.m
//  iCouple
//
//  Created by shuo wang on 12-5-17.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CustomAlertView.h"
#import "HPStatusBarTipView.h"
@interface CustomAlertView ()

@end

@implementation CustomAlertView

- (id)init{
    self = [super init];
    if (self) {
        // Initialization code
    }
    return self;
}

-(CheckMessageView *) showCheckMessage : (NSString *) messageString withContext:(id)context{
    CheckMessageView *checkMessage = [[CheckMessageView alloc] initWithMessage:messageString withButtonType:ComfirmAndCancel withContext:context];
    return checkMessage;
}

-(CheckMessageView *) showCheckMessage:(NSString *)messageString withButtonType : (AlertButtonType) type withContext:(id)context{
    CheckMessageView *checkMessage = [[CheckMessageView alloc] initWithMessage:messageString withButtonType:type withContext:context];
    return checkMessage;
}

-(MessageBoxView *) showMessageBox:(NSString *)messageString withContext:(id)context{
    MessageBoxView *messageBox = [[MessageBoxView alloc] initWithMessage:messageString withButtonType:ComfirmAndCancel withContext:context];
    return messageBox;
}

-(MessageBoxView *) showMessageBox : (NSString *) messageString withButtonType : (AlertButtonType) type withContext : (id) context{
    MessageBoxView *messageBox = [[MessageBoxView alloc] initWithMessage:messageString withButtonType:type withContext:context];
    return messageBox;
}

-(LoadingView *) showLoadingMessageBox:(NSString *)messageString{
    //2012.9.24 By zq 有菊花的地方隐藏右上角提示
    [HPStatusBarTipView shareInstance].hidden = YES;
    LoadingView *loadingView = [[LoadingView alloc] initWithMessageString:messageString];
    return loadingView;
}

-(LoadingView *) showLoadingMessageBox : (NSString *) messageString withTimeOut : (NSTimeInterval) time{
        //2012.9.24 By zq 有菊花的地方隐藏右上角提示
    [HPStatusBarTipView shareInstance].hidden = YES;
    LoadingView *loadingView = [[LoadingView alloc] initWithMessageString:messageString withTimeOut:time];
    return loadingView;
}
@end
