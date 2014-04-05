//
//  KBMagicView.h
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorUtil.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetMagicAnim.h"

// 下载状态
#define kMagicItemDataDownloadFinished   @"kMagicItemDataDownloadFinished"
#define kMagicItemDataDownloadStarted    @"kMagicItemDataDownloadStarted"
#define kMagicItemDataDownloadFailed     @"kMagicItemDataDownloadFailed"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@protocol KBMagicViewDelegate;

@class KBMagicItem;
@class KBMagicExtraItem;
@interface KBMagicView : UIView
{
    NSArray *_magicData;
    
    KBMagicItem *_item[7];
    
    KBMagicExtraItem *_extraButton; // 下载按钮
    
    BOOL downloadAllStarted;
}

@property(nonatomic,assign) id<KBMagicViewDelegate> delagate;
@property(nonatomic,strong) NSArray *magicData;

@end

///////////////////////////////////////////////////////////////////////////////

@protocol KBMagicViewDelegate <NSObject>

-(void)magicTaped:(KBMagicItem *)sender;
-(void)extraTaped:(UIButton *)sender;

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@interface KBMagicItem : UIButton
{
    
    CPUIModelPetMagicAnim *_magicItemData;
    
    UIImageView *_background;
    UILabel     *_nameLabel;
    
    UIActivityIndicatorView * _spin;
    
    BOOL _isAvailable; // 是否可用
}
@property(nonatomic,strong) CPUIModelPetMagicAnim *magicItemData;
@property(nonatomic,assign) BOOL isAvailable;

-(void)addSpin;
-(void)removeSpin;

@end
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@interface KBMagicExtraItem : UIButton
{
    UIImageView *_background;
    UILabel     *_nameLabel;
}

-(void)setImage:(UIImage *) image stateText:(NSString *)text;

-(void)setStateNormal;
-(void)setStateLoading;
-(void)setStateMore;
@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////