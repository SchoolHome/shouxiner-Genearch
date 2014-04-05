//
//  PetActionItem.h
//  Pet_component_dev
//
//  Created by ming bright on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 按钮类型
 */
typedef enum{
    
    PetItemTypeMain,    //主菜单
    PetItemTypeHappy,   //高兴
    PetItemTypeSad,     //不高兴
    PetItemTypeLove,    //爱情
    PetItemTypeAlarm,   //闹钟
    PetItemTypeVoice,   //声音
    PetItemTypeAsk,     //提问
    
    PetItemTypeNone

}PetItemType;


@protocol PetActionItemDelegate;
@interface PetActionItem : UIButton
{
    UIImageView *frontImageView;
    UIImageView *backImageView;
    
    UIImage *frontNormalImage;
    UIImage *frontHighlightedImage;
    
    UIImage *backNormalImage;
    UIImage *backHighlightedImage;
    
    UIImageView *downloadMark;
    BOOL isDownloaded;
    
    int downloadStatus;
    
    BOOL isFront;
    
    BOOL canFlip;
    
    NSString *resourceID;
    
    NSString *senderDesc;
    
}

@property (nonatomic,assign) id<PetActionItemDelegate> delegate;

@property (nonatomic,assign) PetItemType itemType;

@property (nonatomic,strong) UIImage *frontNormalImage;
@property (nonatomic,strong) UIImage *frontHighlightedImage;
@property (nonatomic,strong) UIImage *backNormalImage;
@property (nonatomic,strong) UIImage *backHighlightedImage;
@property (nonatomic,strong) UIImageView *downloadMark;
@property (nonatomic,assign) BOOL isDownloaded;
@property (nonatomic,assign) int downloadStatus;
@property (nonatomic,assign) BOOL canFlip;

@property (nonatomic,strong) NSString *resourceID;
@property (nonatomic,strong) NSString *senderDesc;

-(void)setFrontNormalImage:(UIImage *)image1 
     frontHighlightedImage:(UIImage *)image2 
           backNormalImage:(UIImage *)image3
      backHighlightedImage:(UIImage *)image4;

- (void)flip;

- (void)dismiss;
- (void)show;
@end


@protocol PetActionItemDelegate <NSObject>
@optional
- (void)itemTaped:(id)item;
@end

