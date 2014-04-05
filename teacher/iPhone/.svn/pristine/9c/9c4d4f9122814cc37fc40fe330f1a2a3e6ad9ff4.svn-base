//
//  CustomAlertView.h
//  iCouple
//
//  Created by shuo wang on 12-5-17.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckMessageView.h"
#import "MessageBoxView.h"
#import "LoadingView.h"

#define TimeOut 20.0f

@interface CustomAlertView : UIView

-(CheckMessageView *) showCheckMessage : (NSString *) messageString withContext : (id) context;

-(CheckMessageView *) showCheckMessage:(NSString *)messageString withButtonType : (AlertButtonType) type withContext:(id)context;

-(MessageBoxView *) showMessageBox : (NSString *) messageString withContext : (id) context;

-(MessageBoxView *) showMessageBox : (NSString *) messageString withButtonType : (AlertButtonType) type withContext : (id) context;

-(LoadingView *) showLoadingMessageBox : (NSString *) messageString;

-(LoadingView *) showLoadingMessageBox : (NSString *) messageString withTimeOut : (NSTimeInterval) time;
@end
