//
//  AlertDelegate.h
//  iCouple
//
//  Created by shuo wang on 12-5-29.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#ifndef iCouple_AlertDelegate_h
#define iCouple_AlertDelegate_h

typedef enum{
    ComfirmAndCancel,
    AccpetAndRefuse,
    DownLoadingSource
}AlertButtonType;

@protocol CheckMessageDelegate <NSObject>

@optional
-(void) clickConfirm : (id) context;
-(void) clickConfirm : (BOOL) isChecked withContext : (id) context;
-(void) clickCancel : (id) context;
@end

@protocol LoadMessageDelegate <NSObject>

@optional
-(void) timeOut;

@end
#endif
