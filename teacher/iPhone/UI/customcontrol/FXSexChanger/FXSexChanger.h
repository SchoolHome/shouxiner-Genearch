//
//  FXSexChanger.h
//  Shuangshuang
//
//  Created by 振杰 李 on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerHeader.h"

@protocol FXSexChangerDelegate <NSObject>

-(void)changeSexInfo:(NSInteger)sexval;

@end

@interface FXSexChanger : UIView{
    
    UIImageView *male;
    
    UIImageView *female;
    
    NSInteger sexvalue;
    
    
    id<FXSexChangerDelegate> delegate;
    
}

@property (nonatomic,retain) UIImageView *male;
@property (nonatomic,retain) UIImageView *female;
@property (nonatomic,assign) NSInteger sexvalue;
@property (strong,nonatomic) id<FXSexChangerDelegate> delegate;

@end
