//
//  KBSmallView.h
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorUtil.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetSmallAnim.h"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
@protocol KBSmallViewDelegate;

@class KBSmallItem;
@interface KBSmallView : UIView
{
    NSArray *_smallData;
    
    KBSmallItem *_item[20];
    UIButton *_deleteButton;
}

@property(nonatomic,assign) id<KBSmallViewDelegate> delagate;
@property(nonatomic,strong) NSArray *smallData;

@end

///////////////////////////////////////////////////////////////////////////////

@protocol KBSmallViewDelegate <NSObject>

-(void)smallTaped:(KBSmallItem *)sender;
-(void)smallDeleteTaped:(UIButton *)sender;

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@interface KBSmallItem : UIButton
{
    
    CPUIModelPetSmallAnim *_smallItemData;
    
    UIImageView *_animImageView;
    UILabel     *_nameLabel;
}

@property (nonatomic,strong) CPUIModelPetSmallAnim *smallItemData;

@property (nonatomic,strong) UIImageView *animImageView;
@property (nonatomic,strong) UILabel     *nameLabel;

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////