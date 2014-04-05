//
//  MessageBoxView.h
//  iCouple
//
//  Created by shuo wang on 12-5-29.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertDelegate.h"

@interface MessageBoxView : UIView
@property (nonatomic,strong) NSString *messageString;
@property (nonatomic,assign) id<CheckMessageDelegate> delegate;
@property (nonatomic,strong) id context;

-(id) initWithMessage : (NSString *)messageString withButtonType : (AlertButtonType) type withContext : (id) context;
@end
